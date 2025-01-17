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
        showMenu()
    }
    
    // MARK: - Navigate
    func showCell(cellName: String) {
        switch cellName {
        case Cell.allCells.first?.name:
            showCheckbox()
        default
            : break // temp
        }
    }
    
    // MARK: - Show Screens
    private func showMenu() {
        let viewModel = MenuViewModel()
        let viewController = MenuViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showCheckbox() {
        let viewModel = CheckboxViewModel()
        let viewController = CheckboxViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
