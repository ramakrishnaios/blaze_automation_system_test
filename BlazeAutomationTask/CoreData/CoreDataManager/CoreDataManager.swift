//
//  CoreDataManager.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//


import Foundation
import CoreData
import UIKit
public class  CoreDataStorageManager {
    static let sharedInstances : CoreDataStorageManager = CoreDataStorageManager()
    var context: NSManagedObjectContext
    var storeCoordinator  : NSPersistentStoreCoordinator
    private init(){
        let application = UIApplication.shared.delegate as! AppDelegate
        self.context = application.persistentContainer.viewContext
        self.storeCoordinator = application.persistentContainer.persistentStoreCoordinator
    }
}
