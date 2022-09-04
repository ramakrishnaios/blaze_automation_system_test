//
//  OrganizationListViewModel.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//

import Foundation
import UIKit
import CoreData
class OrganizationListViewModel {
    @Published var orgListData : [StateWiseOriganizations]? {
        didSet {
            self.bindOrganizationsData()
        }
    }
    var bindOrganizationsData : (() -> ()) = {}
    init(apiService: APIService?,context:NSManagedObjectContext) {
        if let localDBData = Organizations.fetchOrganizationsList(context: context) {
            if localDBData.count > 0 {
                DispatchQueue.main.async {
                    self.processData(localDBData: localDBData)
                }
            }
            else{
                guard let apiCallManger = apiService else {return}
                getOrganizationsData(apiService: apiCallManger)
            }
        }
    }
    func getOrganizationsData(apiService: APIService) {
        apiService.getData(apiEndPoint:Endpoints.organizationsList) { apiResponse in
            switch apiResponse {
            case .success(let orgList):
                Organizations.insertOrganizationsList(orgList: orgList?.organizations, context: CoreDataStorageManager.sharedInstances.context)
                if let localDBData = Organizations.fetchOrganizationsList(context: CoreDataStorageManager.sharedInstances.context) {
                    if localDBData.count > 0 {
                        self.processData(localDBData: localDBData)
                    }
                }
            case .failure(let failedError):
                print(failedError.localizedDescription)
            }
        }
    }
    
    func processData(localDBData:[Organizations]?){
        if let stateList = localDBData?.map({$0.state}) {
            var orgList : [StateWiseOriganizations] = []
            for state in Array(Set(stateList).sorted(by: {$0?.localizedCaseInsensitiveCompare($1 ?? "") == ComparisonResult.orderedAscending})) {
                let organizations = localDBData?.filter({$0.state == state})
                orgList.append(StateWiseOriganizations.init(state: state ?? "", organisation: organizations ?? []))
            }
            self.orgListData = orgList
        }
    }
    
    func searchOrgWithName(searchKeyword:String,context:NSManagedObjectContext) {
        if let localDBData = Organizations.fetchOrganizationsList(context: context) {
            if localDBData.count > 0 {
                self.processData(localDBData: localDBData)
                if searchKeyword.isEmpty {return}
                if let orgs  = self.orgListData?.filter({$0.state?.range(of: searchKeyword, options: .caseInsensitive) != nil }){
                    self.orgListData = orgs
                }
            }
        }
    }
}
