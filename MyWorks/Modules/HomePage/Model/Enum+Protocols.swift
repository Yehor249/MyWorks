//
//  Enum+Protocols.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//

import Foundation

// MARK: - Block Type Enum
enum BlockType: String, Codable {
    case collectionView = "UICollectionView"
    case image = "UIImage"
}

// MARK: - Block Data Protocol
protocol BlockData: Codable {}
