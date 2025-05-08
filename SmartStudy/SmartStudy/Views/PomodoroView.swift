import SwiftUI

struct PomodoroView: View {
    @State private var totalTime: Int = 1500 // 25 minutes in seconds
    @State private var timeRemaining: Int = 1500
    @State private var timerRunning = false
    @State private var showExitAlert = false

    @State private var timer: Timer? = nil

    var body: some View {
        VStack(spacing: 30) {
            Text("Pomodoro")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)

            // Timer circle
            ZStack {
                Circle()
                    .stroke(Color.green.opacity(0.3), lineWidth: 10)
                    .frame(width: 200, height: 200)

                Circle()
                    .trim(from: 0, to: CGFloat(Double(totalTime - timeRemaining) / Double(totalTime)))
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 200, height: 200)

                Text(formatTime(timeRemaining))
                    .font(.system(size: 40, weight: .medium, design: .monospaced))
            }

            // Buttons
            HStack(spacing: 20) {
                Button("Start") {
                    startTimer()
                }
                .buttonStyle(PomodoroButtonStyle())

                Button("Pause") {
                    pauseTimer()
                }
                .buttonStyle(PomodoroButtonStyle())

                Button("Reset") {
                    resetTimer()
                }
                .buttonStyle(PomodoroButtonStyle())
            }

            Spacer()
        }
        .padding()
        .alert("Pomodoro timer is running!", isPresented: $showExitAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Can’t exit before timer finished.")
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    if timerRunning {
                        showExitAlert = true
                    } else {
                        // Manually handle navigation pop if using NavigationStack
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.blue)
                }
            }
        }
    }

    func formatTime(_ seconds: Int) -> String {
        let min = seconds / 60
        let sec = seconds % 60
        return String(format: "%02d:%02d", min, sec)
    }

    func startTimer() {
        if timerRunning { return }
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                timerRunning = false
            }
        }
    }

    func pauseTimer() {
        timer?.invalidate()
        timerRunning = false
    }

    func resetTimer() {
        timer?.invalidate()
        timerRunning = false
        timeRemaining = totalTime
    }
}

struct PomodoroButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 90)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1.5)
            )
            .foregroundColor(.blue)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
