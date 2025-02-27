import SwiftUI

struct QuizView: View {
    // Resgata a instância da variável de ambiente do tipo QuizDatabase criada anteriormente no aplicativo
    @Environment(QuizDatabase.self) private var data
    
    // Define duas colunas para o Grid
    let columns = [
        GridItem(spacing: 16),
        GridItem()
    ]
    
    var body: some View {
        VStack {
            Text("Quiz ADA")
                .font(.headline)
                .foregroundStyle(.gray)
                .padding()
            Spacer()
                .frame(height: 64)
            Text(data.getCurrentQuestion().text)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Grid vertical que exibe as opções de cada pergunta
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(data.getCurrentQuestion().options) { option in
                    Button {
                        data.answerQuestion(mentors: option.mentorsRelated)
                    } label: {
                        VStack {
                            if let text = option.text {
                                Text(text)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                            }
                            if let image = option.image {
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .frame(height: 150)
                        .padding(.vertical, 32)
                        .padding(.horizontal, 16)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.white.opacity(0.1))
                        }
                    }
                }
            })
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
