//
//  CoreDataProtocol.swift
//  CoreDataLearning
//
//  Created by Gaurav Kumar on 03/05/23.
//

import Foundation
import Combine

@available(iOS 13.0, *)
protocol CoreDataProtocol {
    
    associatedtype Entity
    func fetch(sortDescriptors: [NSSortDescriptor],
                   predicate: NSPredicate?) -> AnyPublisher<[Entity], Error>
    func add() -> AnyPublisher<Bool, Error>
    func edit() -> AnyPublisher<Bool, Error>
    func delete(entity:Entity) -> AnyPublisher<Bool, Error>
}
