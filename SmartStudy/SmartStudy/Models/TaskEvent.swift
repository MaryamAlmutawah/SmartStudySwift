import Foundation

struct TaskEvent: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let type: TaskType

    enum TaskType: String {
        case exam, `class`, assignment
    }
}
