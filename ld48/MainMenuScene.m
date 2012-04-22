//
//  MainMenu.m
//  ld48
//
//  Created by arjun prakash on 4/21/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import "MainMenuScene.h"


@implementation MainMenuScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuScene *layer = [MainMenuScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"GAME MENU" fontName:@"Marker Felt" fontSize:64];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *bg = [CCSprite spriteWithFile:@"mainMenuBackground.png"];
        bg.anchorPoint = ccp(0,0);
        [self addChild:bg z:-1];
/*        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
 */       
        MainMenuLayer * mainMenuLayer = [MainMenuLayer node];
        [self addChild:mainMenuLayer z:5];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

