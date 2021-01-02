//
//  UserInfo+CoreDataProperties.swift
//  OnSZN
//
//  Created by Bennett Yetra on 12/20/20.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var favoriteTeam: String?

}

extension UserInfo : Identifiable {

}
