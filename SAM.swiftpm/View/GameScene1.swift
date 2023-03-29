//
//  GameScene.swift
//  SAM
//  Created by 7gongong on 2023/03/28.
//

import Foundation
import SpriteKit
import GameKit
import SwiftUI

class GameScene1: SKScene, SKPhysicsContactDelegate {
    var clearCounter = 0
    
    let background = SKSpriteNode(imageNamed: "background")
    let paddel = SKSpriteNode(imageNamed: "paddel")
    let ball = SKSpriteNode(imageNamed: "jiku")
    
    @State var toggleForOnOff : Bool = false


    
    override func didMove(to view: SKView) {

        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        self.isPaused = true
        
        // background
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.65)
        addChild(background)
        backgroundColor = .black
        
        // paddel
        paddel.position = CGPoint(x: size.width / 2, y: 60 + 80)
        paddel.size = CGSize(width: 100, height: 20)
        paddel.zPosition = 10
        paddel.physicsBody = SKPhysicsBody(rectangleOf: paddel.size)
        paddel.physicsBody?.friction = 0
        paddel.physicsBody?.allowsRotation = false
        paddel.physicsBody?.restitution = 1
        paddel.physicsBody?.isDynamic = false
        paddel.physicsBody?.categoryBitMask = bitmasks.paddel.rawValue
        paddel.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
        paddel.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
        addChild(paddel)
        
        // ball
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + 30
        ball.zPosition = 10
        ball.size = CGSize(width: 60, height: 60)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.velocity = CGVector(dx: 350, dy: 350)
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        ball.physicsBody?.categoryBitMask = bitmasks.ball.rawValue
        ball.physicsBody?.contactTestBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        ball.physicsBody?.collisionBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        addChild(ball)
        
        // frame
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
        self.physicsBody = frame
        
        // stones

//        var ynum = 580
//        var ynum = 580 - 40
        var ynum = 580 - 40 - 240   
        
        for _ in 0...2{
            ynum += 20
            makeStones(reihe: 6, bitmask: 0b10, y: ynum, name: "blockB")
        }
        
        for _ in 0...8{
            ynum += 20
            makeStones2(reihe: 6, bitmask: 0b10, y: ynum, name: "blockU_unbreakable")
        }
        
        // TODO : Stones below to be deleted after double sizing blocks
        for _ in 0...2{
            ynum += 20
            makeStones(reihe: 6, bitmask: 0b10, y: ynum, name: "blockB")
        }
        
        for _ in 0...8{
            ynum += 20
            makeStones2(reihe: 6, bitmask: 0b10, y: ynum, name: "blockU_unbreakable")
        }
    }
    // touch operation
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddel.position.x = location.x
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isPaused = false
    }
    
    // paddel range
    override func update(_ currentTime: TimeInterval) {
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
        }
    }
    
    // Set stones
    func makeStones(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let stone = SKSpriteNode(imageNamed: name)
            stone.size = CGSize(width: 64, height: 20)
            stone.position = CGPoint(x:  i * Int(stone.size.width) - 26, y: y)
            stone.zPosition = 10
            stone.name = "Stone" + String(i)
            stone.physicsBody = SKPhysicsBody(rectangleOf: stone.size)
            stone.physicsBody?.friction = 0
            stone.physicsBody?.allowsRotation = false
            stone.physicsBody?.restitution = 1
            stone.physicsBody?.isDynamic = false
            stone.physicsBody?.categoryBitMask = bitmasks.stone.rawValue
            stone.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
            stone.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
            addChild(stone)
        }
    }
    
    // Unbreakable stones
    func makeStones2(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let stone = SKSpriteNode(imageNamed: name)
            stone.size = CGSize(width: 64, height: 20)
            stone.position = CGPoint(x:  i * Int(stone.size.width) - 26, y: y)
            stone.zPosition = 10
            stone.name = "Stone" + String(i)
            stone.physicsBody = SKPhysicsBody(rectangleOf: stone.size)
            stone.physicsBody?.friction = 0
            stone.physicsBody?.allowsRotation = false
            stone.physicsBody?.restitution = 1
            stone.physicsBody?.isDynamic = false
            stone.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
            stone.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
            addChild(stone)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA
        }
        
        if contactA.categoryBitMask == bitmasks.stone.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            contactA.node?.removeFromParent()
            
            // breakout counter
            clearCounter = clearCounter + 1
            if clearCounter == 2 {
                gameClear()
            }
        }
        
        // game over
        if contactA.categoryBitMask == bitmasks.frame.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            let yPosition = contact.contactPoint.y
            if yPosition <= self.frame.minY + 10 {
                gameClear()
            }
        }
    }
    
    func gameClear() {
        self.isPaused = true



    }
}
    

