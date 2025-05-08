import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    // Pull from actual app data eventually
    @State private var allEvents: [TaskEvent] = [
        TaskEvent(title: "Exam Test", date: Date(), type: .exam),
        TaskEvent(title: "Class Test", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, type: .class),
        TaskEvent(title: "Assignment Test", date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, type: .assignment)
    ]

    var body: some View {
        VStack {
            Text("Calendar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding()

            // Show filtered tasks on selected day
            List(filteredEvents) { event in
                HStack {
                    Image(systemName: iconFor(event.type))
                        .foregroundColor(colorFor(event.type))
                    Text(event.title)
                    Spacer()
                    Text(event.type.rawValue.capitalized)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    var filteredEvents: [TaskEvent] {
        allEvents.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
    }

    func iconFor(_ type: TaskEvent.TaskType) -> String {
        switch type {
        case .exam: return "checkmark.circle"
        case .class: return "book.fill"
        case .assignment: return "doc.text.fill"
        }
    }

    func colorFor(_ type: TaskEvent.TaskType) -> Color {
        switch type {
        case .exam: return .red
        case .class: return .blue
        case .assignment: return .purple
        }
    }
}
