import SwiftUI
import _SpriteKit_SwiftUI

struct ContentView: View {
    var scene : GameScene {
        return GameScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
        }
    }
}
