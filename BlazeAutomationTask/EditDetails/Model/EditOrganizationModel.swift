//
//  EditOrganizationModel.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 04/09/22.
//

import Foundation
struct UpdatedOrgainsation{
    let name : String?
    let sub_Name : String?
    let has_Subseccd : Bool?
    let id : UUID?
    init(name:String?,sub_Name:String?,has_Subseccd:Bool?,id:UUID?){
        self.name = name
        self.sub_Name = sub_Name
        self.has_Subseccd = has_Subseccd
        self.id = id
    }
}
