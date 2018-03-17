//
//  FilterPageVC.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

class FilterPageVC: UIViewController {
    
    // MARK: - Variables and Constants
    
    var productFilter : ProductFilter?
    
    // MARK: - Outlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func prevPage(_ sender: Any) {
        
        productFilter?.setMinimum(price: 11111)
        productFilter?.setMaximum(price: 99999)
        
        productFilter?.show(wholesale: false)
        productFilter?.show(official: false)
        
        productFilter?.showShop(type: ShopType.SILVER_SELLER)
        
        dismiss(animated: true, completion: nil)
    }
    
}
