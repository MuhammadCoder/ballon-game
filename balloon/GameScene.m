//
//  GameScene.m
//  balloon
//
//  Created by Muhammad  on 2016-08-19.
//  Copyright (c) 2016 Muhammad . All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

{
    SKSpriteNode *balloon;
    SKView *currentView;
    
    SKAction *createballon;
    
    SKLabelNode *score;
    SKLabelNode *lives;
    
    int scoreAdd;
    int livesLost;
    
}

static const uint32_t balloonCategory = 0x1 << 0;
static const uint32_t spikeCategeory = 0x1 << 1;


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    currentView = view;
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.backgroundColor = [SKColor colorWithRed:0.54 green:0.7853 blue:1.0 alpha:1.0];
    self.physicsWorld.contactDelegate = self;
    
    [self ground];
    [self spike];
    [self Lable];
    
    createballon = [SKAction runBlock:^ {
        int randomTime = arc4random() % 4;
        [self performSelector:@selector(balloon) withObject:self afterDelay:randomTime];
        
    }];
     [self runAction:createballon];
    
    balloonlocation = balloon.position;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self balloonPop:location];
    
     }
  
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

-(void)balloonPop:(CGPoint)press
{

    SKNode *balloonTap = [self nodeAtPoint:press];
   
    if ([balloonTap.name isEqualToString:@"balloon"])
    {
        [self remove];
        [self increment];
    
    }
    
}

-(void)Lable {
    
    score = [SKLabelNode labelNodeWithText:@"Score: 0"];
    score.name = @"score";
    score.fontSize = 30;
    score.position = CGPointMake(-130, 300);
    score.color = [UIColor whiteColor];
    [self addChild:score];
    
    
    lives = [SKLabelNode labelNodeWithText:@"Lives: 3"];
    lives.name = @"lives";
    lives.fontSize = 30;
    lives.position = CGPointMake(130, 300);
    lives.color = [UIColor whiteColor];
    [self addChild:lives];
    
   
}

-(void)increment {
    
    scoreAdd = scoreAdd + 1;
    score.text = [NSString stringWithFormat:@"SCORE: %d",scoreAdd];
   
}

-(void)live {
    
    if (livesLost > 3)
    {
        livesLost = livesLost - 1;
        lives.text = [NSString stringWithFormat:@"Lives: %d", livesLost];
    }
    else {
        
    }

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


- (void)balloon
{

    balloon = [SKSpriteNode spriteNodeWithImageNamed:@"balloon"];
    //balloon = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(10, 10)];
    balloon.size = CGSizeMake(100, 100);
    //balloon.position = *(location);
    balloon.name = @"balloon";
    balloon.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30];
    balloon.physicsBody.dynamic = YES;
    int randXposition = arc4random() % (int)currentView.frame.size.width/2 + 1;
    balloon.position = CGPointMake(randXposition, currentView.frame.size.height);
    
    balloon.physicsBody.categoryBitMask = balloonCategory;
    balloon.physicsBody.contactTestBitMask =  spikeCategeory;
    balloon.physicsBody.collisionBitMask = spikeCategeory;
    
    [self ballonFall: balloon];
    [self addChild:balloon];
    [self runAction:createballon];
    
}

- (void)ballonFall:(SKSpriteNode*)ballon
{
    SKAction * fall = [SKAction moveToY:10 duration:1];
    [ballon runAction:fall];
}

