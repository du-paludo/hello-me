import SwiftUI

struct DetailsView: View {
    let model: CardModel
    
    var body: some View {
        GeometryReader { geo in // Lê as dimensões da tela para que seja possível calcular os tamanhos de maneira responsiva. os dados ficam na variavel geo.
            VStack(alignment: .leading) {
                Image(model.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geo.size.height * 0.3)
                    .clipped() // Corta a imagem conforme o frame.
                Text(model.title)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 16)
                ScrollView {
                    Text(model.text)
                        .padding(.horizontal, 16)
                }
            }
        }
        .navigationBarTitle(model.title, displayMode: .inline)
    }
}
