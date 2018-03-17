//
//  SearchPageProductFilter.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 18/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

extension SearchPage: ProductFilter {
    
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
}
