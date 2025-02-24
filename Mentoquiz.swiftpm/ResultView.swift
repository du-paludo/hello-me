import SwiftUI

struct ResultView: View {
    @Environment(QuizDatabase.self) private var data

    let mentor: Mentor
    
    var body: some View {
        VStack {
            Text("Você é o mentor \(mentor.name)")
            Button("Tentar novamente") {
                data.restartQuiz()
            }
        }
    }
}
