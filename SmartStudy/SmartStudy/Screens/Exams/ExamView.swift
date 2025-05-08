import SwiftUI

struct ExamView: View {
    @State private var exams: [Exam] = [
        Exam(title: "Exam Test", subject: "Math", description: "This is an Exam",
             date: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 15))!,
             time: "10 AM", building: "200"),

        Exam(title: "Exam Test 2", subject: "Physics", description: "Physics Final",
             date: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 13))!,
             time: "01:00 PM", building: "205")
    ]

    @State private var showAddExam = false
    @State private var greeting = "Good Evening"
    @State private var username = "Test"

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(greeting)
                    .font(.subheadline)
                    .padding(.top, 10)
                Text(username)
                    .font(.title2)
                    .fontWeight(.medium)

                Text("Exam")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)

                ScrollView {
                    ForEach(exams) { exam in
                        ExamCard(exam: exam)
                    }

                    if let first = exams.first {
                        ExamDetailsView(exam: first)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddExam) {
                AddExamForm(exams: $exams)
            }
            .overlay(
                Button(action: {
                    showAddExam = true
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
