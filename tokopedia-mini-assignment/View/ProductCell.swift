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
        
        // NOTE: Cell's rounded corner
        // layer.cornerRadius = 5.0
    }
    
    func configure(product : Product) {
        
        self.product = product
        
        name.text = product.name
        price.text = product.price
        
        DispatchQueue.global().async {
            
            if let data = try? Data(contentsOf: URL(string: product.imageUri)!) {
                
                DispatchQueue.main.async {
                    
                    self.thumbnail.image = UIImage(data: data)
                }
            }
        }
    }
}
