//
//  Organizations+CoreDataProperties.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//
//

import Foundation
import CoreData


extension Organizations {

   
    @NSManaged public var id: UUID
    @NSManaged public var ein: Int64
    @NSManaged public var strein: String?
    @NSManaged public var name: String?
    @NSManaged public var sub_name: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var ntee_code: String?
    @NSManaged public var raw_ntee_code: String?
    @NSManaged public var subseccd: Int16
    @NSManaged public var has_subseccd: Bool
    @NSManaged public var have_filings: Bool
    @NSManaged public var have_extracts: Bool
    @NSManaged public var have_pdfs: Bool
    @NSManaged public var score: Double

}

extension Organizations : Identifiable {

}
