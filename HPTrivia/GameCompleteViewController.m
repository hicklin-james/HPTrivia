//
//  GameCompleteViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "GameCompleteViewController.h"
#import "SubmitHighScoreViewController.h"

@interface GameCompleteViewController ()

@end

@implementation GameCompleteViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

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
  
  [self setupLabels];
  [self setupButtons];
  
}

-(void)setupLabels {
  
  if (IDIOM == IPAD) {
    titleLabel.font = [UIFont fontWithName:@"ParryHotter" size:90];
    unlockedLabel.font = [UIFont fontWithName:@"ParryHotter" size:28];
    scoreLabel.font = [UIFont fontWithName:@"ParryHotter" size:40];
  }
  else {
    titleLabel.font = [UIFont fontWithName:@"ParryHotter" size:45];
    unlockedLabel.font = [UIFont fontWithName:@"ParryHotter" size:14];
    scoreLabel.font = [UIFont fontWithName:@"ParryHotter" size:20];
  }

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

-(void)setupButtons {
  NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  path = [path stringByAppendingPathComponent:@"highScore.plist"];
  NSMutableDictionary *fullHSDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
  NSMutableDictionary *categoryDict = [fullHSDict objectForKey:[gameController category]];
  NSMutableArray *highScores = [categoryDict objectForKey:[gameController difficulty]];
  NSInteger lowestScore = [[[highScores objectAtIndex:4] objectForKey:@"Score"] integerValue];
  
  if ([gameController calculatePercentageScore] < lowestScore || [gameController calculatePercentageScore] == 0) {
    [self.highScoreButton setEnabled:NO];
    //[self.mainMenuButton setFrame:CGRectOffset(self.mainMenuButton.frame, 61, 0)];
      }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual:@"submitHighScoreSegue"]) {
    SubmitHighScoreViewController *dest = segue.destinationViewController;
    dest.percentScore = [gameController calculatePercentageScore];
    dest.category = [gameController category];
    dest.difficulty = [gameController difficulty];
  }
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

@end
