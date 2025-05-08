import SwiftUI

struct AssignmentView: View {
    @State private var assignmentList: [Assignment] = [
        Assignment(title: "Assignment Test", subject: "Math", description: "This is an Assignment",
                   date: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 10))!,
                   deadlineTime: "10 AM"),
        Assignment(title: "Assignment Test 2", subject: "Physics", description: "Physics HW",
                   date: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 13))!,
                   deadlineTime: "01:00 PM")
    ]

    @State private var showAddAssignment = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Good Evening")
                    .font(.subheadline)
                Text("Test")
                    .font(.title2)
                    .fontWeight(.medium)

                Text("Assignment")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)

                ScrollView {
                    ForEach(assignmentList) { item in
                        AssignmentCard(assignment: item)
                    }

                    if let first = assignmentList.first {
                        AssignmentDetailsView(assignment: first)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddAssignment) {
                AddAssignmentForm(assignmentList: $assignmentList)
            }
            .overlay(
                Button(action: {
                    showAddAssignment = true
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
