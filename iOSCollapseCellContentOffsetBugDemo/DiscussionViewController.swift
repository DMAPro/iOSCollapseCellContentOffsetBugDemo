//  DiscussionViewController.swift
//  iOSCollapseCellContentOffsetBugDemo
//
//  Copyright © 2019 DMA. All rights reserved.

import UIKit

class DiscussionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let DEFAULT_HEIGHT: CGFloat = 55.0
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    var expanded = [false, false, false, false]
    let colors = [
        UIColor(displayP3Red: 0.96, green: 0.78, blue: 0.26, alpha: 1.0),
        UIColor(displayP3Red: 0.93, green: 0.38, blue: 0.23, alpha: 1.0),
        UIColor(displayP3Red: 0.72, green: 0.15, blue: 0.23, alpha: 1.0),
        UIColor(displayP3Red: 0.52, green: 0.11, blue: 0.25, alpha: 1.0)
    ]
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expanded[indexPath.row] {
            let heightCache: [Int: CGFloat] = [2: 582.0, 3: 1242.0, 1: 842.0, 0: 342.0]
            return heightCache[indexPath.row]!
        }
        return DEFAULT_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscussionCell", for: indexPath) //as! DiscussionCell
        cell.selectionStyle = .none
        cell.backgroundColor = colors[indexPath.row]
        cell.contentView.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        expanded[indexPath.row] = !expanded[indexPath.row]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
