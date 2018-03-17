//
//  FilterPageVC.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 17/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

class FilterPageVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var dataPassedOver : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        label.text = dataPassedOver
    }

}
