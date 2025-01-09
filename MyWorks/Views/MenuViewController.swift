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
        
        tableView.register(UINib(nibName: CustomTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }


}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
    
        return cell
    }
    
    
}

