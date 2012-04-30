//
//  _D_Game_HeroesViewController.m
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import "_D_Game_HeroesViewController.h"

@implementation _D_Game_HeroesViewController
@synthesize backgroundPlayer;

-(IBAction)startGame:(id)sender
{
    CharacterSelectViewController * charSelectView = [[CharacterSelectViewController alloc] initWithNibName:nil bundle:nil];
    [backgroundPlayer stop];
    [self presentModalViewController:charSelectView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"maintitle" ofType:@"mp3"];
    backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    backgroundPlayer.delegate = self;
    backgroundPlayer.volume = 1.0;
    backgroundPlayer.numberOfLoops = 0;
    [backgroundPlayer play];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"startScreenBackground.png"]];
    [super viewDidLoad];
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

@end
