//
//  DetailViewController.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class DetailViewController: UITableViewController {
    
    @IBOutlet var logTableView: UITableView!
    
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
        fetchFromCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchFromCoreData(){
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

    func refreshFromServer(sender: AnyObject) {
        Alamofire.request(.GET, Constants().refreshDiagnosis())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success(let JSON):
                    //Delete all existing core data
                    CommonFunctions().deleteAllData("LogItem")
                    
                    //Add all from server response to core data
                    let res = JSON as! [NSDictionary]
                    for r: NSDictionary in res{
                        self.addItem(r.objectForKey("name")! as! String, age: r.objectForKey("age")! as! String, result: r.objectForKey("result")! as! String)
                    }
                    
                    //Fetch all & reload
                    self.fetchFromCoreData()
                    self.logTableView.reloadData()
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                    
                case .Failure(let error):
                    print(error)
                    // Create an Alert, and set it's message to whatever the itemText is
                    let alertController = UIAlertController(title: "Server Error", message: "Kindly check internet connection", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    // Display the alert
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
        }
    }
    
    func addItem(name: String, age: String, result: String){
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: self.managedObjectContext) as! LogItem
        newItem.name = name
        newItem.age = age
        newItem.result = result

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

