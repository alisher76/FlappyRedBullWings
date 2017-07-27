//
//  GameViewController.swift
//  RedBullGivenWings
//
//  Created by Alisher Abdukarimov on 7/27/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let skView = self.view as? SKView {
            if skView.scene == nil {
                let aspectRatio = skView.bounds.size.height / skView.bounds.size.width
                let scene = GameScene(size: CGSize(width: 320, height: 320 * aspectRatio))
                // do not display frameRate indicator
                skView.showsFPS = false
                skView.showsNodeCount = false
                skView.showsPhysics = false
                //parent-child and sibling relationships affect the rendering order of nodes in the scene
                skView.ignoresSiblingOrder = true
                
                scene.scaleMode = .aspectFit
                
                skView.presentScene(scene)
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
