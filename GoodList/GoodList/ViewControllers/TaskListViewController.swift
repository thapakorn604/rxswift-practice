//
//  TaskListViewController.swift
//  GoodList
//
//  Created by Oat on 26/4/2564 BE.
//

import UIKit

class TaskListViewController: UIViewController {
  
  @IBOutlet weak var taskSegment: UISegmentedControl!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension TaskListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
    
    return cell
  }
}

extension TaskListViewController: UITableViewDelegate { }
