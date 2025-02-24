import SwiftUI

// Classe que contém as propriedades de cada imagem
class ImageModel: ObservableObject, Identifiable {
    let id = UUID() // ID único para cada instância da classe, necessário para permitir que cada instância seja identificável e utilizável no ForEach da ContentView
    let name: String
    let scale = Double.random(in: 0.2...0.4)
    let rotation = Angle(degrees: Double.random(in: -10...10))
    
    // O wrapper @Published é necessário para que as views sejam atualizadas caso algum desses valores mude
    @Published var zIndex: Int
    @Published var isDragging: Bool = false
    @Published var position: CGPoint?
    
    // Inicializador da classe
    init(name: String, zIndex: Int) {
        self.name = name
        self.zIndex = zIndex
    }
}
