import SwiftUI

struct DraggableView: View {
    @StateObject var image: ImageModel
    var bringToFront: () -> Void  // Closure (função) para atualizar o zIndex
    
    var dragGesture: some Gesture {
        DragGesture()
            // Ao mudar a posição do toque, altera a posição da imagem
            .onChanged { value in
                image.position = value.location
                // Ao começar a movimentar a imagem, traz ela para o topo
                if !(image.isDragging) {
                    bringToFront()
                    image.isDragging = true
                }
            }
        
            .onEnded { _ in
                image.isDragging = false
            }
    }
    
    var body: some View {
        GeometryReader { geo in // Utilizado para obter propriedades da tela
            Image(image.name)
                .resizable() // Permite a imagem ter tamanho variável
                .scaledToFit() // A imagem é escalada para caber inteiramente na tela
                .clipShape(RoundedRectangle(cornerRadius: 12)) // Adiciona bordas na imagem
                .scaleEffect(image.isDragging ? image.scale * 1.1 : image.scale) // Aumenta a imagem se estiver sendo arrastada
                .position(image.position ?? CGPoint(x: geo.size.width/2, y: geo.size.height/2))
                .rotationEffect(image.rotation)
                .gesture(dragGesture)
                .zIndex(Double(image.zIndex)) // Define a ordem das imagens na ZStack
        }
    }
}
