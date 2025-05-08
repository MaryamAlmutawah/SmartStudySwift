import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            PomodoroView()
                .tabItem {
                    Label("Pomodoro", systemImage: "timer")
                }

            ClassView()
                .tabItem {
                    Label("Classes", systemImage: "calendar")
                }

            AssignmentView()
                .tabItem {
                    Label("Assignments", systemImage: "doc.on.doc")
                }

            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar")
                }
        }
    }
}
