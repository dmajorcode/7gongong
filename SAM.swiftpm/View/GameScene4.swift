//
//  SwiftUIView.swift
//  
//
//  Created by 077tech on 2023/03/28.
//

import Foundation
import SpriteKit
import GameKit
import SwiftUI

class GameScene4: SKScene, SKPhysicsContactDelegate {
    let background = SKSpriteNode(imageNamed: "background")
    let paddel = SKSpriteNode(imageNamed: "paddel")
    let dianeBall = SKSpriteNode(imageNamed: "diane")
    let MKBall = SKSpriteNode(imageNamed: "MK")
    let pepeBall = SKSpriteNode(imageNamed: "pepe")
    var randomInt : [Int] = []
    
    override func didMove(to view: SKView) {
        makeRandomNumber()
        let balls : [SKSpriteNode] = [dianeBall, MKBall, pepeBall]
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        // background
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.65)
        addChild(background)
        backgroundColor = .black
        
        // paddel
        paddel.position = CGPoint(x: size.width / 2, y: 140)
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
        
        for i in 0...2{
            makeBall(balls[i], randomInt[i])
            print(balls[i])
        }
        
        // frame
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
        self.physicsBody = frame
        
        // stones
        var ynum = 580
        
        for _ in 0...2{
            ynum += 20
            makeStones(reihe: 6, bitmask: 0b10, y: ynum, name: "blockR")
        }
    }
    
    func makeRandomNumber(){
        for _ in 0...5{
            randomInt.append(Int.random(in: 200...300))
        }
    }
    
    func makeBall(_ ballname:SKSpriteNode, _ ranNum:Int){
        ballname.position.x = background.position.x+100
        ballname.position.y = background.position.y+100
        ballname.zPosition = CGFloat(ranNum)
        ballname.size = CGSize(width: 60, height: 60)
        ballname.physicsBody = SKPhysicsBody(circleOfRadius: ballname.size.height / 2)
        ballname.physicsBody?.friction = 0
        ballname.physicsBody?.restitution = 1
        ballname.physicsBody?.linearDamping = 0
        ballname.physicsBody?.angularDamping = 0
        ballname.physicsBody?.allowsRotation = false
        ballname.physicsBody?.velocity = CGVector(dx: CGFloat(ranNum), dy: CGFloat(ranNum))
        ballname.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        ballname.physicsBody?.categoryBitMask = bitmasks.ball.rawValue
        ballname.physicsBody?.contactTestBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        ballname.physicsBody?.collisionBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        addChild(ballname)
    }
    // touch operation
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddel.position.x = location.x
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
    // paddel range
    override func update(_ currentTime: TimeInterval) {
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
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
        }
    }
}

