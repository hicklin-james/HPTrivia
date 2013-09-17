//
//  DifficultySelectionViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "DifficultySelectionViewController.h"
#import "GameController.h"
#import "NumberOfQuestionsViewController.h"

@interface DifficultySelectionViewController ()

@end

@implementation DifficultySelectionViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize category;
@synthesize imageView;
@synthesize easyButton;
@synthesize mediumButton;
@synthesize hardButton;
@synthesize difficulty;
@synthesize instructionsLabel;

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
  // Use correct image for screen size
  if(!IS_PHONEPOD5()) {
    imageView.image = [UIImage imageNamed:@"parchment.png"];
  } else {
    imageView.image = [UIImage imageNamed:@"parchment-568h@2x.png"];
  }
  NSLog([NSString stringWithFormat:@"The category is %@", category], nil);
  [self setUpButtons];
  [self.titleLabel setFont:[UIFont fontWithName:@"ParryHotter" size:50]];
  [instructionsLabel setFont:[UIFont fontWithName:@"ParryHotter" size:12]];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual:@"numberOfQuestionsSegue"]) {
    
    //GameController *gc = [[GameController alloc] init:category theDifficulty:difficulty];
    NumberOfQuestionsViewController *dest = segue.destinationViewController;
    dest.category = category;
    dest.difficulty = difficulty;
    //dest.gameController = gc;
    
  }
}

- (IBAction)backToCategorySelection:(id)sender {
  
  [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
  
}

- (IBAction)beginGame:(id)sender {
  
  if ([sender isEqual:easyButton]) {
    NSLog(@"Easy button pushed");
    difficulty = @"Easy";
  }
  else if ([sender isEqual:mediumButton]) {
    NSLog(@"Medium button pushed");
    difficulty = @"Medium";
  }
  else {
    NSLog(@"Hard button pushed");
    difficulty = @"Hard";
  }
  
  [self performSegueWithIdentifier:@"numberOfQuestionsSegue" sender:self];
  
}

-(void)setUpButtons {
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSInteger allowedDifficlty = [defaults integerForKey:[NSString stringWithFormat:@"%@ Difficulty Allowed", category]];
  if ([defaults boolForKey:@"unlockAllLevels"]) {
    
  }
  else {
    if (allowedDifficlty >= 1) {
      [mediumButton setEnabled:YES];
    }
    else {
      [mediumButton setEnabled:NO];
    }
    if (allowedDifficlty >= 2) {
      [hardButton setEnabled:YES];
    }
    else {
      [hardButton setEnabled:NO];
    }
  }
}
@end
