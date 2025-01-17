//
//  ViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 09.01.2025.
//

import UIKit

class MenuViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MenuViewModel?
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MenuTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        
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
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.allCells.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier, for: indexPath) as! MenuTableViewCell
        
        if let cellData = viewModel?.allCells.value[indexPath.row] {
            cell.configure(cellData.name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell = viewModel?.allCells.value[indexPath.row]
        
        coordinator?.showCell(cellName: selectedCell?.name ?? "")
    }
    
}

