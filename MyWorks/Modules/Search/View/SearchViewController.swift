//
//  SearchViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 17.01.2025.
//

import UIKit

class SearchViewController: UIViewController, Storyboardable {
    
    var viewModel: SearchViewModel?
    var coordinator: AppCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var searchFieldView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: SearchTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: SearchCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        
        searchFieldView.layer.cornerRadius = 6
        searchFieldView.layer.shadowOpacity = 0.5
        searchFieldView.layer.shadowOffset = .zero
        
        textField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        
        bindViewModel()
        
        tableView.rowHeight = 60
        tableView.isHidden = true
    }
    
    func bindViewModel() {
        viewModel?.filteredBrands.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel?.searchHistory.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    @objc func searchTextChanged(_ sender: UITextField) {
        let searchText = sender.text ?? ""
        viewModel?.searchTextFieldDidChange(searchText)
        
        if searchText.isEmpty {
            tableView.isHidden = true
            collectionView.isHidden = false
        } else {
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.filteredBrands.value.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        let brand = viewModel?.filteredBrands.value[indexPath.row]
        
        if let name = brand?.name, let searchText = textField.text, !searchText.isEmpty {
            cell.label.attributedText = viewModel?.getHighlightedText(for: name, with: searchText)
        } else {
            cell.label.text = brand?.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBrand = viewModel?.filteredBrands.value[indexPath.row]
        
        if let brandName = selectedBrand?.name {
            viewModel?.addToSearchHistory(brandName)
            textField.text = brandName
        }
        
        //coordinator?.showMain(brandNmae: selectedBrand?.name ?? "")
    }
    
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel?.searchHistory.value.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as! SearchCollectionViewCell
        
        let historyItem = viewModel?.searchHistory.value[indexPath.item]
        cell.label.text = historyItem
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 50)
    }
}
