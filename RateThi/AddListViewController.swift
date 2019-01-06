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
        if let name = newListName.text {
            if let context = previousVC.getContext() {
                let newList = RatedList(context: context)
                newList.name = name
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        } else {
            print("Bugger, null name from text box")
            return
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
