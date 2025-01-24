//
//  HomePageCollectionViewCell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Configure Cell
    func configure(with data: HomePageCellData) {
        image.image = UIImage(named: data.imageName)
        labelTitle.text = data.title
        textDescription.text = data.description
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        labelPrice.text = formatter.string(from: NSNumber(value: data.price)) ?? "$0.00"
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        textDescription.isEditable = false
        textDescription.isScrollEnabled = false
        textDescription.textContainerInset = .zero
        textDescription.textContainer.lineFragmentPadding = 0
    }
}

