//
//  CharacterSelectViewController.m
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import "CharacterSelectViewController.h"

@implementation CharacterSelectViewController
@synthesize charClassLabel;
@synthesize charNameField;
@synthesize selectedCharacter;
@synthesize selectedClassLabel;
@synthesize oppSelectView;
@synthesize characterClassSelection;

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
    oppSelectView = [[OppSelectViewController alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    UIApplication *app = [UIApplication sharedApplication]; [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)selectionMade:(UIButton *)sender
{
    
    
    NSUInteger theTag = sender.tag;
    
    switch (theTag) 
    {
        case 0:
            [selectedCharacter setImage:[UIImage imageNamed:@"warriorProjectIcon.png"] forState:UIControlStateNormal];
            selectedClassLabel.text = @"Warrior";
            selectedCharacter.enabled = TRUE;
            characterClassSelection = theTag;
            break;
            
        case 1:
            [selectedCharacter setImage:[UIImage imageNamed:@"wizardProjectImage.png"] forState:UIControlStateNormal];
            selectedClassLabel.text = @"Wizard";
            selectedCharacter.enabled = TRUE;
            characterClassSelection = theTag;
            break;
            
        case 2:
            [selectedCharacter setImage:[UIImage imageNamed:@"druidProjectImage.png"] forState:UIControlStateNormal];
            selectedClassLabel.text = @"Druid";
            selectedCharacter.enabled = TRUE;
            characterClassSelection = theTag;
            break;
            
        case 3:
            [selectedCharacter setImage:[UIImage imageNamed:@"bardProjectImage.png"] forState:UIControlStateNormal];
            selectedClassLabel.text = @"Bard";
            selectedCharacter.enabled = TRUE;
            characterClassSelection = theTag;
            break;
            
        default:
            break;
    }
}

-(IBAction)goToSelectOpp:(id)sender
{
    [oppSelectView release];
    oppSelectView = [[OppSelectViewController alloc] init];
    OppSelectViewController * newView = oppSelectView;
    newView.characterClass = characterClassSelection;
    newView.characterName = charNameField.text;
    
    [self presentModalViewController:newView animated:YES];
}

- (IBAction)doneEdit:(id)sender 
{
    [sender resignFirstResponder];
}

- (IBAction)backTouch:(id)sender 
{
    [charNameField resignFirstResponder];
}

-(void) dealloc
{
    [charClassLabel dealloc];
    [charNameField dealloc];
    [super dealloc];
}

@end
