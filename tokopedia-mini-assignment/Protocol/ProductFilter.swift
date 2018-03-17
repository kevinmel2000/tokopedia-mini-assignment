//
//  FilterApply.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import Foundation

protocol ProductFilter {
    
    func setMinimum (price : Int)
    func setMaximum (price : Int)
    func show (wholesale : Bool)
    func showShop (type : String)
}
