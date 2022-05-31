//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/31/22.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    //    @IBOutlet var titleLabel: UILabel!
    //    @IBOutlet var timestampLabel: UILabel!
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.requestEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = EntryController.shared.entries[indexPath.row].title
        let time = EntryController.shared.entries[indexPath.row].timestamp
        content.secondaryText = DateFormatter.entryTime.string(from: time ?? Date())
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showEntry",
        let indexPath = tableView.indexPathForSelectedRow,
        let destination = segue.destination as? EntryDetailViewController {
            let entry = EntryController.shared.entries[indexPath.row]
            destination.entry = entry
        }
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
