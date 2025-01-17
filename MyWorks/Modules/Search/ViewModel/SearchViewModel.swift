//
//  SearchViewModel.swift
//  MyWorks
//
//  Created by Yegor Niedov on 17.01.2025.
//

import Foundation
import UIKit

class SearchViewModel {
    var filteredBrands: Observable<[Brand]> = Observable([])
    var searchHistory: Observable<[String]> = Observable([])
    
    private let allBrands = Brand.allBrands
    
    init() {
        filteredBrands.value = allBrands
        searchHistory.value = []
    }
    
    func searchTextFieldDidChange(_ searchText: String) {
        if searchText.isEmpty {
            filteredBrands.value = allBrands
        } else {
            filteredBrands.value = allBrands.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
        }
    }
    
    func addToSearchHistory(_ text: String) {
        if !searchHistory.value.contains(text) {
            searchHistory.value.append(text)
        }
    }
    
    func getHighlightedText(for text: String, with searchText: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        let range = (text.lowercased() as NSString).range(of: searchText.lowercased())
        
        if range.location != NSNotFound {
            attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 17)], range: range)
        }
        
        return attributedText
    }
}
