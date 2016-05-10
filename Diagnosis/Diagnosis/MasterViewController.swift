//
//  MasterViewController.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UIViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

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

    
    // MARK: - Segues
    
    func goToHistory(sender: AnyObject) {
        self.performSegueWithIdentifier("masterToDetailSegue", sender: self)
    }

}

