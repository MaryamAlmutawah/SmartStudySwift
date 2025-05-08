import SwiftUI

struct AddClassForm: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskManager: TaskManager

    @State private var title = ""
    @State private var subject = ""
    @State private var description = ""
    @State private var date = Date()
    @State private var time = ""
    @State private var building = ""

    @State private var showAlert = false
    @State private var alertText = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Class Info")) {
                    TextField("Class Title", text: $title)
                    TextField("Subject", text: $subject)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Schedule")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Time (e.g., 10 AM)", text: $time)
                }

                Section(header: Text("Location")) {
                    TextField("Building", text: $building)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Add Class")
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
        guard !title.isEmpty, !subject.isEmpty, !time.isEmpty, !building.isEmpty else {
            alertText = "Please fill in all required fields."
            showAlert = true
            return
        }

        let newClass = ClassItem(
            title: title,
            subject: subject,
            description: description,
            date: date,
            time: time,
            building: building
        )

        taskManager.addClass(newClass)
        dismiss()
    }
}
