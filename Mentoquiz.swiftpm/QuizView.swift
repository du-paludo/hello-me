import SwiftUI

struct QuizView: View {
    @Environment(QuizDatabase.self) private var data
    
    let columns = [
        GridItem(spacing: 16),
        GridItem()
    ]
    
    var body: some View {
        VStack {
            Text(data.getCurrentQuestion().text)
            
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(data.getCurrentQuestion().options) { option in
                    Button {
                        data.answerQuestion(mentors: option.mentorsRelated)
                    } label: {
                        VStack {
                            if let text = option.text {
                                Text(text)
                                    .foregroundStyle(.white)
                            }
                            if let image = option.image {
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 24)
                        .padding(.horizontal, 16)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.blue)
                        }
                    }
                    .id(option.id)
                }
            })
        }
        .padding(.horizontal, 16)
    }
}
