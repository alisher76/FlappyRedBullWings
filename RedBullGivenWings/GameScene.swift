//
//  GameScene.swift
//  RedBullGivenWings
//
//  Created by Alisher Abdukarimov on 7/27/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import SpriteKit
import GameplayKit

enum Layer: CGFloat {
    case background, foreground, player
}

class GameScene: SKScene {
    
    let worldNode = SKNode()
    var playableStart: CGFloat = 0
    var playableHeight: CGFloat = 0
    let numberOfForegrounds = 2
    let groundSpeed: CGFloat = 150
    let player = PlayerEntity(imageName: "Bird0")
    
    var deltaTime: TimeInterval = 0
    var lastUpdateTimeInterval: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        addChild(worldNode)
        setupBackground()
        setupForeground()
        setupPlayer()
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        background.position = CGPoint(x: size.width / 2, y: size.height)
        background.zPosition = Layer.background.rawValue
        worldNode.addChild(background)
    }
    
    func setupForeground() {
        
        for i in 0..<numberOfForegrounds {
            let foreground = SKSpriteNode(imageNamed: "Ground")
            foreground.anchorPoint = CGPoint(x: 0.0, y: 0.0)
            foreground.position = CGPoint(x: CGFloat(i) * foreground.size.width, y: playableStart)
            foreground.zPosition = Layer.foreground.rawValue
            foreground.name = "foreground"
            worldNode.addChild(foreground)
        }
    }
    
    func updateForeground() {
        // MoveForeGround
        worldNode.enumerateChildNodes(withName: "foreground") { (node, stop) in
            if let foreground = node as? SKSpriteNode {
                let moveAmount = CGPoint(x: -self.groundSpeed * CGFloat(self.deltaTime), y: 0)
                
                foreground.position += moveAmount
                if foreground.position.x < -foreground.size.width {
                    foreground.position += CGPoint(x: foreground.size.width * CGFloat(self.numberOfForegrounds), y: 0)
                }
            }
        }
    }
    
    func setupPlayer() {
        let playerNode = player.spriteComponent.node
        playerNode.position = CGPoint(x: size.width * 0.2, y: playableHeight * 0.4 + playableStart)
        playerNode.zPosition = Layer.player.rawValue
        
        worldNode.addChild(playerNode)
        
        player.movementComponent.playableStart = playableStart
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTimeInterval == 0 {
            lastUpdateTimeInterval = currentTime
        }
        
        deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        updateForeground()
        
        player.update(deltaTime: deltaTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.movementComponent.applyImpluse(lastUpdateTimeInterval)
    }
}
