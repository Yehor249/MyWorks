//
//  SearchCollectionViewCell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 17.01.2025.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCollectionCell: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isUserInteractionEnabled = true
        
        viewCollectionCell.translatesAutoresizingMaskIntoConstraints = false
        
        viewCollectionCell.clipsToBounds = true
        viewCollectionCell.layer.cornerRadius = 5
    }
    
    func commonInit(_ text: String) {
        self.label.text = text
    }
}
