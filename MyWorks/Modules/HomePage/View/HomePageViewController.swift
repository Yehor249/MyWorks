//
//  HomePageViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 21.01.2025.
//

import UIKit

class HomePageViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelLogo: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var viewModel: HomePageViewModel!
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMockData()
        createBlocks()
        
    }
    
}

extension HomePageViewController {
    
    private func createBlocks() {
        for block in viewModel.homePageBlocks {
            switch block.type {
            case .collectionView:
                if let data = block.data as? CollectionViewData {
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = .horizontal // Горизонтальная прокрутка
                    layout.itemSize = CGSize(width: 150, height: 200) // Размер ячейки
                    layout.minimumLineSpacing = 10
                    layout.minimumInteritemSpacing = 10
                    
                    let collectionVC = HomePageCollectionViewController(collectionViewLayout: layout)
                    collectionVC.collectionViewData = data
                    addChild(collectionVC)
                    
                    let containerView = UIView()
                    containerView.translatesAutoresizingMaskIntoConstraints = false
                    containerView.heightAnchor.constraint(equalToConstant: 220).isActive = true // Высота контейнера
                    containerView.backgroundColor = .gray
                    
                    stackView.addArrangedSubview(containerView)
                    containerView.addSubview(collectionVC.collectionView)
                    
                    let collectionView = collectionVC.collectionView!
                    collectionView.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([
                        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
                        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
                        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
                    ])
                    
                    collectionVC.didMove(toParent: self)
                }
            case .image:
                continue
            }
        }
    }
}
