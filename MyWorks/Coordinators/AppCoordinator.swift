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
    
    // MARK: - Start
    func start() {
        showMain()
    }
    
    // MARK: - Navigate
    func showCell(cellName: String) {
        switch cellName {
        case Cell.allCells.first?.name:
            showSearch()
        default
            : break // temp
        }
    }
    
    // MARK: - Show Screens
    private func showMain() {
        let viewModel = MainViewModel()
        let viewController = MainViewController.createObject()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Show Screens
    private func showSearch() {
        let viewModel = SearchViewModel()
        let viewController = SearchViewController.createObject()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showCheckbox() {
        let viewModel = CheckboxViewModel()
        let viewController = CheckboxViewController.createObject()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
