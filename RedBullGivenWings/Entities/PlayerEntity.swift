//
//  PlayerEntity.swift
//  RedBullGivenWings
//
//  Created by Alisher Abdukarimov on 7/27/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import GameKit
import SpriteKit

class PlayerEntity: GKEntity {
    
    var spriteComponent: SpriteComponent!
    var movementComponent: MovementComponent!
    
    init(imageName: String) {
        super.init()
        
        let texture = SKTexture(imageNamed: imageName)
        spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        movementComponent = MovementComponent(entity: self)
        addComponent(movementComponent)
        
        // Add Physics
        let spriteNode = spriteComponent.node
        spriteNode.physicsBody = SKPhysicsBody(texture: spriteNode.texture!, size: spriteNode.frame.size)
        spriteNode.physicsBody?.categoryBitMask = PhysicsCategory.Player
        spriteNode.physicsBody?.collisionBitMask = 0
        spriteNode.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle; PhysicsCategory.Ground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
