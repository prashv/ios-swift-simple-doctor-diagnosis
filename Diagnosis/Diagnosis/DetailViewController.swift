//
//  DetailViewController.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UITableViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var fetchResults: [LogItem] = []

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(DetailViewController.refreshFromServer(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        let entity = NSEntityDescription.entityForName("LogItem", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.entity = entity
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        do {
            fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [LogItem]
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshFromServer(sender: AnyObject) {
        
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResults.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("logCell", forIndexPath: indexPath) as! LogTableViewCell
        
        cell.name?.text = fetchResults[indexPath.row].name!
        cell.age?.text = fetchResults[indexPath.row].age! + "yrs"
        cell.result?.text = fetchResults[indexPath.row].result! + "%"
        
        return cell
    }
}

