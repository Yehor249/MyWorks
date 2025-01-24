//
//  MainTableViewCell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 20.01.2025.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 5
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func configure(_ text: String?) {
        label.text = text?.isEmpty == false ? text : "I'm cell ;)"
    }
    
}
