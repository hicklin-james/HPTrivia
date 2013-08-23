//
//  NumberOfQuestionsViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-22.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "NumberOfQuestionsViewController.h"
#import "QuestionViewController.h"

@interface NumberOfQuestionsViewController ()

@end

@implementation NumberOfQuestionsViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize category;
@synthesize difficulty;
@synthesize numberOfQuestions;
@synthesize imageView;
@synthesize tenButton;
@synthesize twentyFiveButton;
@synthesize fiftyButton;
@synthesize allButton;

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
  if(IS_PHONEPOD5()) {
    imageView.image = [UIImage imageNamed:@"parchment.png"];
  } else {
    imageView.image = [UIImage imageNamed:@"parchment-568h@2x.png"];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual:@"beginGameSegue"]) {
    
    GameController *gc = [[GameController alloc] init:category theDifficulty:difficulty numberOfQuestions:numberOfQuestions];
    QuestionViewController *dest = segue.destinationViewController;
    dest.gameController = gc;
    
  }
}

- (IBAction)beginGameWithNumberOfQuestions:(id)sender {
  
  if ([sender isEqual:tenButton]) {
    numberOfQuestions = 10;
  }
  else if ([sender isEqual:twentyFiveButton]) {
    numberOfQuestions = 25;
  }
  else if ([sender isEqual:fiftyButton]) {
    numberOfQuestions = 50;
  }
  else {
    numberOfQuestions = 0;
  }
  [self performSegueWithIdentifier:@"beginGameSegue" sender:self];
}

- (IBAction)backToDifficultySelection:(id)sender {
  
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
  
}
@end
