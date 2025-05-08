import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let dueDate: String
}

struct DashboardView: View {
    @State private var email = "test@test.com"
    @State private var upcomingTasks: [Task] = [
        Task(title: "Write research paper", dueDate: "Apr 25")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header
            Text("Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.horizontal)

            // Greeting
            Text("Good afternoon \(email)")
                .font(.headline)
                .padding(.horizontal)
            
            // Action Buttons
            HStack(spacing: 20) {
                ForEach(["Class", "Assignment", "Exam"], id: \.self) { title in
                    Button(action: {
                        print("Navigate to \(title)")
                    }) {
                        VStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(title)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            // Upcoming Tasks
            VStack(alignment: .leading, spacing: 8) {
                Text("Upcoming Tasks")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(upcomingTasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Text(task.dueDate)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .tabViewStyle(.page)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
    }
}
