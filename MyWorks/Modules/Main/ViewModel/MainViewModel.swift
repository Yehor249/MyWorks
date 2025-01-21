//
//  MainViewModel.swift
//  MyWorks
//
//  Created by Yegor Niedov on 20.01.2025.
//

import Foundation
import UIKit

class MainViewModel {
    
    var allCells: Observable<[Cell]> = Observable([])
    
    private let allModelCells = Cell.allCells
    
    init() {
        allCells.value = allModelCells
    }
}
