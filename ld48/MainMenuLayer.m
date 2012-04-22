//
//  MainMenuLayer.m
//  ld48
//
//  Created by arjun prakash on 4/21/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer

//@synthesize startGame = _startGame;

- (void)initJoystickAndButton {
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;

    CGRect startButtonDimensions = CGRectMake(0, 0, 40.0f, 204.0f);

    CGPoint startButtonPosition;
 
    CCSprite *tempButton = [CCSprite spriteWithFile:@"startButtonUp.png"]; 
    
    glowZ = [CCSprite spriteWithFile:@"mainMenuBackgroundGlow.png"];
    glowZ.position = ccp(517.0f, 526.0f);
    CCBlink *blink = [CCBlink actionWithDuration:1.0f blinks:1];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:blink];
    [glowZ runAction:repeat];
    
    //glowZ.position = ccp(screenSize.width*0.5f, screenSize.height*0.5f);
    [self addChild:glowZ z:1];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //The device is an ipad running iOS 3.2 or later.
        CCLOG(@"Positioning Joystick and Buttons for iPad");
        startButtonPosition = ccp(screenSize.width*1.0f - (([tempButton texture].contentSize.width)*0.5f)-12 , screenSize.height*0.5f);

        //startButtonPosition = ccp(screenSize.width*0.5f , screenSize.height*0.5f);
    } else {
        //The device is a iPhone or iPod touch
        CCLOG(@"iPhone loaded");
    }
                                  
  
    SneakyButtonSkinnedBase *startButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease];        
    startButtonBase.position = startButtonPosition;                
    startButtonBase.defaultSprite = [CCSprite spriteWithFile:@"startButtonUp.png"];                     
    startButtonBase.activatedSprite = [CCSprite spriteWithFile:@"startButtonDown.png"];                  
    startButtonBase.pressSprite = [CCSprite spriteWithFile:@"startButtonDown.png"];                   
    startButtonBase.button = [[SneakyButton alloc] initWithRect:startButtonDimensions]; 
    startButton = [startButtonBase.button retain];                
    startButton.isToggleable = NO;                                
    [self addChild:startButtonBase];                              
    

}

-(void)applyJoystick:(id)aJoystick toNode:(CCNode *)tempNode forTimeDelta:(float)deltaTime
{
    //CCLOG(@"Start button is pressed.");
    
    if (startButton.active == YES) {
        CCLOG(@"Start button is pressed.");
        startGame = YES;
        
    }
    
}

-(void)blowSprite:(CCSprite*)spider {

}

#pragma mark -
#pragma mark Updeate Method
- (void)update:(ccTime)deltaTime {


    [self applyJoystick:nil toNode:nil forTimeDelta:deltaTime];
    if (startGame) {
        CCLOG(@"game started");
        [[CCDirector sharedDirector] replaceScene:[GameScene node]];
        [self stopAllActions];
        [self unscheduleAllSelectors];
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        
        startGame = NO;
        
        // Initialization code here.
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        //enable touches
        self.isTouchEnabled = YES;
        
        //CCSprite
    }
    
    [self initJoystickAndButton];
    
    
    [self scheduleUpdate];
    
    return self;
}


@end
