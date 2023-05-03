//public struct CoreDataRepository {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}


import Combine
import CoreData

@available(iOS 13.0, *)
public class CoreDataRepository<Entity: NSManagedObject>:CoreDataProtocol {
    
    private let context: NSManagedObjectContext
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func fetch(sortDescriptors: [NSSortDescriptor] = [],
                   predicate: NSPredicate? = nil) -> AnyPublisher<[Entity], Error> {
        Deferred { [context] in
            Future { promise in
                context.perform {
                    let request = Entity.fetchRequest()
                                        request.sortDescriptors = sortDescriptors
                    request.predicate = predicate
                    do {
                        let results = try context.fetch(request) as! [Entity]
                        promise(.success(results))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    public func add() -> AnyPublisher<Bool, Error> {
        self.coreDataAction()
    }
    
    public func edit() -> AnyPublisher<Bool, Error> {
        self.coreDataAction()
    }
        
    public func delete(entity:Entity) -> AnyPublisher<Bool, Error> {
        self.coreDataAction(entity: entity,isDelete: true)
    }
    
    private func coreDataAction(entity:Entity? = nil,isDelete:Bool = false) -> AnyPublisher<Bool, Error> {
        Deferred { [context] in
            Future  { promise in
                context.perform {
                    do {
                        if let entity = entity,isDelete {
                            context.delete(entity)
                        }
                        try context.save()
                        promise(.success(true))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
