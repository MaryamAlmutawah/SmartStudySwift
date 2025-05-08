import Foundation

struct Assignment: Identifiable {
    let id = UUID()
    let title: String
    let subject: String
    let description: String
    let date: Date
    let deadlineTime: String
}
