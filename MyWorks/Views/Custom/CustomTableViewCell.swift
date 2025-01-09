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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.label.text = "Logo"
    }
    
    func commonInit(_ text: String) {
        self.label.text = text
    }
}
