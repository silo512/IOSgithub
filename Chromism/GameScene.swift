//
//  GameScene.swift
//  Chromism
//
//  Created by James Collier on 5/13/15.
//  Copyright (c) 2015 James Collier. All rights reserved.
//

import SpriteKit

enum BodyType:UInt32 {
    case charmy = 1
    case woodplank = 2
    case woodplank1 = 4
    case woodplank2 = 8
    case all = 16
}



let background = SKSpriteNode(imageNamed: "BackgroundBW")
let woodplank = SKSpriteNode(imageNamed: "woodplank")
let woodplank1 = SKSpriteNode(imageNamed: "woodplank")
let woodplank2 = SKSpriteNode(imageNamed: "woodplank")
let charmy = SKSpriteNode(imageNamed: "charmy")



class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        
        // physics delegate
        physicsWorld.contactDelegate = self
        
        
        // Add Sprites
        
        
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = -1
        addChild(background)
        
        
        //woodplank.anchorPoint = CGPointZero
        woodplank.position = CGPoint(x: 175 , y: 1500)
        woodplank.setScale(0.50)
        addChild(woodplank)
        
        //woodplank1.anchorPoint = CGPointZero
        woodplank1.position = CGPoint(x: 525 , y: 1000)
        woodplank1.setScale(0.50)
        addChild(woodplank1)
        
        //woodplank2.anchorPoint = CGPointZero
        woodplank2.position = CGPoint(x: 925 , y: 1800)
        woodplank2.setScale(0.50)
        addChild(woodplank2)
        
        //charmy.anchorPoint = CGPointZero
        charmy.position = CGPoint(x: 150 , y: 1800)
        charmy.setScale(0.50)
        addChild(charmy)

        
        // Add Physics
        
        charmy.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        charmy.physicsBody?.mass = 1.0
        charmy.physicsBody?.restitution = 0.0
        charmy.physicsBody?.allowsRotation = false
        charmy.physicsBody?.affectedByGravity = true
        charmy.physicsBody?.categoryBitMask = BodyType.charmy.rawValue
        charmy.physicsBody?.collisionBitMask = BodyType.woodplank.rawValue | BodyType.woodplank1.rawValue | BodyType.woodplank2.rawValue
        charmy.physicsBody?.contactTestBitMask = BodyType.woodplank.rawValue
        

        charmy.physicsBody?.dynamic = true
        
        
        
        
      
        
        
        woodplank.physicsBody = SKPhysicsBody(rectangleOfSize: woodplank.frame.size)
        woodplank.physicsBody?.affectedByGravity = false
        woodplank.physicsBody?.allowsRotation = false
        woodplank.physicsBody?.mass = 10
        woodplank.physicsBody?.restitution = 0.0
        woodplank.physicsBody?.categoryBitMask = BodyType.woodplank.rawValue
        woodplank.physicsBody?.collisionBitMask = BodyType.charmy.rawValue
        woodplank.physicsBody?.contactTestBitMask = BodyType.charmy.rawValue
        woodplank.physicsBody?.dynamic = false
        
        
        
        
        woodplank1.physicsBody = SKPhysicsBody(rectangleOfSize: woodplank1.frame.size)
        woodplank1.physicsBody?.affectedByGravity = false
        woodplank1.physicsBody?.allowsRotation = false
        woodplank1.physicsBody?.mass = 10
        woodplank1.physicsBody?.restitution = 0.0
        woodplank1.physicsBody?.categoryBitMask = BodyType.woodplank1.rawValue
        woodplank1.physicsBody?.collisionBitMask = BodyType.charmy.rawValue
        woodplank1.physicsBody?.contactTestBitMask = BodyType.charmy.rawValue
        woodplank1.physicsBody?.dynamic = false

        
        
        
        
        woodplank2.physicsBody = SKPhysicsBody(rectangleOfSize: woodplank2.frame.size)
        woodplank2.physicsBody?.affectedByGravity = false
        woodplank2.physicsBody?.allowsRotation = false
        woodplank2.physicsBody?.mass = 10
        woodplank2.physicsBody?.restitution = 0.0
        woodplank2.physicsBody?.categoryBitMask = BodyType.woodplank2.rawValue
        woodplank2.physicsBody?.collisionBitMask = BodyType.charmy.rawValue
        woodplank2.physicsBody?.contactTestBitMask = BodyType.charmy.rawValue
        woodplank2.physicsBody?.dynamic = false

        
 }
    
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        // gets called automatically when two objects begin contact
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch (contactMask) {
        case BodyType.charmy.rawValue | BodyType.woodplank.rawValue:
            println("contact made")
            
        case BodyType.charmy.rawValue | BodyType.woodplank1.rawValue:
            println("contact made")
            
        case BodyType.charmy.rawValue | BodyType.woodplank2.rawValue:
            println("contact made")
            
        case BodyType.charmy.rawValue | BodyType.all.rawValue:
            println("contact made")

        
        default:
        return
        }
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        // gets called automatically when two objects end contact
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch (contactMask) {
        case BodyType.charmy.rawValue | BodyType.woodplank.rawValue:
            println("contact ended")
            
        case BodyType.charmy.rawValue | BodyType.woodplank1.rawValue:
            println("contact ended")
            
        case BodyType.charmy.rawValue | BodyType.woodplank2.rawValue:
            println("contact ended")
            
        case BodyType.charmy.rawValue | BodyType.all.rawValue:
            println("contact ended")
            
            
        default:
        return
        }

    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins  */
        
        for touch: AnyObject in touches {
            
           
            charmy.physicsBody?.applyImpulse(CGVectorMake(50, 500))
            
            var playSoundEffect = SKAction.playSoundFileNamed("Beep_High_10.wav", waitForCompletion: false)
            self.runAction(playSoundEffect)
            
            
        }
    
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        woodplank.position = CGPoint(x: woodplank.position.x , y: woodplank.position.y - 1 )
        woodplank1.position = CGPoint(x: woodplank1.position.x , y: woodplank1.position.y - 2 )
        woodplank2.position = CGPoint(x: woodplank2.position.x , y: woodplank2.position.y - 3 )
        
        if (woodplank.position.y < 0){
            woodplank.position = CGPoint(x:175,  y:2048)
        }
        
        if (woodplank1.position.y < 0){
            woodplank1.position = CGPoint(x:525,  y:2048)
        }

        if (woodplank2.position.y < 0){
            woodplank2.position = CGPoint(x:925,  y:2048)
        }

        //println(woodplank2.size)
        
        
        
        
    }
    
    
    
    
    
}











/*  ------------------didMoveToView---------------------------  */

/* Setup your scene here
let myLabel = SKLabelNode(fontNamed:"Chalkduster")
myLabel.text = "Hello, World!";
myLabel.fontSize = 65;
myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));

self.addChild(myLabel)*/





/*  ------------------touches began--------------------------- */

/*   for touch in (touches as! Set<UITouch>) {
let location = touch.locationInNode(self)

let sprite = SKSpriteNode(imageNamed:"Spaceship")

sprite.xScale = 0.5
sprite.yScale = 0.5
sprite.position = location

let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)

sprite.runAction(SKAction.repeatActionForever(action))

self.addChild(sprite)
}  

if charmy_Y <= wood_Y + 50 && charmy_X < (wood_X + 90)
{

if charmy_Y <= wood_Y + 50 && charmy_X > (wood_X)
{
return true
}
}


random number gen CGFloat(arc4random_uniform(UInt32(100)))  cast as cgfloat


*/


