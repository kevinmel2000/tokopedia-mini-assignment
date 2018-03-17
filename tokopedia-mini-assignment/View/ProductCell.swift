//
//  ProductCell.swift
//  tokopedia-mini-assignment
//
//  Created by R. Kukuh on 18/03/18.
//  Copyright © 2018 R. Kukuh. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var product : Product!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //layer.cornerRadius = 5.0
    }
    
    func configureCell(product : Product) {
        
        self.product = product
        
        name.text = product.name
        price.text = product.price
        thumbnail.image = UIImage(named: product.image)
    }
}
