//
//  NewsTableViewController.swift
//  SimpleRSSReader
//
//  Created by Simon Ng on 26/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableView.automaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 0
    }

}
