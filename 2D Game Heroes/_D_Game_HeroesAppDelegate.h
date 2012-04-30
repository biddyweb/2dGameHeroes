//
//  _D_Game_HeroesAppDelegate.h
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _D_Game_HeroesViewController;

@interface _D_Game_HeroesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet _D_Game_HeroesViewController *viewController;

@end
