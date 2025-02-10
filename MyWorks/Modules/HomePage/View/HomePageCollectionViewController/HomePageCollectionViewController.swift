//
//  HomePageCollectionViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//
import UIKit

class HomePageCollectionViewController: UICollectionViewController {
    
    var collectionViewData: CollectionViewData!
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(
            UINib(nibName: HomePageCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: HomePageCollectionViewCell.reuseIdentifier
        )
        setupUI()
    }
}


extension HomePageCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.cells.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView!.dequeueReusableCell(
            withReuseIdentifier: HomePageCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as! HomePageCollectionViewCell
        
        let cellData = collectionViewData.cells[indexPath.item]
        cell.configure(with: cellData)
        
        return cell
    }
    
    func setupUI() {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 150, height: 225)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.scrollDirection = .horizontal
        }
    }
    
    
}

