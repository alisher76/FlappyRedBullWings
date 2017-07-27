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
    case background, foreground
}

class GameScene: SKScene {
    
    let worldNode = SKNode()
    var playableStart: CGFloat = 0
    var playableHeight: CGFloat = 0
    
    override func didMove(to view: SKView) {
        addChild(worldNode)
        setupBackground()
        setupForeground()
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        background.position = CGPoint(x: size.width / 2, y: size.height)
        background.zPosition = Layer.background.rawValue
        worldNode.addChild(background)
    }
    
    func setupForeground() {
        let foreground = SKSpriteNode(imageNamed: "Ground")
        foreground.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        foreground.position = CGPoint(x: 0, y: playableStart)
        foreground.zPosition = Layer.foreground.rawValue
        worldNode.addChild(foreground)
    }
}
