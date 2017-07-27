//
//  SpriteComponent.swift
//  RedBullGivenWings
//
//  Created by Alisher Abdukarimov on 7/27/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//


import GameKit
import SpriteKit

class EntityNode: SKSpriteNode {
    
}

class SpriteComponent: GKComponent {
    let node: EntityNode
    
    init(entity: GKEntity, texture: SKTexture, size: CGSize) {
        node = EntityNode(texture: texture, color: SKColor.white, size: size)
        node.entity = entity
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
