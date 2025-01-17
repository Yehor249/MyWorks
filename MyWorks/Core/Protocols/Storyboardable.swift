//
//  Storyboardable.swift
//  86SQUAD(MVVM-C)
//
//  Created by Yegor Niedov on 07.01.2025.
//

import UIKit

protocol Storyboardable {
    static func createObject() -> Self
}

extension Storyboardable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: id, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
