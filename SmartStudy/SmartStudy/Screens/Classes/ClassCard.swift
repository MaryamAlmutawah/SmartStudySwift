import SwiftUI

struct ClassCard: View {
    let classItem: ClassItem

    var body: some View {
        HStack {
            Image(systemName: "book.circle.fill")
                .foregroundColor(.purple)
                .font(.system(size: 30))

            VStack(alignment: .leading) {
                Text(classItem.title)
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

    private func formattedDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return "\(formatter.string(from: classItem.date)), \(classItem.time)"
    }
}