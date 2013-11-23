//
//  SettingsViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-26.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize imageView;

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  if (IDIOM == IPAD) {
    [self.titleLabel setFont:[UIFont fontWithName:@"ParryHotter" size:100]];
  }
  else {
     [self.titleLabel setFont:[UIFont fontWithName:@"ParryHotter" size:50]];;
  }
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults boolForKey:@"unlockAllLevels"])
    self.unlockQuestionsSegControl.selectedSegmentIndex = 0;
  else
    self.unlockQuestionsSegControl.selectedSegmentIndex = 1;
  
  if ([defaults boolForKey:@"showAnswers"])
    self.showAnswersSegControl.selectedSegmentIndex = 0;
  else
    self.showAnswersSegControl.selectedSegmentIndex = 1;
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unlockQuestionsSegValueChanged:(id)sender {
  
  UISegmentedControl *segControl = sender;
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if (segControl.selectedSegmentIndex == 0)
      [defaults setBool:YES forKey:@"unlockAllLevels"];
  else if (segControl.selectedSegmentIndex == 1)
    [defaults setBool:NO forKey:@"unlockAllLevels"];
  
}

- (IBAction)showAnswersValueChanged:(id)sender {
  UISegmentedControl *segControl = sender;
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if (segControl.selectedSegmentIndex == 0)
    [defaults setBool:YES forKey:@"showAnswers"];
  else if (segControl.selectedSegmentIndex == 1)
    [defaults setBool:NO forKey:@"showAnswers"];
}
@end
