import Foundation

struct ClassItem: Identifiable {
    let id = UUID()
    let title: String
    let subject: String
    let description: String
    let date: Date
    let time: String
    let building: String
}
