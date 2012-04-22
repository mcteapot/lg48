//
//  MainMenuLayer.h
//  ld48
//
//  Created by arjun prakash on 4/21/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
//#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
//#import "SneakyJoystickSkinnedBase.h"
#import "GameScene.h"

@interface MainMenuLayer : CCLayer {
 
    SneakyButton *startButton;
    BOOL startGame;
    CCSprite *glowZ;
    
}
//@property (assign, nonatomic) BOOL startGame;

@end
