//
//  SampleTableViewController.swift
//  UserDefaultsSample
//
//  Created by ueda seigo on 2018/11/28.
//  Copyright © 2018年 seigo ueda. All rights reserved.
//

import UIKit

class SampleTableViewController: UITableViewController {

    private let breakTimeDao = BreakTimeDao()
    private var breakTimes = [BreakTime]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        breakTimes = breakTimeDao.get()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breakTimes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        cell.textLabel?.text = dateFormatter.string(from: Date(timeIntervalSince1970: breakTimes[indexPath.row].time))

        return cell
    }

    @IBAction func tapAdd(sender: UIBarButtonItem) {
        var breakTime = BreakTime()
        breakTime.id = UUID().uuidString
        breakTime.time = Date().timeIntervalSince1970

        breakTimes.append(breakTime)

        breakTimeDao.set(breakTimes: breakTimes)

        tableView.reloadData()
    }

}
