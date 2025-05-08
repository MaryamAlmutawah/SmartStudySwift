import SwiftUI
import Charts

struct BarChartSection: View {
    let title: String
    let stats: [TaskStat]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .bold()

            Chart {
                ForEach(stats) { stat in
                    BarMark(x: .value("Day", stat.day), y: .value("Incomplete", stat.incomplete))
                        .foregroundStyle(Color.gray)

                    BarMark(x: .value("Day", stat.day), y: .value("Complete", stat.complete))
                        .foregroundStyle(Color.blue)
                }
            }
            .frame(height: 200)
        }
    }
}
