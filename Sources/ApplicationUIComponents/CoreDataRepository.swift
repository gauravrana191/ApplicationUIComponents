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
    
    func fetch(sortDescriptors: [NSSortDescriptor] = [],
                   predicate: NSPredicate? = nil) -> AnyPublisher<[Entity], Error> {
        return Future { promise in
            self.context.perform {
                let request = Entity.fetchRequest()
                                    request.sortDescriptors = sortDescriptors
                request.predicate = predicate
                do {
                    let results = try self.context.fetch(request) as! [Entity]
                    promise(.success(results))
                } catch {
                    promise(.failure(error))
                }
            }
        }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
    
    func add(entity:Entity) -> AnyPublisher<Bool, Error> {
            Deferred { [context] in
                Future  { promise in
                    context.perform {
                        do {
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
