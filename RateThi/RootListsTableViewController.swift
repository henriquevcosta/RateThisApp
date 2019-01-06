//
//  RootListsTableViewController.swift
//  RateThi
//
//  Created by Henrique Costa on 06/01/2019.
//  Copyright © 2019 Henrique Costa. All rights reserved.
//

import UIKit
import CoreData

class RootListsTableViewController: UITableViewController {
    
    var ratedLists : [RatedList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchRatedLists()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedList = ratedLists[indexPath.row]
        performSegue(withIdentifier: "moveToListDetail", sender: selectedList)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Swipe for delete
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
    

     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    

    func getContext() -> NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }

    func fetchRatedLists() {
        if let context = getContext(),
            let fetchedResults = try? context.fetch(RatedList.fetchRequest()) as? [RatedList],
            let returnedList = fetchedResults {

            self.ratedLists = returnedList
            self.tableView.reloadData()
        }
    }

    // MARK: - Navigation
    
    // Ensure the next VC has a reference to me
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let addVC = segue.destination as? AddListViewController {
            addVC.previousVC = self
        }
        
        // Pass the selected object to the new view controller.
        if let listDetailVC = segue.destination as? ListDetailViewController {
            if let selectedList = sender as? RatedList {
                listDetailVC.previousVC = self
                listDetailVC.selectedItem = selectedList
            }
        }
    }
    
    
    // MARK: API
    func deleteList(_ toDelete : RatedList) {

        
        self.ratedLists.removeAll { $0.name == toDelete.name }
        self.tableView.reloadData()
    }

}
