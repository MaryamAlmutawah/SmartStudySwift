@main
struct SmartStudyApp: App {
    let persistence = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(TaskManager(context: persistence.container.viewContext))
        }
    }
}
