import SwiftUI

struct ClassView: View {
    @State private var classList: [ClassItem] = [
        ClassItem(title: "Class Test", subject: "Math", description: "This is a Class",
                  date: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 9))!,
                  time: "10 AM", building: "200"),
        ClassItem(title: "Class Test 2", subject: "Physics", description: "Lab",
                  date: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 13))!,
                  time: "01:00 PM", building: "205")
    ]

    @State private var showAddClass = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Good Evening")
                    .font(.subheadline)
                Text("Test")
                    .font(.title2)
                    .fontWeight(.medium)

                Text("Class")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)

                ScrollView {
                    ForEach(classList) { classItem in
                        ClassCard(classItem: classItem)
                    }

                    if let first = classList.first {
                        ClassDetailsView(classItem: first)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddClass) {
                AddClassForm(classList: $classList)
            }
            .overlay(
                Button(action: {
                    showAddClass = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding(),
                alignment: .bottomTrailing
            )
        }
    }
}
