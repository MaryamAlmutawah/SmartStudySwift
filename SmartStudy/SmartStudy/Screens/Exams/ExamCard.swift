import SwiftUI

struct ExamCard: View {
    let exam: Exam

    var body: some View {
        HStack {
            Image(systemName: "doc.circle.fill")
                .foregroundColor(.purple)
                .font(.system(size: 30))

            VStack(alignment: .leading) {
                Text(exam.title)
                    .font(.headline)
                Text(formattedDateTime())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.1), radius: 4)
        .padding(.vertical, 4)
    }

    func formattedDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return "\(formatter.string(from: exam.date)), \(exam.time)"
    }
}
