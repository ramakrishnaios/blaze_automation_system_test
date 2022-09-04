//
//  OrganizationListViewController.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//

import UIKit

class OrganizationListViewController: UIViewController {
    var VMOrganizationList : OrganizationListViewModel?
    @IBOutlet weak var tblOrganizationList: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    private var dataSource : OrganizationListTableViewDataSource<OrganizationDetailsTableViewCell,StateWiseOriganizations>!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerOrganizaionCell()
        configureSearchBar()
    }
    func configureSearchBar(){
        self.navigationItem.titleView = searchBar
        self.searchBar.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchOrganizationData()
    }
    func registerOrganizaionCell() {
        self.tblOrganizationList.rowHeight = UITableView.automaticDimension
        self.tblOrganizationList.estimatedRowHeight = 150
        let productCellNib = UINib.init(nibName: "OrganizationDetailsTableViewCell", bundle: nil)
        self.tblOrganizationList.register(productCellNib, forCellReuseIdentifier: "OrganizationDetailsTableViewCell")
    }
    
    func fetchOrganizationData(){
        VMOrganizationList =  OrganizationListViewModel(apiService: APIService(), context: CoreDataStorageManager.sharedInstances.context)
        VMOrganizationList?.bindOrganizationsData = { [unowned self] in
            self.updateDataSource()
        }
        
    }
    
    func updateDataSource(){
        self.dataSource = OrganizationListTableViewDataSource(cellIdentifier: "OrganizationDetailsTableViewCell", items: self.VMOrganizationList?.orgListData, configureCell: {(cell, org, indexpath)  in
            let item = org?.organisation?[indexpath.row]
            cell.lblSub.text = item?.sub_name ?? ""
            cell.lblName.text = item?.name ?? ""
            cell.lblCityName.text = item?.city ?? ""
            cell.switchHasSubSecd.isOn = item?.has_subseccd ?? false
        }, deleteOrEditCell: { [weak self] (indexpath, performDelete)  in
            if performDelete {
                self?.VMOrganizationList?.orgListData?[indexpath.section].organisation?.remove(at: indexpath.row)
            }
            else{
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                if let editingVC = sb.instantiateViewController(identifier: "EditDetailsViewController") as? EditDetailsViewController {
                    if let selectedOrg =  self?.VMOrganizationList?.orgListData?[indexpath.section].organisation?[indexpath.row] as? Organizations {
                        editingVC.organization = selectedOrg
                    }
                    self?.navigationController?.pushViewController(editingVC, animated: true)
                }
            }
        })
        DispatchQueue.main.async {
            self.tblOrganizationList.delegate = self.dataSource
            self.tblOrganizationList.dataSource = self.dataSource
            self.tblOrganizationList.reloadData()
        }
    }

}

extension OrganizationListViewController: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.VMOrganizationList?.searchOrgWithName(searchKeyword: searchText, context: CoreDataStorageManager.sharedInstances.context)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = nil
    }
 }
