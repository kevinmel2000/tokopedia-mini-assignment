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
        
        productFilter?.setMinimum(price: Int(textField.text!)!)
        productFilter?.setMaximum(price: 99999)
        productFilter?.show(wholesale: true)
        productFilter?.showShop(type: "Gold Merchant")
        
        dismiss(animated: true, completion: nil)
    }
    
}
