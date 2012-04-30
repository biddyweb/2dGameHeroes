//
//  OppSelectViewController.h
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "GameScreenViewController.h"

@interface OppSelectViewController : UIViewController
{
    AVAudioPlayer * backgroundPlayer;
    NSString * characterName;
    NSUInteger characterClass;
    UIButton * selectedCharacter;
    UIButton * characterPic;
    UILabel * creatureLabel;
    UILabel * charNameLabel;
    GameScreenViewController * gameView;

}

@property (nonatomic, retain) AVAudioPlayer * backgroundPlayer;
@property (nonatomic, retain) NSString * characterName;
@property (nonatomic) NSUInteger characterClass;
@property (nonatomic, retain) IBOutlet UIButton * selectedCharacter;
@property (nonatomic, retain) IBOutlet UIButton * characterPic;
@property (nonatomic, retain) IBOutlet UILabel * creatureLabel; 
@property (nonatomic, retain) IBOutlet UILabel * charNameLabel;
@property (nonatomic, retain) GameScreenViewController * gameView;

-(IBAction)oppSelected:(id)sender;
-(IBAction)selectionMade:(id)sender;
- (IBAction)characterReselect:(id)sender;


    
@end
