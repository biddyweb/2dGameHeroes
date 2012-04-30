//
//  GameScreenViewController.h
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>



@interface GameScreenViewController : UIViewController <UIAlertViewDelegate>
{
    AVAudioPlayer * backgroundPlayer;
    BOOL playerTurn;
    NSInteger playerOrgHealth;
    NSInteger creatureOrgHealth;
    NSInteger playerHealth;
    NSInteger creatureHealth;
    NSInteger userChar;
    NSInteger creatureType;
    NSString * characterName;
    UILabel *creatureNameLabel;
    UILabel *characterNameLabel;
    UIProgressView *creatureHealthBar;
    UIProgressView *characterHealthBar;
    UIImageView *characterPortraitView;
    UIImageView *creaturePortraitView;
    UIButton *primaryAttackButton;
    UIButton *specialAttackButton;
    NSUInteger startTime;
    BOOL haveCompleted;
    
}

@property (nonatomic) BOOL haveCompleted;
@property (nonatomic, retain) AVAudioPlayer * backgroundPlayer;
@property (nonatomic) BOOL playerTurn;
@property (nonatomic) NSInteger playerOrgHealth;
@property (nonatomic) NSInteger creatureOrgHealth;
@property (nonatomic) NSInteger playerHealth;
@property (nonatomic) NSInteger creatureHealth;
@property (nonatomic) NSInteger userChar;
@property (nonatomic) NSInteger creatureType;
@property (nonatomic, retain) NSString * characterName;
@property (nonatomic, retain) IBOutlet UILabel *creatureNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *characterNameLabel;
@property (nonatomic, retain) IBOutlet UIProgressView *creatureHealthBar;
@property (nonatomic, retain) IBOutlet UIProgressView *characterHealthBar;
@property (nonatomic, retain) IBOutlet UIImageView *characterPortraitView;
@property (nonatomic, retain) IBOutlet UIImageView *creaturePortraitView;
@property (nonatomic, retain) IBOutlet UIButton *primaryAttackButton;
@property (nonatomic, retain) IBOutlet UIButton *specialAttackButton;
@property (nonatomic) NSUInteger startTime;

-(void)gameEngine;
-(BOOL)rollInit;
-(void)playerAttack;
-(void)creatureAttack;
- (IBAction)playerAttackSelected:(UIButton *)sender;
-(NSUInteger)getAttackPower;

@end
