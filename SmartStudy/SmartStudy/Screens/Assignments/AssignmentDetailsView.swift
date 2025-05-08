import SwiftUI

struct AssignmentDetailsView: View {
    let assignment: Assignment

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            LabelText("Assignment Title")
            DetailText(assignment.title)

            LabelText("Subject")
            DetailText(assignment.subject)

            LabelText("Description")
            DetailText(assignment.description)

            HStack {
                VStack(alignment: .leading) {
                    LabelText("Date")
                    DetailText(formatDate(assignment.date))
                }
                Spacer()
                VStack(alignment: .leading) {
                    LabelText("Deadline time")
                    DetailText(assignment.deadlineTime)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 4)
        .padding(.top)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func LabelText(_ text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.black)
            .bold()
    }

    private func DetailText(_ text: String) -> some View {
        Text(text)
            .font(.body)
    }
}
