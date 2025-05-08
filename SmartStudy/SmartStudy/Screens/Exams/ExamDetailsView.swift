import SwiftUI

struct ExamDetailsView: View {
    let exam: Exam

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                LabelText("Exam Title")
                DetailText(exam.title)

                LabelText("Subject")
                DetailText(exam.subject)

                LabelText("Description")
                DetailText(exam.description)

                HStack {
                    VStack(alignment: .leading) {
                        LabelText("Date")
                        DetailText(formatDate(exam.date))
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        LabelText("Time")
                        DetailText(exam.time)
                    }
                }

                LabelText("Building")
                DetailText(exam.building)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 4)
        .padding(.top)
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    func LabelText(_ text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.black)
            .bold()
    }

    func DetailText(_ text: String) -> some View {
        Text(text)
            .font(.body)
    }
}
