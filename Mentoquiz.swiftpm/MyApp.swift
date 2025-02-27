import SwiftUI

@main
struct MyApp: App {
    @State private var data = QuizDatabase()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(data) // Permite a classe data ser utilizada como variável de ambiente nas views filhas da ContentView
        }
    }
}
