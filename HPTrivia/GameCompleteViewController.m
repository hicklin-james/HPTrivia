//
//  GameCompleteViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "GameCompleteViewController.h"

@interface GameCompleteViewController ()

@end

@implementation GameCompleteViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize imageView;
@synthesize gameController;
@synthesize titleLabel;
@synthesize unlockedLabel;
@synthesize scoreLabel;

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
  
  if(!IS_PHONEPOD5()) {
    imageView.image = [UIImage imageNamed:@"parchment.png"];
  } else {
    imageView.image = [UIImage imageNamed:@"parchment-568h@2x.png"];
  }
  
  [self setupLabels];
  
}

-(void)setupLabels {
  
  titleLabel.font = [UIFont fontWithName:@"ParryHotter" size:45];
  unlockedLabel.font = [UIFont fontWithName:@"ParryHotter" size:14];
  scoreLabel.font = [UIFont fontWithName:@"ParryHotter" size:20];
  scoreLabel.text = [NSString stringWithFormat:@"You scored %d/%d", gameController.correctAnswers, gameController.numOfQuestions];
  
  if ([gameController didPass]) { // You passed, so unlock next level in the category
    titleLabel.text = @"Congratulations!";
    NSString *nextDifficulty = [gameController getNextDifficultyLevel];
    if (![nextDifficulty isEqual:@"allFinished"]) {
      unlockedLabel.text = [NSString stringWithFormat:@"You scored high enough to unlock the %@ difficulty in the %@ category!", nextDifficulty, gameController.category];
      [gameController unlockNextDifficulty];
    }
    else {
      unlockedLabel.text = [NSString stringWithFormat:@"You have completed all the difficulties in the %@ category! Try another category!", gameController.category];
    }
  }
  else { // You failed, next level stays locked
    titleLabel.text = @"Oh No!";
    unlockedLabel.text = @"You didn't score high enough to unlock the next difficulty! Brush up on your Harry Potter knowledge and try again!";
  }
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

@end
