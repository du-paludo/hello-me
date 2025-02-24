import SwiftUI

struct CardView: View {
    let fruit: FruitModel
    
    var body: some View {
        ZStack {
            // Imagem da fruta
            Image(fruit.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 200)
                .clipped()
            
            // Gradiente vertical que vai do preto ao transparente
            LinearGradient(colors: [Color.black, Color.clear], startPoint: .bottom, endPoint: .top)
            
            // Um texto com o nome da fruta
            Text(fruit.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding()
        }
        .frame(width: 400, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
