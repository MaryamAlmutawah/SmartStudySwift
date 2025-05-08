import SwiftUI

struct ProgressView: View {
    let weeklyStats: [TaskStat] = [
        TaskStat(day: "M", complete: 5, incomplete: 2),
        TaskStat(day: "T", complete: 3, incomplete: 0),
        TaskStat(day: "W", complete: 4, incomplete: 1),
        TaskStat(day: "T", complete: 6, incomplete: 0),
        TaskStat(day: "F", complete: 8, incomplete: 0),
        TaskStat(day: "S", complete: 4, incomplete: 1),
        TaskStat(day: "S", complete: 1, incomplete: 0)
    ]

    let examStats: [TaskStat] = [
        TaskStat(day: "M", complete: 0, incomplete: 2),
        TaskStat(day: "T", complete: 2, incomplete: 0),
        TaskStat(day: "W", complete: 0, incomplete: 0),
        TaskStat(day: "T", complete: 0, incomplete: 0),
        TaskStat(day: "F", complete: 3, incomplete: 0),
        TaskStat(day: "S", complete: 1, incomplete: 0),
        TaskStat(day: "S", complete: 2, incomplete: 0)
    ]

    let assignmentStats: [TaskStat] = [
        TaskStat(day: "M", complete: 0, incomplete: 0),
        TaskStat(day: "T", complete: 0, incomplete: 0),
        TaskStat(day: "W", complete: 0, incomplete: 0),
        TaskStat(day: "T", complete: 0, incomplete: 0),
        TaskStat(day: "F", complete: 1, incomplete: 0),
        TaskStat(day: "S", complete: 0, incomplete: 0),
        TaskStat(day: "S", complete: 0, incomplete: 0)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Statistics")
                    .font(.title)
                    .bold()

                LineChartSection(stats: weeklyStats)

                BarChartSection(title: "Exam", stats: examStats)
                BarChartSection(title: "Assignment", stats: assignmentStats)
            }
            .padding()
        }
        .navigationTitle("Progress")
    }
}
