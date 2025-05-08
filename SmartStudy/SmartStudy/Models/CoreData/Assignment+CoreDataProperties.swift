import Foundation
import CoreData

extension Assignment {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var subject: String
    @NSManaged public var descriptionText: String
    @NSManaged public var date: Date
    @NSManaged public var deadlineTime: String
    @NSManaged public var isCompleted: Bool
}

extension Assignment: Identifiable { }
