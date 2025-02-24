import SwiftUI

@main
struct MyApp: App {
    @State private var data = QuizDatabase()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(data)
        }
    }
}
