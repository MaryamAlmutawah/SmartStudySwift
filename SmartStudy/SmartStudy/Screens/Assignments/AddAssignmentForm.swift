import SwiftUI

struct AddAssignmentForm: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskManager: TaskManager

    @State private var title = ""
    @State private var subject = ""
    @State private var description = ""
    @State private var date = Date()
    @State private var deadlineTime = ""

    @State private var showAlert = false
    @State private var alertText = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Assignment Info")) {
                    TextField("Title", text: $title)
                    TextField("Subject", text: $subject)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Schedule")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Deadline Time (e.g., 10 AM)", text: $deadlineTime)
                }
            }
            .navigationTitle("Add Assignment")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        handleSave()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert("Missing Info", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertText)
            }
        }
    }

    private func handleSave() {
        guard !title.isEmpty, !subject.isEmpty, !deadlineTime.isEmpty else {
            alertText = "Please fill in all required fields."
            showAlert = true
            return
        }

        let newAssignment = Assignment(
            title: title,
            subject: subject,
            description: description,
            date: date,
            deadlineTime: deadlineTime
        )

        taskManager.addAssignment(newAssignment)
        dismiss()
    }
}
