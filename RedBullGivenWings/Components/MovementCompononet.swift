//
//  MovementCompononet.swift
//  RedBullGivenWings
//
//  Created by Alisher Abdukarimov on 7/27/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//


import GameKit
import SpriteKit

class MovementComponent: GKComponent {
    
    let spriteComponent: SpriteComponent
    
    var velocity = CGPoint.zero
    let gravity: CGFloat = -1500
    let impulse: CGFloat = 400
    var playableStart: CGFloat = 0
    
    init(entity: GKEntity) {
        self.spriteComponent = entity.component(ofType: SpriteComponent.self)!
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func applyMovement(_ seconds: TimeInterval) {
        let spriteNode = spriteComponent.node
        
        // Apply Gravity
        let gravityStep = CGPoint(x: 0, y: gravity) * CGFloat(seconds)
        velocity += gravityStep
        
        //Apply Velocity
        let velocityStep = velocity * CGFloat(seconds)
        spriteNode.position += velocityStep
        
        // temp
        
        if spriteNode.position.y - spriteNode.size.height / 2 < playableStart {
            spriteNode.position = CGPoint(x: spriteNode.position.x, y: playableStart + spriteNode.size.height / 2)
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if let player = entity as? PlayerEntity {
            applyMovement(seconds)
        }
    }
    
    func applyImpluse(_ timeInterval: TimeInterval){
        velocity = CGPoint(x: 0, y: impulse)
    }
}
