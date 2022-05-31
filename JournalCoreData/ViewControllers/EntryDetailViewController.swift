//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/31/22.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextField: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        if let entry = entry {
            titleTextField.text = entry.title
            bodyTextField.text = entry.bodyText
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        bodyTextField.text = ""
        titleTextField.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let title = titleTextField.text, let body = bodyTextField.text {
            if let entry = entry {
                EntryController.shared.updateEntries(entry: entry, title: title, body: body)
            } else {
                EntryController.shared.createEntry(title: title, bodyText: body)
            }
        }
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
