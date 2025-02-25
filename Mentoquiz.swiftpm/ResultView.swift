import SwiftUI

struct ResultView: View {
    @Environment(QuizDatabase.self) private var data
    @Binding var start : Bool

    let mentor: Mentor
    
    var body: some View {
        VStack {
            Spacer()
            Text("Você é o/a mentor(a)")
                .font(.title2)
            Text("\(mentor.name)")
                .bold()
                .font(.largeTitle)
            Spacer()
            Button {
                withAnimation(.bouncy) {
                    data.restartQuiz()
                    start = false
                }
            } label: {
                Text("Refazer Quiz")
                    .foregroundStyle(.blue)
            }
            .buttonStyle(.bordered)
            Spacer()

        }
    }
}
