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
    
    @IBOutlet weak var wholesale: UISwitch!
    @IBOutlet weak var goldMerchant: UISwitch!
    @IBOutlet weak var officialStore: UISwitch!
    
    // MARK: - Variables and Constants
    
    let defaultMinPrice : Int = 10000
    let defaultMaxPrice : Int = 100000
    
    var productFilter : ProductFilter?
    
    // MARK: - General Functions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    
    @IBAction func applyDidTouched(_ sender: Any) {
        
        if !(minPrice.text?.isEmpty)! {
            productFilter?.setMinimum(price: Int(minPrice.text!)!)
        } else {
            productFilter?.setMinimum(price: defaultMinPrice)
        }
        
        if !(maxPrice.text?.isEmpty)! {
            productFilter?.setMaximum(price: Int(maxPrice.text!)!)
        } else {
            productFilter?.setMaximum(price: defaultMaxPrice)
        }
        
        productFilter?.show(wholesale: wholesale.isOn)
        productFilter?.show(official: officialStore.isOn)
        
        if goldMerchant.isOn {
            productFilter?.showShop(type: ShopType.GOLD_MERCHANT)
        } else {
            //
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetDidTouched(_ sender: Any) {
        
        productFilter?.setMinimum(price: defaultMinPrice)
        productFilter?.setMaximum(price: defaultMaxPrice)
        
        productFilter?.show(wholesale: true)
        productFilter?.show(official: true)
        
        productFilter?.showShop(type: ShopType.GOLD_MERCHANT)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeDidTouched(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}
