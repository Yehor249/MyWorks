//
//  HomePageBlocks.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//

import Foundation

// MARK: - Data Model for UICollectionView
struct CollectionViewData: BlockData {
    let title: String
    let cellIdentifier: String
    let cells: [HomePageCellData]
}

struct HomePageCellData: Codable {
    let imageName: String
    let title: String
    let description: String
    let price: Double
}

// MARK: - Data Model for UIImageView
struct ImageData: BlockData {
    let imageName: String
}

// MARK: - Main Block Model
struct HomePageBlock: Codable {
    let type: BlockType
    let data: BlockData
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    // MARK: - Custom Decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(BlockType.self, forKey: .type)
        
        switch type {
        case .collectionView:
            data = try container.decode(CollectionViewData.self, forKey: .data)
        case .image:
            data = try container.decode(ImageData.self, forKey: .data)
        }
    }
    
    // MARK: - Custom Encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        
        switch data {
        case let collectionViewData as CollectionViewData:
            try container.encode(collectionViewData, forKey: .data)
        case let imageData as ImageData:
            try container.encode(imageData, forKey: .data)
        default:
            let context = EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unknown BlockData type")
            throw EncodingError.invalidValue(data, context)
        }
    }
}
