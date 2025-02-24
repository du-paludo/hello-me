import SwiftUI

struct ContentView: View {
    let fruits: [FruitModel] = [
        FruitModel(title: "Banana", image: "banana", description: "É uma banana muito amarela"),
        FruitModel(title: "Melancia", image: "melancia", description: "90% água"),
        FruitModel(title: "Morango", image: "morango", description: "Yummyyy"),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(fruits, id: \.title) { fruit in
                    NavigationLink(destination: CardDetails(fruit: fruit)) {
                        CardView(fruit: fruit)
                    }
                }
            }
        }
    }
}
