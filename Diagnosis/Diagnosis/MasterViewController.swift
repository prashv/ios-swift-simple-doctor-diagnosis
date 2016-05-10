//
//  MasterViewController.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import UIKit
import CoreData
import DLRadioButton

class MasterViewController: UIViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var submitButton: UIButton!
    var detailViewController: DetailViewController? = nil
    
    var isMale = -1
    var hasMigraines = -1
    var usesDrugs = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        error.hidden = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(MasterViewController.goToHistory(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        error.hidden = true
        if (name.text!.isEmpty){
            error.text = "Kindly enter your name"
            error.hidden = false
        } else if (age.text!.isEmpty){
            error.text = "Kindly enter your age"
            error.hidden = false
        } else if(isMale == -1){
            error.text = "Kindly select sex"
            error.hidden = false
        } else if (hasMigraines == -1) {
            error.text = "Kindly select migraines history"
            error.hidden = false
        } else if (usesDrugs == -1) {
            error.text = "Kindly select drugs history"
            error.hidden = false
        } else {
            let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: self.managedObjectContext) as! LogItem
            newItem.name = name.text
            newItem.age = age.text
            newItem.isMale = String(isMale)
            newItem.hasMigraines = String(hasMigraines)
            newItem.usesDrugs = String(usesDrugs)
            newItem.result = String(50)
            
            let title = "Result"
            let message = "Probability of T odd’s Syndrome : " + newItem.result! + "%"
            
            // Create an Alert, and set it's message to whatever the itemText is
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            // Display the alert
            self.presentViewController(alertController, animated: true, completion: nil)

        }
    }
    
    
    // MARK: - RadioButton Actions

    @IBAction func chooseDrugsNo(sender: AnyObject) {
        usesDrugs = 0
    }
    @IBAction func chooseDrugsYes(sender: AnyObject) {
        usesDrugs = 1
    }
    @IBAction func chooseMigrainesNo(sender: AnyObject) {
        hasMigraines = 0
    }
    @IBAction func chooseMigrainesYes(sender: AnyObject) {
        hasMigraines = 1
    }
    @IBAction func chooseFemale(sender: AnyObject) {
        isMale = 0
    }
    @IBAction func chooseMale(sender: AnyObject) {
        isMale = 1
    }
    
    // MARK: - Segues
    
    func goToHistory(sender: AnyObject) {
        self.performSegueWithIdentifier("masterToDetailSegue", sender: self)
    }

}

