import Foundation
import CoreData

class TaskManager: ObservableObject {
    @Published var exams: [Exam] = []
    @Published var assignments: [Assignment] = []
    @Published var classes: [ClassItem] = []

    private let viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = context
        loadAll()
    }

    func loadAll() {
        let examRequest: NSFetchRequest<Exam> = Exam.fetchRequest()
        let assignmentRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
        let classRequest: NSFetchRequest<ClassItem> = ClassItem.fetchRequest()

        self.exams = (try? viewContext.fetch(examRequest)) ?? []
        self.assignments = (try? viewContext.fetch(assignmentRequest)) ?? []
        self.classes = (try? viewContext.fetch(classRequest)) ?? []
    }

    func addExam(title: String, subject: String, description: String, date: Date, time: String, building: String) {
        let exam = Exam(context: viewContext)
        exam.id = UUID()
        exam.title = title
        exam.subject = subject
        exam.description = description
        exam.date = date
        exam.time = time
        exam.building = building
        exam.isCompleted = false
        save()
        loadAll()
    }

    func save() {
        do {
            try viewContext.save()
        } catch {
            print("❌ Save error: \(error)")
        }
    }
}
