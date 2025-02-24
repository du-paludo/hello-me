import SwiftUI

struct ContentView: View {
    // Um array (vetor) de frutas
    let fruits: [FruitModel] = [
        FruitModel(title: "Banana", image: "banana", description: "Ba-ba-ba-ba-ba-na-na"),
        FruitModel(title: "Melancia", image: "melancia", description: "90% água"),
        FruitModel(title: "Morango", image: "morango", description: "Yummyyy"),
    ]
    
    var body: some View {
        // Inicia uma pilha de navegação no app (deve ser instanciada apenas uma vez no topo da hierarquia)
        NavigationStack {
            VStack {
                // Cria botões que levam às Views com detalhes de cada fruta
                ForEach(fruits, id: \.title) { fruit in
                    NavigationLink(destination: CardDetails(fruit: fruit)) {
                        CardView(fruit: fruit)
                    }
                }
            }
        }
    }
}
