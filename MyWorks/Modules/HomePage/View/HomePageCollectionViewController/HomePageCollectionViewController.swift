//
//  HomePageCollectionViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//
import UIKit

class HomePageCollectionViewController: UICollectionViewController {
    
    var collectionViewData: CollectionViewData! 
    
    init() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
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
}
