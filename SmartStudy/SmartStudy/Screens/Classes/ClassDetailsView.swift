import SwiftUI

struct ClassDetailsView: View {
    let classItem: ClassItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            LabelText("Class Title")
            DetailText(classItem.title)

            LabelText("Subject")
            DetailText(classItem.subject)

            LabelText("Description")
            DetailText(classItem.description)

            HStack {
                VStack(alignment: .leading) {
                    LabelText("Date")
                    DetailText(formatDate(classItem.date))
                }
                Spacer()
                VStack(alignment: .leading) {
                    LabelText("Time")
                    DetailText(classItem.time)
                }
            }

            LabelText("Building")
            DetailText(classItem.building)
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
