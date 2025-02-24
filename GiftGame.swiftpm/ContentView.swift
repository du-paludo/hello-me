import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let s = GameScene(size: CGSize(width: 1346, height: 757))
        s.scaleMode = .aspectFit
        return s
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
