import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let s = PhysicsScene(size: CGSize(width: 800, height: 800))
        s.scaleMode = .aspectFit
        return s
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
