//
//  FilterPageVC.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

protocol FilterApplyDelegate {
    func userSetMinimunPrice (price : String)
}

class FilterPageVC: UIViewController {
    
    // MARK: - Variables and Constants
    
    var delegate : FilterApplyDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func prevPage(_ sender: Any) {
        
        delegate?.userSetMinimunPrice(price: textField.text!)
        
        dismiss(animated: true, completion: nil)
    }
    
}
