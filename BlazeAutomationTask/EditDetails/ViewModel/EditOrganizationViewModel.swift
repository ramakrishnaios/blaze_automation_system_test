//
//  EditOrganizationViewModel.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 04/09/22.
//

import Foundation
class EditOrganizationViewModel {
    init() {
        
    }
    func updateOrganizationChanges(updateOrgDetails:UpdatedOrgainsation?) -> Bool? {
        if let orgDetails = updateOrgDetails{
            return Organizations.UpdateOrganization(org: orgDetails, context: CoreDataStorageManager.sharedInstances.context)
        }
        else{
            return false
        }
    }
    
}
