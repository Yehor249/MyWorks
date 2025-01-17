//
//  SearchTableViewCell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 17.01.2025.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ text: String) {
        self.label.text = text
    }
}
