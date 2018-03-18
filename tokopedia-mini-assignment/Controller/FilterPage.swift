//
//  FilterPageVC.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

class FilterPage: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var maxPrice: UITextField!
    
    // MARK: - Variables and Constants
    
    var productFilter : ProductFilter?
    
    // MARK: - General Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func applyDidTouched(_ sender: Any) {
        
        productFilter?.setMinimum(price: 111111)
        productFilter?.setMaximum(price: 999999)
        
        productFilter?.show(wholesale: false)
        productFilter?.show(official: false)
        
        productFilter?.showShop(type: ShopType.SILVER_MERCHANT)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetDidTouched(_ sender: Any) {
        
        productFilter?.setMinimum(price: 10000)
        productFilter?.setMaximum(price: 100000)
        
        productFilter?.show(wholesale: true)
        productFilter?.show(official: true)
        
        productFilter?.showShop(type: ShopType.GOLD_MERCHANT)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeDidTouched(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
