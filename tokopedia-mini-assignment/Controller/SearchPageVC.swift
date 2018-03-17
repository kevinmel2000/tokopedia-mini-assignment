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

class SearchPageVC: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    
    let API_URL = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10"
    
    let params : [String : Any] = [
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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getProductsFromApi(url: API_URL, parameters: params)
    }
    
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
        
        print(productModel.name)
    }

}

