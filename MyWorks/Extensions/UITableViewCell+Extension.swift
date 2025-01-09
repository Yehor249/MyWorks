//
//  UITableViewCell+Extension.swift
//  MyWorks
//
//  Created by Yegor Niedov on 09.01.2025.
//

import Foundation

extension CustomTableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
