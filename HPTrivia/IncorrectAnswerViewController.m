//
//  IncorrectAnswerViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "IncorrectAnswerViewController.h"
#import "QuestionViewController.h"
#import "GameCompleteViewController.h"

@interface IncorrectAnswerViewController ()

@end

@implementation IncorrectAnswerViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize imageView;
@synthesize gameController;
@synthesize incorrectAnswerLabel;
@synthesize nextViewButton;
@synthesize correctAnswerLabel;
@synthesize correctAnswer;

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
  
  incorrectAnswerLabel.text = @"Incorrect!";
  incorrectAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:60];
  correctAnswerLabel.text = correctAnswer;
  correctAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:20
                             ];
  correctAnswerLabel.adjustsFontSizeToFitWidth = YES;
  if ([gameController questionNumber] > [gameController numOfQuestions]) {
    [nextViewButton setTitle:@"Finish Game" forState:UIControlStateNormal];
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
  if ([segue.identifier isEqual:@"gameCompleteSegue"]) {
    GameCompleteViewController *dest = segue.destinationViewController;
    dest.gameController = gameController;
  }
}


- (IBAction)goToNextQuestion:(id)sender {
  
  QuestionViewController *qvc = (QuestionViewController*)self.presentingViewController;
  
  if ([gameController questionNumber] > [gameController numOfQuestions]) {
    //[self performSegueWithIdentifier:@"gameCompleteSegue" sender:self];
   // [[[[[self presentingViewController] presentingViewController] presentingViewController] presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"gameCompleteSegue" sender:self];
  }
  else {
    [qvc deleteLastQuestion];
   // [qvc setupCurrentQuestion];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
    }];
  }
}
@end
