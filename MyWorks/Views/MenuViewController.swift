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
    
    let cellTitles = AppConstants.tableCellTitles
    
    var viewModel: MenuViewModel?
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CustomTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
        
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }


}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.commonInit(cellTitles[indexPath.row])
        return cell
    }
    
    
}

