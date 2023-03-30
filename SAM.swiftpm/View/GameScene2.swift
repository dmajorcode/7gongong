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

class GameScene2: SKScene, SKPhysicsContactDelegate {
    var clearCounter = 0
    
    let background = SKSpriteNode(imageNamed: "background")
    let paddel = SKSpriteNode(imageNamed: "paddel")
    let chadBall = SKSpriteNode(imageNamed: "chad")
    let maltyBall = SKSpriteNode(imageNamed: "malty")
    
    var randomInt : [Int] = []

    
    override func didMove(to view: SKView) {
        makeRandomNumber()
        let balls : [SKSpriteNode] = [chadBall, maltyBall]
        
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
        
        for i in 0...1{
            makeBall(balls[i], randomInt[i])
            print(balls[i])
        }
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
        
        
        // frame
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
        self.physicsBody = frame
        
        // stones
        var ynum = 580 - 40 - 240 + 120
        
        for _ in 0...2{
            ynum += 20*2
            makeStones(reihe: 3, bitmask: 0b10, y: ynum, name: "blockP")
        }
        
        for _ in 0...5{
            ynum += 20*2
            makeStones2(reihe: 3, bitmask: 0b10, y: ynum, name: "blockU_unbreakable")
        }
    }
    func makeRandomNumber(){
        for _ in 0...5{
            randomInt.append(Int.random(in: 200...300))
        }
        
    }
    
    func makeBall(_ ballname:SKSpriteNode, _ ranNum:Int){
        ballname.position.x = background.position.x+100
        ballname.position.y = background.position.y+100-120
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
    
    // paddel range
    override func update(_ currentTime: TimeInterval) {
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
        }
    }
    
    // set stones
    func makeStones(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let stone = SKSpriteNode(imageNamed: name)
            stone.size = CGSize(width: 64*2, height: 20*2)
            stone.position = CGPoint(x: i * Int(stone.size.width) - 55, y: y)
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
    
    // unbreakable stones
    func makeStones2(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let stone = SKSpriteNode(imageNamed: name)
            stone.size = CGSize(width: 64*2, height: 20*2)
            stone.position = CGPoint(x: i * Int(stone.size.width) - 55, y: y)
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
            
            if clearCounter == 9 {
                stageClear()
            }
        }
        
        // game over
        if contactA.categoryBitMask == bitmasks.frame.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            let yPosition = contact.contactPoint.y
            if yPosition <= self.frame.minY + 10 {
                gameOver()
            }
        }
        
    }
    
    // Restart the current stage here
    func resetGame() {
        // Remove all nodes from the scene
        self.removeAllChildren()
        
        // Reset the game state
        clearCounter = 0
        
        // Re-initialize the game elements
        didMove(to: view!)
    }
    
    func gameOver() {
        scene?.isPaused = true
        let alert = UIAlertController(title: "Game Over", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
            self.resetGame()
            self.scene?.isPaused = false
        }))
        
        if let viewController = self.view?.window?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    func stageClear() {
        // Pause the game
        scene?.isPaused = true
        
        // Show stage completed message
        let alert = UIAlertController(title: "Stage Completed", message: "Congratulations!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            // Resume the game
            self?.scene?.isPaused = true
        }))
        if let viewController = self.view?.window?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
