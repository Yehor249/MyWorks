//
//  Cell.swift
//  MyWorks
//
//  Created by Yegor Niedov on 09.01.2025.
//

import Foundation

struct Cell {
    let name: String
}

extension Cell {
    static var allCells: [Cell] = {
        guard let titles = Bundle.main.object(forInfoDictionaryKey: "TableCellTitles") as? [String] else {
            fatalError("TableCellTitles not found in Info.plist")
        }
        return titles.map { Cell(name: $0) }
    }()
}
