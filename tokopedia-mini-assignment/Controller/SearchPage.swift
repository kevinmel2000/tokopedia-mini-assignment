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
    
    // MARK: - Segues
    
    @IBAction func nextPage(_ sender: Any) {
        
        performSegue(withIdentifier: "gotoFilterPage", sender: self)
    }
    
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
                
                self.products.removeAll()
                
                let productsJSON : JSON = JSON(response.result.value!)
                
                if (productsJSON["data"].isEmpty) {
                    
                    let alert = UIAlertController(title: "INFO",
                                                  message: "Tidak ditemukan produk dari filter yang Anda buat.",
                                                  preferredStyle: .alert)
                    
                    let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alert.addAction(OkAction)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                for (_, data) : (String, JSON) in productsJSON["data"] {
                    
                    self.addProduct(data)
                }
                
                DispatchQueue.main.async {
                    self.collection?.reloadData()
                }
                
            } else {
                
                print("ERROR: \(String(describing: response.result.error))")
            }
        }
        
    }
    
    func addProduct(_ data : JSON) {
        
        let product = Product(id: data["id"].intValue,
                              name: data["name"].stringValue,
                              price: data["price"].stringValue,
                              imageUri: data["image_uri"].stringValue)
        
        products.append(product)
    }

}
