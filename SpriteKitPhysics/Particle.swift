//
//  Particle.swift
//  SpriteKitPhysics
//
//  Created by Jim Snodgrass on 6/27/14.
//  Copyright (c) 2014 Jim Snodgrass. All rights reserved.
//

import SpriteKit

class Particle {
    
    var x = 0.0
    var y = 0.0
    var xPrev = 0.0
    var yPrev = 0.0
    var node = SKSpriteNode()
    let damping = 0.99
    let bounciness = 0.4
    
    init(x:Double, y:Double) {
        place(x, y:y)
        node.size = CGSizeMake(2, 2)
    }
    
    func place(x:Double, y:Double) {
        self.x = x
        self.y = y
        xPrev = x
        yPrev = y
        node.color = SKColor.redColor()
    }
    
    func draw() {
        node.position = CGPointMake(CGFloat(x), CGFloat(y))
    }
    
    func integrate() {
        let (velX, velY) = velocity()
        xPrev = x
        yPrev = y
        x += velX * damping
        y += velY * damping
    }
    
    func move(x:Double, y:Double) {
        self.x += x
        self.y += y
    }
    
    func velocity() -> (Double, Double) {
        return (x - xPrev, y - yPrev)
    }
    
    func bounce() {
        if y < 0 {
            let (velX, velY) = velocity()
            yPrev = 0
            y = -(velY * bounciness)
        }
    }
    
}