- (void)spike
{
   SKSpriteNode *spike = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike.size = CGSizeMake(40, 40);
    spike.position = CGPointMake(0 , -360);
    spike.name = @"spike";
    spike.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike.size];
    spike.physicsBody.dynamic = NO;
    
    spike.physicsBody.categoryBitMask = spikeCategeory;
    spike.physicsBody.contactTestBitMask = balloonCategory;
    spike.physicsBody.collisionBitMask = balloonCategory;
    
    [self addChild:spike];
    
    SKSpriteNode *spike2 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike2.size = CGSizeMake(40, 40);
    spike2.position = CGPointMake(-40 , -360);
    spike2.name = @"spike1";
    spike2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike2.size];
    spike2.physicsBody.dynamic = NO;
    
    spike2.physicsBody.categoryBitMask = spikeCategeory;
    spike2.physicsBody.contactTestBitMask = balloonCategory;
    spike2.physicsBody.collisionBitMask = balloonCategory;
     [self addChild:spike2];
    
    
    SKSpriteNode *spike3 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike3.position = CGPointMake(-80 , -360);
    spike3.size = CGSizeMake(40, 40);
    spike3.name = @"spike1";
    spike3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike3.size];
    spike3.physicsBody.dynamic = NO;
    
    spike3.physicsBody.categoryBitMask = spikeCategeory;
    spike3.physicsBody.contactTestBitMask = balloonCategory;
    spike3.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike3];
    
    SKSpriteNode *spike4 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike4.position = CGPointMake(-120 , -360);
    spike4.size = CGSizeMake(40, 40);
    spike4.name = @"spike1";
    spike4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike4.size];
    spike4.physicsBody.dynamic = NO;
    
    spike4.physicsBody.categoryBitMask = spikeCategeory;
    spike4.physicsBody.contactTestBitMask = balloonCategory;
    spike4.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike4];
    
   SKSpriteNode *spike5 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike5.position = CGPointMake(-160 , -360);
    spike5.size = CGSizeMake(40, 40);
    spike5.name = @"spike1";
    spike5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike5.size];
    spike5.physicsBody.dynamic = NO;
    
    spike5.physicsBody.categoryBitMask = spikeCategeory;
    spike5.physicsBody.contactTestBitMask = balloonCategory;
    spike5.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike5];
    
    SKSpriteNode *spike6 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike6.position = CGPointMake(-200 , -360);
    spike6.size = CGSizeMake(40, 40);
    spike6.name = @"spike1";
    spike6.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike6.size];
    spike6.physicsBody.dynamic = NO;
    
    spike6.physicsBody.categoryBitMask = spikeCategeory;
    spike6.physicsBody.contactTestBitMask = balloonCategory;
    spike6.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike6];
    
    SKSpriteNode *spike7 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike7.position = CGPointMake(40 , -360);
    spike7.size = CGSizeMake(40, 40);
    spike7.name = @"spike1";
    spike7.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike7.size];
    spike7.physicsBody.dynamic = NO;
    
    spike7.physicsBody.categoryBitMask = spikeCategeory;
    spike7.physicsBody.contactTestBitMask = balloonCategory;
    spike7.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike7];
    
    SKSpriteNode *spike8 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike8.position = CGPointMake(80 , -360);
    spike8.size = CGSizeMake(40, 40);
    spike8.name = @"spike1";
    spike8.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike8.size];
    spike8.physicsBody.dynamic = NO;
    
    spike8.physicsBody.categoryBitMask = spikeCategeory;
    spike8.physicsBody.contactTestBitMask = balloonCategory;
    spike8.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike8];
    
    SKSpriteNode *spike9 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike9.position = CGPointMake(120 , -360);
    spike9.size = CGSizeMake(40, 40);
    spike9.name = @"spike1";
    spike9.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike9.size];
    spike9.physicsBody.dynamic = NO;
    
    spike9.physicsBody.categoryBitMask = spikeCategeory;
    spike9.physicsBody.contactTestBitMask = balloonCategory;
    spike9.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike9];
    
    SKSpriteNode *spike10 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike10.position = CGPointMake(160 , -360);
    spike10.size = CGSizeMake(40, 40);
    spike10.name = @"spike1";
    spike10.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike10.size];
    spike10.physicsBody.dynamic = NO;
    
    spike10.physicsBody.categoryBitMask = spikeCategeory;
    spike10.physicsBody.contactTestBitMask = balloonCategory;
    spike10.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike10];
    
    SKSpriteNode *spike11 = [SKSpriteNode spriteNodeWithImageNamed:@"spike.png"];
    spike11.position = CGPointMake(200 , -360);
    spike11.size = CGSizeMake(40, 40);
    spike11.name = @"spike1";
    spike11.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike11.size];
    spike11.physicsBody.dynamic = NO;
    
    spike11.physicsBody.categoryBitMask = spikeCategeory;
    spike11.physicsBody.contactTestBitMask = balloonCategory;
    spike11.physicsBody.collisionBitMask = balloonCategory;
    [self addChild:spike11];
}

- (void)ground
{
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size: CGSizeMake(500, 10)];
    ground.position = CGPointMake(0, -380);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    ground.physicsBody.affectedByGravity = NO;
    
    [self addChild:ground];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
   
    SKPhysicsBody *firstBody;
    SKPhysicsBody *secondBody;

    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    
    if(firstBody.categoryBitMask == spikeCategeory || secondBody.categoryBitMask == spikeCategeory)
    {
        NSLog(@"balloon hit the spike");
       
        [self remove];
        [self live];
    }
    
}


-(void)remove
{
   
   [[self childNodeWithName:@"balloon"] removeFromParent];
    
}

@end
