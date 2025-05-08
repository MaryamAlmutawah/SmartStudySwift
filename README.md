📚 SmartStudy – Student Productivity App
SmartStudy is a cross-platform educational app built with SwiftUI for iOS. It helps students manage their academic life through Pomodoro timers, class/assignment/exam tracking, calendars, and progress visualization.

✨ Features

✅ Login / Sign Up (with email input)

📅 Calendar View with all tasks shown

🏫 Class Tracking with room/building info

📝 Assignment Management with deadlines

🧪 Exam Scheduling with seat/building/time

⏲️ Pomodoro Timer for focused study sessions

📈 Progress Charts (Line, Bar, Pie)

🧠 Auto-sync tasks to calendar and progress view

💾 Core Data + SQLite persistent storage

🛠 Built With
SwiftUI (MVVM Design)

Core Data (SQLite-backed)

Charts Framework (iOS 16+)

Clean Folder Architecture

📂 Folder Structure
bash
SmartStudy/
├── Models/
│   ├── CoreData/           # Core Data model files
│   ├── TaskEvent.swift     # Shared task model for charts/calendar
├── Auth/                   # Login / Sign Up views and AuthManager
├── Views/                  # Reusable UI components (Calendar, Dashboard)
├── Screens/
│   ├── Assignments/
│   ├── Classes/
│   ├── Exams/
│   ├── Progress/
├── Shared/
│   ├── TaskManager.swift   # Central source of truth for all tasks
│   ├── UtilityFunctions.swift
├── ContentView.swift       # Tab navigation
├── SmartStudyApp.swift     # App entry point

