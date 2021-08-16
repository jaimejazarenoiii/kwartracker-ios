//
//  Persistable.swift
//  Kwartracker
//
//  Created by Jacob on 8/8/21.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
