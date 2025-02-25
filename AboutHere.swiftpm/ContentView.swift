import SwiftUI

struct ContentView: View {
    let dataSrc: DataSource
    
    var body: some View {
        NavigationSplitView { // Cria uma área de navegação com duas colunas
            ScrollView { // Cria uma área que tem um scroll
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) { // Dispõe as coisas na vertical (melhor perfomático que a VStack quando usado com a ScrollView)
                    ForEach(dataSrc.getData()) { model in // Para cada modelo no DataSource coloca um card na tela
                        NavigationLink { // Mostra um CardView, que ao clicar abre o DetailsView na coluna à direita
                            DetailsView(model: model)
                        } label: {
                            CardView(model: model)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .navigationTitle("About Here") // Coloca o título no topo da tela
        } detail: {
            Image("bird")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .opacity(0.2)
        }
    }
}
