//
//  OppSelectViewController.m
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import "OppSelectViewController.h"

@implementation OppSelectViewController
@synthesize characterName;
@synthesize characterClass;
@synthesize selectedCharacter;
@synthesize characterPic;
@synthesize creatureLabel;
@synthesize charNameLabel;
@synthesize gameView;
@synthesize backgroundPlayer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    gameView = [GameScreenViewController alloc];
    charNameLabel.text = characterName;
    gameView.characterName = characterName;
    gameView.userChar = characterClass;
    
    switch (characterClass) {
        case 0:
            [characterPic setImage:[UIImage imageNamed:@"warriorProjectIcon.png"] forState:UIControlStateNormal];
            break;
            
        case 1:
            [characterPic setImage:[UIImage imageNamed:@"wizardProjectImage.png"] forState:UIControlStateNormal];
            break;
        
        case 2:
            [characterPic setImage:[UIImage imageNamed:@"druidProjectImage.png"] forState:UIControlStateNormal];
            break;
            
        case 3:
            [characterPic setImage:[UIImage imageNamed:@"bardProjectImage.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)oppSelected:(UIButton *)sender
{
    NSUInteger theTag = sender.tag;
    NSString * path;
    
    switch (theTag) {
        case 0:
            [selectedCharacter setImage:[UIImage imageNamed:@"goblinProjectImage.png"] forState:UIControlStateNormal];
                creatureLabel.text = @"Goblin";
            
            
            path = [[NSBundle mainBundle] pathForResource:@"goblinVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
            
        case 1:
            [selectedCharacter setImage:[UIImage imageNamed:@"koboldProjectImage.png"] forState:UIControlStateNormal];
            creatureLabel.text = @"Kobold";
            
            path = [[NSBundle mainBundle] pathForResource:@"koboldVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
            
        case 2:
            [selectedCharacter setImage:[UIImage imageNamed:@"orcProjectImage.png"] forState:UIControlStateNormal];
            creatureLabel.text = @"Orc";
            
            path = [[NSBundle mainBundle] pathForResource:@"orcVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
        
        case 3:
            [selectedCharacter setImage:[UIImage imageNamed:@"dragonProjectImage.png"] forState:UIControlStateNormal];
            creatureLabel.text = @"Dragon";
            path = [[NSBundle mainBundle] pathForResource:@"dragonVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
            
        case 4:
            [selectedCharacter setImage:[UIImage imageNamed:@"skeletonProjectImage.png"] forState:UIControlStateNormal];
            creatureLabel.text = @"Skeleton";
            
            path = [[NSBundle mainBundle] pathForResource:@"skeletonVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
            
        case 5:
            [selectedCharacter setImage:[UIImage imageNamed:@"zombieProjectImage.png"] forState:UIControlStateNormal];
            creatureLabel.text = @"Zombie";
            
            path = [[NSBundle mainBundle] pathForResource:@"zombieVoice" ofType:@"wav"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            gameView.creatureType = theTag;
            selectedCharacter.enabled = TRUE;
            break;
            
        default:
            break;
    }
}

-(IBAction)selectionMade:(id)sender
{
    GameScreenViewController * newView = gameView;
    newView.userChar = characterClass;
    [self presentModalViewController:newView animated:YES];
    [newView release];
    gameView = [GameScreenViewController alloc];
    [backgroundPlayer stop];
}

- (IBAction)characterReselect:(id)sender {
    [self dismissModalViewControllerAnimated:TRUE];
}

-(void)dealloc
{
    [backgroundPlayer release];
    [super dealloc];
}


@end
