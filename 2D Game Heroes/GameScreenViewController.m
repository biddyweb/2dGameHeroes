//
//  GameScreenViewController.m
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import "GameScreenViewController.h"

@implementation GameScreenViewController
@synthesize creatureNameLabel;
@synthesize characterNameLabel;
@synthesize creatureHealthBar;
@synthesize characterHealthBar;
@synthesize characterPortraitView;
@synthesize creaturePortraitView;
@synthesize primaryAttackButton;
@synthesize specialAttackButton;
@synthesize characterName;
@synthesize creatureType;
@synthesize userChar;
@synthesize creatureHealth;
@synthesize playerHealth;
@synthesize playerOrgHealth;
@synthesize creatureOrgHealth;
@synthesize playerTurn;
@synthesize backgroundPlayer;
@synthesize haveCompleted;
@synthesize startTime;

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
    haveCompleted = FALSE;
    playerHealth = 20;
    characterNameLabel.text = characterName;
    startTime = [[NSDate date] timeIntervalSince1970];
    
    switch (userChar) {
        case 0:
            [characterPortraitView setImage:[UIImage imageNamed:@"warriorProjectIcon.png"]];
            [specialAttackButton setTitle:@"Running Smash" forState:UIControlStateNormal];
            playerOrgHealth = 35;
            playerHealth = playerOrgHealth;
            break;
            
        case 1:
            [characterPortraitView setImage:[UIImage imageNamed:@"wizardProjectImage.png"]];
            [specialAttackButton setTitle:@"Freezing Moon" forState:UIControlStateNormal];
            playerOrgHealth = 20;
            playerHealth = playerOrgHealth;
            break;
            
        case 2:
            [characterPortraitView setImage:[UIImage imageNamed:@"druidProjectImage.png"]];
            [specialAttackButton setTitle:@"Wild Vines" forState:UIControlStateNormal];
            playerOrgHealth = 30;
            playerHealth = playerOrgHealth;
            break;
            
        case 3:
            [characterPortraitView setImage:[UIImage imageNamed:@"bardProjectImage.png"]];
            [specialAttackButton setTitle:@"Play Song" forState:UIControlStateNormal];
            playerOrgHealth = 25;
            playerHealth = playerOrgHealth;
            break;
            
        default:
            break;
    }
    
    switch (creatureType) {
        case 0:
            [creaturePortraitView setImage:[UIImage imageNamed:@"goblinProjectImage.png"]];
            creatureNameLabel.text = @"Goblin";
            creatureHealth = 10;
            creatureOrgHealth = creatureHealth;
            break;
        
        case 1:
            [creaturePortraitView setImage:[UIImage imageNamed:@"koboldProjectImage.png"]];
            creatureNameLabel.text = @"Kobold";
            creatureHealth = 20;
            creatureOrgHealth = creatureHealth;
            break;
            
        case 2:
            [creaturePortraitView setImage:[UIImage imageNamed:@"orcProjectImage.png"]];
            creatureNameLabel.text = @"Orc";
            creatureHealth = 40;
            creatureOrgHealth = creatureHealth;
            break;
            
        case 3:
            [creaturePortraitView setImage:[UIImage imageNamed:@"dragonProjectImage.png"]];
            creatureNameLabel.text = @"Dragon";
            creatureHealth = 80;
            creatureOrgHealth = creatureHealth;
            break;
            
        case 4:
            [creaturePortraitView setImage:[UIImage imageNamed:@"skeletonProjectImage.png"]];
            creatureNameLabel.text = @"Skeleton";
            creatureHealth = 30;
            creatureOrgHealth = creatureHealth;
            break;
            
        case 5:
            [creaturePortraitView setImage:[UIImage imageNamed:@"zombieProjectImage.png"]];
            creatureNameLabel.text = @"Zombie";
            creatureHealth = 20;
            creatureOrgHealth = creatureHealth;
            break;
            
        default:
            break;
    }

    [self rollInit];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}




-(void)playerAttack
{
    primaryAttackButton.enabled = TRUE;
    specialAttackButton.enabled = TRUE;
}

