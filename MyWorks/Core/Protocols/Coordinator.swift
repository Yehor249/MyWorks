//
//  Coordinator.swift
//  86SQUAD(MVVM-C)
//
//  Created by Yegor Niedov on 07.01.2025.
//
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
