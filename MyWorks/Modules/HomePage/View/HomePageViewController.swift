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
    
    private func createBlocks() {
        for block in viewModel.homePageBlocks {
            let blockView: UIView
            
            switch block.type {
            case .collectionView:
                if let data = block.data as? CollectionViewData {
                    blockView = createCollectionViewBlock(data: data)
                } else {
                    continue
                }
//            case .image:
//                if let data = block.data as? ImageData {
//                    blockView = createImageViewBlock(data: data)
//                } else {
//                    continue
//                }
            case .image:
                continue
            }
            
            stackView.addArrangedSubview(blockView)
        }
    }
}

extension HomePageViewController {
    
    func createCollectionViewBlock(data: CollectionViewData) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = data.title
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        let collectionVC = HomePageCollectionViewController()
        collectionVC.collectionViewData = data
        addChild(collectionVC)
        
        let collectionView = collectionVC.collectionView!
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        containerView.addSubview(label)
        containerView.addSubview(collectionView)
        collectionVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
}
