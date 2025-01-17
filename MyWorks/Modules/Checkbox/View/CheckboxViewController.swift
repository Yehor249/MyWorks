//
//  CheckboxViewController.swift
//  MyWorks
//
//  Created by Yegor Niedov on 13.01.2025.
//

import UIKit

class CheckboxViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var label: UILabel!
    
    var viewModel: CheckboxViewModel!
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "To do!"
    }
    
    @IBAction func checkboxChanged(_ sender: Checkbox) {
        label.text = sender.checked ? "Done!" : "To do!"
    }
}
