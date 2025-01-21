//
//  MainViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 20.01.2025.
//

import UIKit

class MainViewController: UIViewController, Storyboardable {
    
    var viewModel: MainViewModel!
    var coordinator: AppCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: Bind
    func bindViewModel(){
        viewModel?.allCells.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.allCells.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as! MainTableViewCell
        
        if let cellData = viewModel?.allCells.value[indexPath.row] {
            cell.configure(cellData.name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell = viewModel?.allCells.value[indexPath.row]
        
        coordinator?.showCell(cellName: selectedCell?.name ?? "")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

