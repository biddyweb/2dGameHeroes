//
//  CharacterSelectViewController.h
//  2D Game Heroes
//
//  Created by Ryan Fore on 11/17/11.
//  Copyright 2011 University of Illinois at Springfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OppSelectViewController.h"

@interface CharacterSelectViewController : UIViewController
{
    OppSelectViewController * oppSelectView;
    UILabel * charClassLabel;
    UITextField * charNameField;
    UIButton * selectedCharacter;
    UILabel * selectedClassLabel;
    NSUInteger characterClassSelection;
}

@property (nonatomic, retain) OppSelectViewController * oppSelectView;

@property (nonatomic, retain) IBOutlet UITextField * charNameField;

@property (nonatomic, retain) IBOutlet UILabel * charClassLabel;

@property (nonatomic, retain) IBOutlet UIButton * selectedCharacter;

@property (nonatomic, retain) IBOutlet UILabel * selectedClassLabel;

@property (nonatomic) NSUInteger characterClassSelection;



-(IBAction)selectionMade:(UIButton *)sender;

-(IBAction)goToSelectOpp:(id)sender;

- (IBAction)backTouch:(id)sender;

- (IBAction)doneEdit:(id)sender;

@end
