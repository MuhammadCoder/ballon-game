//
//  GameScene.h
//  balloon
//

//  Copyright (c) 2016 Muhammad . All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene  <SKPhysicsContactDelegate>

{
    CGPoint balloonlocation;
}

@property BOOL fingerPressed;

- (void)ground;
- (void)balloon;//: (CGPoint) location;//:(CGPoint *)location;
- (void)spike;

@end
