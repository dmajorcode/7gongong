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

//MARK: Variables
class FinalGameScene: SKScene, SKPhysicsContactDelegate {
    let background = SKSpriteNode(imageNamed: "Stage_1")
    let paddel = SKSpriteNode(imageNamed: "paddel")
    let ball = SKSpriteNode(imageNamed: "ball")
    let chadBall = SKSpriteNode(imageNamed: "chad")
    let dianeBall = SKSpriteNode(imageNamed: "diane")
    let maltyBall = SKSpriteNode(imageNamed: "malty")
    let MKBall = SKSpriteNode(imageNamed: "MK")
    let pepeBall = SKSpriteNode(imageNamed: "pepe")
    var randomInt : [Int] = []

//MARK: Body
    override func didMove(to view: SKView) {
        makeRandomNumber()
        let balls : [SKSpriteNode] = [ball, chadBall, dianeBall, maltyBall, MKBall, pepeBall]
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        // background
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.30)
        
        addChild(background)
        backgroundColor = .black
        

        for i in 0...5{
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
    }

//MARK: Functions
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
    
    func makeBall(_ ballname:SKSpriteNode, _ ranNum:Int){
        ballname.position.x = background.position.x
        ballname.position.y = background.position.y
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
    
    func makeRandomNumber(){
        for _ in 0...5{
            randomInt.append(Int.random(in: 200...700))
        }
        
    }
}
