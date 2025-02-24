import SwiftUI

struct ContentView: View {
    // É criado uma sequência (array) de imagens, gerando instâncias para os números de 1 a 3, onde name recebe "image1", "image2", etc., e zPosition corresponde ao número
    private let images: [ImageModel] = Array(1...8).map { ImageModel(name: "image\($0)", zIndex: $0)}
    
    var body: some View {
        ZStack {
            // Cria uma DraggableView para cada imagem no array
            ForEach(images) { image in
                DraggableView(image: image, bringToFront: {
                    bringToFront(image)
                })
            }
        }
        .background {
            Image("wall")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea()
    }
    
    private func bringToFront(_ selectedImage: ImageModel) {
        // Diminui o zPosition de cada imagem do array, se for maior que o da imagem selecionada
        for image in images {
            if image.zIndex > selectedImage.zIndex {
                image.zIndex -= 1
            }
        }
        // Maximiza o zIndex da imagem selecionada
        selectedImage.zIndex = images.count
    }
}
