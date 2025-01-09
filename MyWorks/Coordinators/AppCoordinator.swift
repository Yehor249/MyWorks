//
//  AppCoordinator.swift
//  86SQUAD(MVVM-C)
//
//  Created by Yegor Niedov on 07.01.2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMenu()
    }
    
    func showMenu() {
        let vc = MenuViewController.createObject()
        vc.coordinator = self
        vc.viewModel = MenuViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
//    
//    func showMain(brandNmae: String) {
//        let vc = MainViewController.createObject()
//        let viewModel = MainViewModel()
//        viewModel.barandName = brandNmae
//        vc.coordinator = self
//        vc.viewModel = viewModel
//        //navigationController.viewControllers.removeAll()
//        navigationController.pushViewController(vc, animated: true)
//        
//    }
//    
//    func showDetail() {
//        
//    }
}
