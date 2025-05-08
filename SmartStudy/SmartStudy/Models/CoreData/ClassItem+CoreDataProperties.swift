import Foundation
import CoreData

extension ClassItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassItem> {
        return NSFetchRequest<ClassItem>(entityName: "ClassItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var subject: String
    @NSManaged public var descriptionText: String
    @NSManaged public var date: Date
    @NSManaged public var time: String
    @NSManaged public var building: String
    @NSManaged public var isCompleted: Bool
}

extension ClassItem: Identifiable { }
