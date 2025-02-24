import SwiftUI

struct ContentView: View {
    @Environment(QuizDatabase.self) private var data

    var body: some View {
        if data.hasFinished() {
            ResultView(mentor: data.getHighestScoreMentor())
        } else {
            QuizView()
        }
    }
}
