//
//  CustomTableViewCell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 09.01.2025.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(_ text: String) {
        self.label.text = text
    }
}
