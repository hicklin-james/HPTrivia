//
//  SubmitHighScoreViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-12.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "SubmitHighScoreViewController.h"
#import "HighScoresViewController.h"

@interface SubmitHighScoreViewController ()

@end

@implementation SubmitHighScoreViewController

@synthesize percentScore;
@synthesize category;
@synthesize difficulty;

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize imageView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.nameTextField becomeFirstResponder];
	// Do any additional setup after loading the view.
    self.congratsLabel.text = [NSString stringWithFormat:@"Congratulations! You scored %d%% and made it to the high scores! Please enter your name below!", percentScore];
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitHighScore:(id)sender {

  NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  path = [path stringByAppendingPathComponent:@"highScore.plist"];
  NSMutableDictionary *fullHSDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
  NSMutableDictionary *categoryDict = [fullHSDict objectForKey:[self category]];
  NSMutableArray *highScores = [categoryDict objectForKey:[self difficulty]];
  for (int i = 0; i < 5; i++) {
    NSMutableDictionary *thisScore = [highScores objectAtIndex:i];
    NSInteger thisScoreInteger = [[thisScore objectForKey:@"Score"] integerValue];
    if (percentScore >= thisScoreInteger) {
     // NSLog(@"We got here!");
      NSString *name = self.nameTextField.text;
      NSMutableDictionary *newScore = [[NSMutableDictionary alloc] init];
      [newScore setObject:name forKey:@"Name"];
      [newScore setObject:[NSNumber numberWithInteger:percentScore] forKey:@"Score"];
      [highScores insertObject:newScore atIndex:i];
      break;
    }
  }
  
  if ([highScores count] > 5) {
    [highScores removeLastObject];
  }
  
  [fullHSDict writeToFile:path atomically:YES];
  [self performSegueWithIdentifier:@"showHighScores" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual: @"showHighScores"]) {
    HighScoresViewController *dest = (HighScoresViewController*)segue.destinationViewController;
    dest.difficulty = difficulty;
    dest.category = category;
  }
}


@end
