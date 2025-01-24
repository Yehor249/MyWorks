//
//  HomePageViewModel.swift
//  MyWorks
//
//  Created by Yegor Niedov on 24.01.2025.
//

import Foundation

class HomePageViewModel {
    var homePageBlocks: [HomePageBlock] = []

    func loadMockData() {
        let jsonString = """
        [
            {
                "type": "UICollectionView",
                "data": {
                    "title": "Featured Products",
                    "cellIdentifier": "HomePageCollectionViewCell",
                    "cells": [
                        {
                            "imageName": "product1",
                            "title": "Product 1",
                            "description": "Description of product 1",
                            "price": 10.0
                        },
                        {
                            "imageName": "product2",
                            "title": "Product 2",
                            "description": "Description of product 2",
                            "price": 20.0
                        }
                    ]
                }
            },
            {
                "type": "UIImage",
                "data": {
                    "imageName": "mainBanner"
                }
            }
        ]
        """

        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Error: Unable to convert JSON string to Data")
            return
        }

        do {
            homePageBlocks = try JSONDecoder().decode([HomePageBlock].self, from: jsonData)
            print("Loaded blocks: \(homePageBlocks)")
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
