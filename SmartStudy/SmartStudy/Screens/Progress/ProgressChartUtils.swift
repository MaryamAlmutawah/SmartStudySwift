import Foundation

struct TaskStat: Identifiable {
    let id = UUID()
    let day: String // "M", "T", etc.
    let complete: Int
    let incomplete: Int
}
