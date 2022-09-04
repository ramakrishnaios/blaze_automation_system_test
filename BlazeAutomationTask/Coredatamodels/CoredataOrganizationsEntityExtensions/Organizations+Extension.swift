//
//  Organizations+Extension.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//

import Foundation
import CoreData
extension Organizations {
    class func insertOrganizationsList(orgList:[OrganizationsDataList]?, context:NSManagedObjectContext) {
        guard let orgListData = orgList else {return}
        for org in orgListData {
            let newOrg = NSEntityDescription.insertNewObject(forEntityName: "Organizations", into: context)
            newOrg.setValue(UUID(), forKey: "id")
            newOrg.setValue(org.ein, forKey: "ein")
            newOrg.setValue(org.strein, forKey: "strein")
            newOrg.setValue(org.name, forKey: "name")
            newOrg.setValue(org.sub_name, forKey: "sub_name")
            newOrg.setValue(org.city, forKey: "city")
            newOrg.setValue(org.city, forKey: "city")
            newOrg.setValue(org.state, forKey: "state")
            newOrg.setValue(org.ntee_code, forKey: "ntee_code")
            newOrg.setValue(org.raw_ntee_code, forKey: "raw_ntee_code")
            newOrg.setValue(org.subseccd, forKey: "subseccd")
            newOrg.setValue(org.has_subseccd, forKey: "has_subseccd")
            newOrg.setValue(org.have_filings, forKey: "have_filings")
            newOrg.setValue(org.have_extracts, forKey: "have_extracts")
            newOrg.setValue(org.score, forKey: "score")
        }
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    class func fetchOrganizationsList(context:NSManagedObjectContext) -> [Organizations]?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Organizations")
        do {
            if let fetchedResults =  try context.fetch(fetchRequest) as? [Organizations] {
                return fetchedResults
            }
            else{
                return nil
            }
        }
        catch {
            return nil
        }
    }
    class func UpdateOrganization(org:UpdatedOrgainsation,context:NSManagedObjectContext) -> Bool{
        if let id = org.id {
            let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Organizations")
            fetchRequest.returnsObjectsAsFaults = false
            fetchRequest.predicate = NSPredicate(format:"%K == %@", "id", id as CVarArg)
            let result = try?context.fetch(fetchRequest)
            if result?.count == 1 {
                let org1 = result![0]
                org1.setValue(id, forKey: "id")
                org1.setValue(org.name ?? "", forKey: "name")
                org1.setValue(org.sub_Name ?? "", forKey: "sub_name")
                org1.setValue(org.has_Subseccd, forKey: "has_subseccd")
                do{
                    try context.save()
                    return true
                }
                catch{
                    print(error)
                    return false
                }
            }
            else{
                return false
            }
        }
        else{
            return false
        }
    }
}
