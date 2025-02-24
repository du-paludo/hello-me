import SwiftUI

struct CardDetails: View {
    let fruit: FruitModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(fruit.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(fruit.title)
                    .font(.title)
                Text(fruit.description)
            }
        }
    }
}