-(void)creatureAttack
{
    
    NSUInteger armorCheckRoll = ((arc4random() % 20) + 1);
    NSUInteger creatureHit;
    NSString * message = nil;
    UIAlertView * alert = nil;
    NSString * path;
    
    switch (userChar) {
        case 0:
            if(armorCheckRoll > 15)
            {
                creatureHit = [self getAttackPower];
                playerHealth  = (playerHealth - creatureHit);
                [characterHealthBar setProgress:((float) playerHealth/playerOrgHealth)];
                
                path = [[NSBundle mainBundle] pathForResource:@"enemyAttack" ofType:@"wav"];
                backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
                backgroundPlayer.delegate = self;
                backgroundPlayer.volume = 1.0;
                backgroundPlayer.numberOfLoops = 0;
                [backgroundPlayer play];
                
                message = [[NSString alloc] initWithFormat:@"The creature hit you for %d points of damage.", creatureHit];
                alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            else
            {
                message = [[NSString alloc] initWithFormat:@"The creature missed you."];
                alert = [[UIAlertView alloc] initWithTitle:@"MISS" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            break;
            
        case 1:
            if(armorCheckRoll > 10)
            {
                creatureHit = [self getAttackPower];
                playerHealth  = (playerHealth - creatureHit);
                [characterHealthBar setProgress:((float) playerHealth/playerOrgHealth)];
                
                path = [[NSBundle mainBundle] pathForResource:@"enemyAttack" ofType:@"wav"];
                backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
                backgroundPlayer.delegate = self;
                backgroundPlayer.volume = 1.0;
                backgroundPlayer.numberOfLoops = 0;
                [backgroundPlayer play];
                
                message = [[NSString alloc] initWithFormat:@"The creature hit you for %d points of damage.", creatureHit];
                alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            else
            {
                message = [[NSString alloc] initWithFormat:@"The creature missed you."];
                alert = [[UIAlertView alloc] initWithTitle:@"MISS" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            break;
            
        case 2:
            if(armorCheckRoll > 10)
            {
                creatureHit = [self getAttackPower];
                playerHealth  = (playerHealth - creatureHit);
                [characterHealthBar setProgress:((float) playerHealth/playerOrgHealth)];
                
                path = [[NSBundle mainBundle] pathForResource:@"enemyAttack" ofType:@"wav"];
                backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
                backgroundPlayer.delegate = self;
                backgroundPlayer.volume = 1.0;
                backgroundPlayer.numberOfLoops = 0;
                [backgroundPlayer play];
                
                message = [[NSString alloc] initWithFormat:@"The creature hit you for %d points of damage.", creatureHit];
                alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            else
            {
                message = [[NSString alloc] initWithFormat:@"The creature missed you."];
                alert = [[UIAlertView alloc] initWithTitle:@"MISS" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            break;
            
        case 3:
            if(armorCheckRoll > 5)
            {
                creatureHit = [self getAttackPower];
                playerHealth  = (playerHealth - creatureHit);
                [characterHealthBar setProgress:((float) playerHealth/playerOrgHealth)];
                
                path = [[NSBundle mainBundle] pathForResource:@"enemyAttack" ofType:@"wav"];
                backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
                backgroundPlayer.delegate = self;
                backgroundPlayer.volume = 1.0;
                backgroundPlayer.numberOfLoops = 0;
                [backgroundPlayer play];
                
                message = [[NSString alloc] initWithFormat:@"The creature hit you for %d points of damage.", creatureHit];
                alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            else
            {
                message = [[NSString alloc] initWithFormat:@"The creature missed you."];
                alert = [[UIAlertView alloc] initWithTitle:@"MISS" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert autorelease];
                [alert show];
            }
            break;
            
        default:
            break;
    }


}

-(NSUInteger)getAttackPower
{
    NSUInteger creatureAttackRoll = arc4random();
    switch (creatureType) {
        case 0:
            return ((creatureAttackRoll % 5) + 1);
            break;
        
        case 1:
            return ((creatureAttackRoll % 10) + 1);
            break;
        
        case 2:
            return ((creatureAttackRoll % 15) + 1);
            break;
            
        case 3:
            return ((creatureAttackRoll % 50) + 1);
            break;
            
        case 4:
            return ((creatureAttackRoll % 7) + 1);
            break;
            
        case 5:
            return ((creatureAttackRoll % 8) + 1);
            break;
    
        default:
            return 0;
            break;
    }
}

-(IBAction)playerAttackSelected:(UIButton *)sender
{
    NSUInteger buttonSelected = sender.tag;
    
    NSUInteger armorCheckRoll = ((arc4random() % 20) + 1);
    
    NSString * message = nil;
    UIAlertView * alert = nil;
    NSString * path;
    
    
    if(armorCheckRoll >= 10)
    {
        if(buttonSelected == 1)
        {
            NSUInteger playerHit = arc4random(); 
            switch (userChar) {
                case 0: 
                    playerHit = (playerHit % 7) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 1: 
                    playerHit = (playerHit % 3) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    NSString * message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 2: 
                    playerHit = (playerHit % 5) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 3: 
                    playerHit = 0;
                    creatureHealth = creatureHealth - playerHit;
                    message = [[NSString alloc] initWithFormat:@"You're a bard. You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                default:
                    break;
            }
            
            path = [[NSBundle mainBundle] pathForResource:@"playerHit" ofType:@"mp3"];
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
            
        }
        else
        {
            NSUInteger playerHit = arc4random(); 
            switch (userChar) {
                case 0: 
                    playerHit = (playerHit % 10) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    path = [[NSBundle mainBundle] pathForResource:@"charge" ofType:@"wav"];
                    message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 1: 
                    playerHit = (playerHit % 10) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    path = [[NSBundle mainBundle] pathForResource:@"freezing" ofType:@"wav"];
                    NSString * message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 2: 
                    playerHit = (playerHit % 10) + 1;
                    creatureHealth = creatureHealth - playerHit;
                    path = [[NSBundle mainBundle] pathForResource:@"wildVines" ofType:@"wav"];
                    message = [[NSString alloc] initWithFormat:@"You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                case 3: 
                    playerHit = 0;
                    creatureHealth = creatureHealth - playerHit;
                    path = [[NSBundle mainBundle] pathForResource:@"playSong" ofType:@"wav"];
                    message = [[NSString alloc] initWithFormat:@"You're a bard. \n You hit the creature for %d points of damage.", playerHit];
                    alert = [[UIAlertView alloc] initWithTitle:@"HIT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert autorelease];
                    [alert show];
                    break;
                    
                default:
                    break;
            }
            
            backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
            backgroundPlayer.delegate = self;
            backgroundPlayer.volume = 1.0;
            backgroundPlayer.numberOfLoops = 0;
            [backgroundPlayer play];
        }
        
        primaryAttackButton.enabled = FALSE;
        specialAttackButton.enabled = FALSE;
        [creatureHealthBar setProgress:((float) creatureHealth/creatureOrgHealth)];
    }
    else
    {
        NSString * message = [[NSString alloc] initWithFormat:@"Armor Check Roll: %d . \n MISS.", armorCheckRoll];
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"MISS" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert autorelease];
        [alert show];

    }
    
    

}

-(BOOL)rollInit
{
    NSUInteger playerRoll = (arc4random() % 20) + 1;
    NSUInteger creatureRoll = (arc4random() % 20) + 1;
    
    
    if(playerRoll >= creatureRoll)
    {
        NSString * message = [[NSString alloc] initWithFormat:@"You rolled a %d . \n Your opponent rolled a %d . \n You attack first.",playerRoll, creatureRoll];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Initiative Roll" message:message delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert autorelease];
        [alert show];
        playerTurn = TRUE;
        return TRUE;
    }
    else
    {
        NSString * message = [[NSString alloc] initWithFormat:@"You rolled a %d . \n Your opponent rolled a %d . \n Your opponent attacks first.",playerRoll, creatureRoll];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Initiative Roll" message:message delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert autorelease];
        [alert show];
        playerTurn = FALSE;
        return false;
    }
    
    
    
}

- (void)viewDidUnload
{
    [self setCreatureNameLabel:nil];
    [self setCharacterNameLabel:nil];
    [self setCreatureHealthBar:nil];
    [self setCharacterHealthBar:nil];
    [self setCharacterPortraitView:nil];
    [self setCreaturePortraitView:nil];
    [self setPrimaryAttackButton:nil];
    [self setSpecialAttackButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{    
    NSString * path;
    
    NSLog(@"Creature health: %d \n", creatureHealth);
    NSLog(@"Player health: %d \n", playerHealth);
    
    if(haveCompleted)
    {
        [backgroundPlayer stop];
        [self dismissModalViewControllerAnimated:YES];
    } else if(playerHealth <= 0)
    {
        NSString * losingMess = [[NSString alloc] initWithFormat:@"You were killed. \n Score: %d", playerHealth];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Results" message:losingMess delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert autorelease];
        [alert show];
        
        path = [[NSBundle mainBundle] pathForResource:@"losing" ofType:@"mp3"];
        backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
        backgroundPlayer.delegate = self;
        backgroundPlayer.volume = 1.0;
        backgroundPlayer.numberOfLoops = 0;
        [backgroundPlayer play];
        haveCompleted = TRUE;
        
    }
    else if(creatureHealth <= 0)
    {
        NSString * winningMess = [[NSString alloc] initWithFormat:@"You killed the creature. \n Score: %d", playerHealth];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Results" message:winningMess delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert autorelease];
        [alert show];
        
        
        path = [[NSBundle mainBundle] pathForResource:@"victory" ofType:@"mp3"];
        backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
        backgroundPlayer.delegate = self;
        backgroundPlayer.volume = 1.0;
        backgroundPlayer.numberOfLoops = 0;
        [backgroundPlayer play];
        haveCompleted = TRUE;
        
    } else
    {
        if(playerTurn)
        {
            playerTurn = !playerTurn;
            [self playerAttack];
        }
        else
        {
            playerTurn = !playerTurn;
            [self creatureAttack];
        }
    }
}

- (void)dealloc {
    [creatureNameLabel release];
    [characterNameLabel release];
    [creatureHealthBar release];
    [characterHealthBar release];
    [characterPortraitView release];
    [creaturePortraitView release];
    [primaryAttackButton release];
    [specialAttackButton release];
    [super dealloc];
}

@end
