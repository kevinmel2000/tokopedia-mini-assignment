//
//  ViewController.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchPage: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collection: UICollectionView!
    
    // MARK: - Variables and Constants
    
    let API_URL = "https://ace.tokopedia.com/search/v2.5/product"
    
    var parameters : [String : Any] = [
        "q" : "samsung",
        "pmin" : "10000",
        "pmax" : "100000",
        "wholesale" : true,
        "official" : true,
        "fshop" : "2",
        "start" : "0",
        "rows" : "10"
    ]
    
    var products = [Product]()
    
    // MARK: - General Functions

    override func viewDidLoad() {

        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    // MARK: - Actions
    
    @IBAction func nextPage(_ sender: Any) {
        
        performSegue(withIdentifier: "gotoFilterPage", sender: self)
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoFilterPage" {
            
            if let destination = segue.destination as? FilterPage {
                
                destination.productFilter = self
            }
        }
    }
    
    // MARK: - Helpers
    
    func getProductsFromApi(url: String, parameters: [String : Any]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            (response) in
            
            if response.result.isSuccess {
                
                let productsJSON : JSON = JSON(response.result.value!)
                
                // print(productsJSON["data"])
                
                for (_, data) : (String, JSON) in productsJSON["data"] {
                    
                    self.products.append(Product(id: data["id"].intValue,
                                            name: data["name"].stringValue,
                                            price: data["price"].stringValue,
                                            imageUri: data["image_uri"].stringValue))
                }
                
                print("self")
                print(self.products[1].name)
                
            } else {
                
                print("ERROR: \(String(describing: response.result.error))")
            }
        }
        
        print("non-self")
        print(products)
    }

}
