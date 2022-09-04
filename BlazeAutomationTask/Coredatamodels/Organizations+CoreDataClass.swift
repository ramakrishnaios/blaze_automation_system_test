//
//  Organizations+CoreDataClass.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//
//

import Foundation
import CoreData

@objc(Organizations)
public class Organizations: NSManagedObject,Codable {
    

    public func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
           try container.encode(ein, forKey: .ein)
           try container.encode(strein, forKey: .strein)
           try container.encode(name, forKey: .name)
        try container.encode(sub_name, forKey: .sub_name)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        
        try container.encode(ntee_code, forKey: .ntee_code)
        try container.encode(raw_ntee_code, forKey: .raw_ntee_code)
        try container.encode(subseccd, forKey: .subseccd)
        
        try container.encode(has_subseccd, forKey: .has_subseccd)
        try container.encode(have_filings, forKey: .have_filings)
        try container.encode(have_extracts, forKey: .have_extracts)
        
        try container.encode(have_pdfs, forKey: .have_pdfs)
        try container.encode(score, forKey: .score)
       }

    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        ein = try values.decodeIfPresent(Int64.self, forKey: .ein) ?? 0
        strein = try values.decodeIfPresent(String.self, forKey: .strein)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sub_name = try values.decodeIfPresent(String.self, forKey: .sub_name)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        ntee_code = try values.decodeIfPresent(String.self, forKey: .ntee_code)
        raw_ntee_code = try values.decodeIfPresent(String.self, forKey: .raw_ntee_code)
        subseccd = try values.decodeIfPresent(Int16.self, forKey: .subseccd) ?? 0
        has_subseccd = try values.decodeIfPresent(Bool.self, forKey: .has_subseccd) ?? false
        have_filings = try values.decodeIfPresent(Bool.self, forKey: .have_filings) ?? false
        have_extracts = try values.decodeIfPresent(Bool.self, forKey: .have_extracts) ?? false
        have_pdfs = try values.decodeIfPresent(Bool.self, forKey: .have_pdfs) ?? false
        score = try values.decodeIfPresent(Double.self, forKey: .score) ?? 0.0
    }

       enum CodingKeys: String, CodingKey {
           case id = "id"
           case ein = "ein"
           case strein = "strein"
           case name = "name"
           case sub_name = "sub_name"
           case city = "city"
           case state = "state"
           case ntee_code = "ntee_code"
           case raw_ntee_code = "raw_ntee_code"
           case subseccd = "subseccd"
           case has_subseccd = "has_subseccd"
           case have_filings = "have_filings"
           case have_extracts = "have_extracts"
           case have_pdfs = "have_pdfs"
           case score = "score"
       }
}
