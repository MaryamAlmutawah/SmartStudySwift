import SwiftUI
import Charts

struct LineChartSection: View {
    let stats: [TaskStat]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Weekly Completion")
                .font(.headline)
                .padding(.bottom, 4)

            Chart {
                ForEach(stats) { stat in
                    LineMark(
                        x: .value("Day", stat.day),
                        y: .value("Completed", stat.complete)
                    )
                    .foregroundStyle(Color.blue)
                    .symbol(Circle())
                }
            }
            .frame(height: 200)
        }
    }
}
