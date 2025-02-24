import SwiftUI

struct CardView: View {
    let fruit: FruitModel
    
    var body: some View {
        ZStack {
            Image(fruit.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 200)
                .clipped()
            
            LinearGradient(colors: [Color.black, Color.clear], startPoint: .bottom, endPoint: .top)
            
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
