import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    @Published var exams: [Exam] = []
    @Published var assignments: [Assignment] = []
    @Published var classes: [ClassItem] = []

    // MARK: - Calendar Sync
    var allTaskEvents: [TaskEvent] {
        let examEvents = exams.map {
            TaskEvent(title: $0.title, date: $0.date, type: .exam)
        }
        let assignmentEvents = assignments.map {
            TaskEvent(title: $0.title, date: $0.date, type: .assignment)
        }
        let classEvents = classes.map {
            TaskEvent(title: $0.title, date: $0.date, type: .class)
        }
        return examEvents + assignmentEvents + classEvents
    }

    // MARK: - Weekly Completion Stats
    func stats(for type: TaskEvent.TaskType) -> [TaskStat] {
        let tasks: [Date] = {
            switch type {
            case .exam: return exams.map { $0.date }
            case .assignment: return assignments.map { $0.date }
            case .class: return classes.map { $0.date }
            }
        }()

        var counts: [String: Int] = [:]
        let calendar = Calendar.current

        for date in tasks {
            let shortDay = shortWeekday(from: date)
            counts[shortDay, default: 0] += 1
        }

        return weekDays.map {
            TaskStat(day: $0, complete: counts[$0] ?? 0, incomplete: 0)
        }
    }

    // MARK: - Add Functions
    func addExam(_ exam: Exam) {
        exams.append(exam)
    }

    func addAssignment(_ assignment: Assignment) {
        assignments.append(assignment)
    }

    func addClass(_ classItem: ClassItem) {
        classes.append(classItem)
    }
}
