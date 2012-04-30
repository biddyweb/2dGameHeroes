//
//  _D_Game_HeroesViewController.h
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "CharacterSelectViewController.h"

@interface _D_Game_HeroesViewController : UIViewController
{
    AVAudioPlayer * backgroundPlayer;
}

@property (nonatomic, retain) AVAudioPlayer * backgroundPlayer;

-(IBAction)startGame:(id)sender;

@end
