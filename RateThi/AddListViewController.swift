//
//  AddListViewController.swift
//  RateThi
//
//  Created by Henrique Costa on 06/01/2019.
//  Copyright © 2019 Henrique Costa. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

    var previousVC = RootListsTableViewController()

    @IBOutlet weak var newListName: UITextField!

    @IBOutlet weak var isImportantSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        let newList = RatedList()
        newList.name = newListName.text!
        newList.important = isImportantSwitch.isOn

        previousVC.addNewList(newList)
        
        navigationController?.popViewController(animated: true)
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
