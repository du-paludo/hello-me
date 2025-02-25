import SwiftUI

struct CardView: View {
    let model: CardModel
    
    var preview: some View {
        VStack { // Coloca o conteúdo de dentro das chaves de forma vertical
            Spacer() // Consome o máximo de espaço possível (na vertical)
            VStack {
                VStack(alignment: .leading, spacing: 4) { // Coloca o conteúdo de dentro das chaves de forma vertical, com espaçamento entre os itens de 4 pixels, com os itens alinhados a esquerda.
                    Text(model.title)
                        .foregroundColor(.white) // Muda a cor do texto
                        .font(.title3) // Muda o tamanho da fonte
                        .bold() // Coloca o texto em negrito
                    Text(model.text)
                        .font(.body)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
            }
            .frame(maxWidth: .infinity, minHeight: 70, maxHeight: 70, alignment: .leading)
            .background(Color.black.opacity(0.7))
        }
        .frame(maxWidth: .infinity, idealHeight: 220, alignment: .leading)
    }
    
    var body: some View {
        // Coloca uma imagem no corpo do card. O nome da imagem vem de model.imageName
        Image(model.imageName)
            .resizable() // Faz com que a imagem possa ser redimensionada
            .scaledToFill() // Faz com que o redimensionamento preencha o espaço
            .frame(height: 220) // Coloca uma altura máxima de 220 pixels no card
            .overlay { // Coloca a view de preview sobre a imagem
                preview
            }
            .cornerRadius(10)
    }
}
