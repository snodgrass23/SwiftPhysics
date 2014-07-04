//
//  GameScene.swift
//  SpriteKitPhysics
//
//  Created by Jim Snodgrass on 6/27/14.
//  Copyright (c) 2014 Jim Snodgrass. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var particles: Particle[] = []
    let maxParticles = 250
    let gravity = -0.3
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if particles.count < maxParticles {
            for i in 1..2 {
                let p = Particle(x: frame.width/2, y:0)
                let (xPush, yPush) = randomPush()
                p.move(xPush, y: yPush )
                addChild(p.node)
                particles.append(p)
            }
        }
        
        for p in particles {
            let (velX, velY) = p.velocity()
            if p.y <= 0.1 && velY <= 0.1 {
                p.place(frame.width/2, y:0)
                let (xPush, yPush) = randomPush()
                p.move(xPush, y: yPush )
            }
            p.move(0.0, y: gravity)
            p.integrate()
            p.bounce()
            p.draw()
        }
    }
    
    func randomPush() -> (Double, Double) {
        let xPush = drand48() * 6.0 - 3.0
        let yPush = drand48() * 10.0 + 15.0
        return (xPush, yPush)
    }
}
