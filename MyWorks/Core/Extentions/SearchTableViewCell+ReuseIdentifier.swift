//
//  SearchTableViewCell+ReuseIdentifier.swift
//  MyWorks
//
//  Created by Yegor Niedov on 21.01.2025.
//

import Foundation

extension SearchTableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

