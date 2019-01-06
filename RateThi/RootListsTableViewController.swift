//
//  RootListsTableViewController.swift
//  RateThi
//
//  Created by Henrique Costa on 06/01/2019.
//  Copyright © 2019 Henrique Costa. All rights reserved.
//

import UIKit

class RootListsTableViewController: UITableViewController {

    var ratedLists : [RatedList] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        ratedLists = createDummyItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ratedLists.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratedListsIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = ratedLists[indexPath.row].name

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // Ensure the next VC has a reference to me
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let addVC = segue.destination as! AddListViewController
        addVC.previousVC = self
    }


    // MARK: API
    func addNewList(_ newList : RatedList) {
        self.ratedLists.append(newList)
        self.tableView.reloadData()
    }

    // TODO Remove
    func createDummyItems() -> [RatedList] {

        let eggs = RatedList()
        eggs.name = "Buy eggs"
        eggs.important = false

        let dog = RatedList()
        dog.name = "Walk dog"
        dog.important = true

        return [eggs, dog]
    }
}
