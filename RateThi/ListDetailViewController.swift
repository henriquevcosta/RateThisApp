//
//  ListDetailViewController.swift
//  RateThi
//
//  Created by Henrique Costa on 06/01/2019.
//  Copyright © 2019 Henrique Costa. All rights reserved.
//

import UIKit

// TODO should be UITableViewController
class ListDetailViewController: UIViewController {

    var previousVC : RootListsTableViewController = RootListsTableViewController()

    var selectedItem : RatedList? = nil

    @IBOutlet weak var listNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let list = selectedItem {
            listNameLabel.text = list.name
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteList(_ sender: Any) {
        if let list = selectedItem {
            previousVC.deleteList(list)
            navigationController?.popViewController(animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
