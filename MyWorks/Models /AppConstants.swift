//
//  AppConstants.swift
//  MyWorks
//
//  Created by Yegor Niedov on 10.01.2025.
//

import Foundation

struct AppConstants {
    static let tableCellTitles: [String] = {
        guard let titles = Bundle.main.object(forInfoDictionaryKey: "TableCellTitles") as? [String] else {
            fatalError("TableCellTitles not found in Info.plist")
        }
        return titles
    }()
}
