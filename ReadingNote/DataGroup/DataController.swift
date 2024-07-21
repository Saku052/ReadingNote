
import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("saving failed")
        }
    }
    
    func addNote(name: String, readingTime: Double, context: NSManagedObjectContext) {
        let book = Book(context: context)
        book.name = name
        book.readingTime = readingTime
        book.id = UUID()
        book.readDate = Date()
        
        save(context: context)
    }
    
    func editNote(book: Book, name: String, readingTime: Double, context: NSManagedObjectContext) {
        book.name = name
        book.readingTime = readingTime
        book.readDate = Date()
        
        save(context: context)
    }
    
    
}
