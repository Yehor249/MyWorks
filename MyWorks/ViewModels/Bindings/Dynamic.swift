//
//  Dynamic.swift
//  86SQUAD(MVVM-C)
//
//  Created by Yegor Niedov on 07.01.2025.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
        
    init(_ v: T) {
        value = v
    }
}
