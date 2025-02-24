//
//  GameScene.swift
//  Explode
//
//  Created by Gustavo Binder on 20/02/25.
//

import SpriteKit

class GameScene : SKScene {
    
    var imageNames : [String] = ["afonso", "flora", "julia", "munhoz", "nat"]
    var images : [SKSpriteNode] = []
    
    var bomb : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        setupBomb()
        
        for name in imageNames {
            let image = SKSpriteNode(imageNamed: name)
            image.setScale(0.025)
            image.position = CGPoint(x: 100, y: 100)
            images.append(image)
        }
    }
    
    func setupBomb() {
        bomb = SKSpriteNode(imageNamed: "bomb")
        bomb.size = CGSize(width: 60, height: 60)
    }
    
    func explode(at position: CGPoint) -> SKAction {
        let throb_up : SKAction = SKAction.scale(to: 1.5, duration: 0.25)
        let throb_down : SKAction = SKAction.scale(to: 0.5, duration: 0.5)
        let throb_sequence : SKAction = SKAction.sequence([throb_down, throb_up])
        let explode : SKAction = SKAction.run {
            let imageCopy : SKSpriteNode = self.images.randomElement()!.copy() as! SKSpriteNode
            imageCopy.position = position
            imageCopy.run(self.growAndShrink(image: imageCopy))
            self.addChild(imageCopy)
        }
        SKAction.applyForce(CGVector(dx: Int.random(in: -10...10), dy: Int.random(in: 3...10)), duration: 1)
        let remove : SKAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([throb_sequence, explode, remove])
        
        return sequence
    }
    
    func growAndShrink(image: SKSpriteNode) -> SKAction {
        let grow : SKAction = SKAction.scale(to: 0.25, duration: 0.2)
        let shrink : SKAction = SKAction.scale(to: 0.035, duration: 0.5)
        let wait : SKAction = SKAction.wait(forDuration: 15)
        let remove : SKAction = SKAction.removeFromParent()
        let sequence : SKAction = SKAction.sequence([grow, shrink, wait, remove])
        
        return sequence
    }
    
    func spawnBomb(position: CGPoint) {
        let newBomb : SKSpriteNode = self.bomb.copy() as! SKSpriteNode
        newBomb.position = position
        newBomb.run(explode(at: position))
        addChild(newBomb)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            spawnBomb(position: t.location(in: self))
        }
    }
}
