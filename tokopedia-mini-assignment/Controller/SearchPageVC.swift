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

class SearchPageVC: UIViewController, ProductFilter {
    
    // MARK: - Outlets

    @IBOutlet weak var productName: UILabel!
    
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
    
    let productModel = Product()
    
    // MARK: - General Functions

    override func viewDidLoad() {

        super.viewDidLoad()
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    // MARK: - Actions
    
    @IBAction func nextPage(_ sender: Any) {
        
        performSegue(withIdentifier: "gotoFilterPage", sender: self)
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoFilterPage" {
            
            let destination = segue.destination as! FilterPageVC
            
            destination.productFilter = self
        }
    }
    
    // MARK: - Protocol Stubs
    
    func setMinimum(price: Int) {
        
        parameters.updateValue(price, forKey: "pmin")
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    func setMaximum(price: Int) {
        
        parameters.updateValue(price, forKey: "pmax")
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    func show(wholesale: Bool) {
        
        parameters.updateValue(wholesale, forKey: "wholesale")
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    func show(official: Bool) {
        
        parameters.updateValue(official, forKey: "official")
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    func showShop(type: ShopType) {
        
        parameters.updateValue(type, forKey: "fshop")
        
        getProductsFromApi(url: API_URL, parameters: parameters)
    }
    
    // MARK: - Helpers
    
    func getProductsFromApi(url: String, parameters: [String : Any]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            (response) in
            
            if response.result.isSuccess {
                
                let productsJSON : JSON = JSON(response.result.value!)
                
                self.updateProductList(json: productsJSON)
                
            } else {
                
                print("ERROR: \(String(describing: response.result.error))")
            }
        }
    }
    
    func updateProductList(json : JSON) {
        
        productModel.name = json["data"][0]["name"].stringValue
        
        productName.text = productModel.name
    }

}

