//
//  ProductModel.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import Foundation

class Product {
    
    private var _id : Int!
    private var _uri : String!
    private var _name : String!
    private var _price : String!
    private var _imageUri : String!
    private var _imageUri700 : String!
    
    init(id : Int,
         name : String,
         price : String,
         imageUri : String) {
        
        self.id = id
        self.name = name
        self.price = price
        self.imageUri = imageUri
    }
    
    var id : Int {
        get {
            return _id
        }
        set(id) {
            _id = id
        }
    }
    
    var uri : String {
        get {
            return _uri
        }
        set(uri) {
            _uri = uri
        }
    }
    
    var name : String {
        get {
            return _name
        }
        set(name) {
            _name = name
        }
    }
    
    var price : String {
        get {
            return _price
        }
        set(price) {
            _price = price
        }
    }
    
    var imageUri : String {
        get {
            return _imageUri
        }
        set(imageUri) {
            _imageUri = imageUri
        }
    }
    
    var imageUri700 : String {
        get {
            return _imageUri700
        }
        set(imageUri700) {
            _imageUri700 = imageUri700
        }
    }
}

