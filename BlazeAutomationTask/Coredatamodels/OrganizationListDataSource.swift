//
//  OrganizationListDataSource.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//

import Foundation
import UIKit
import CloudKit
class  OrganizationListTableViewDataSource<CELL : UITableViewCell, T> : NSObject, UITableViewDataSource,UITableViewDelegate {
    private var cellIdentifier : String!
    private var items : [T]?
    var configureCell : (CELL, T?, IndexPath) -> () = {_,_,_  in }
    var deleteOrEditCell : (IndexPath,Bool) -> () = {_,_ in}
    init(cellIdentifier : String, items : [T]?, configureCell : @escaping (CELL, T?, IndexPath) -> (), deleteOrEditCell : @escaping (IndexPath,Bool) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
        self.deleteOrEditCell = deleteOrEditCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let stateWiseOrg = self.items?[section] as? StateWiseOriganizations {
            return stateWiseOrg.organisation?.count ?? 0
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        self.configureCell(cell,self.items?[indexPath.section],indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items?.count ?? 0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.deleteOrEditCell(indexPath, true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionTitle = self.items?[section] as? StateWiseOriganizations {
            return sectionTitle.state
        }
        else{
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.backgroundColor = UIColor.systemBlue
        return headerView
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemGroupedBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.systemOrange
        header.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.deleteOrEditCell(indexPath, false)
    }
}






