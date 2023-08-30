//
//  DashboardVC+TableView.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import Foundation
import UIKit

extension DashboardVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 65
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardViewCell.identifier, for: indexPath) as! DashboardViewCell
        cell.content = items[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //debugPrint(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
