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
#import "NSString+fitFontToButton.h"

@interface IncorrectAnswerViewController ()

@end

@implementation IncorrectAnswerViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@synthesize imageView;
@synthesize gameController;
@synthesize incorrectAnswerLabel;
@synthesize nextViewButton;
@synthesize correctAnswerLabel;
@synthesize correctAnswer;
@synthesize correctAnswerView;

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
  CALayer *layer = self.correctAnswerButton.layer;
  layer.cornerRadius = 8.0f;
  layer.borderWidth = 1.0f;
  
  incorrectAnswerLabel.text = @"Incorrect!";
  //correctAnswerLabel.text = correctAnswer;
  
  CGRect frame = correctAnswerLabel.frame;
  //frame.size.width -= 25; //l + r padding
  //frame.size.height -= 25;
  
  CGFloat fontSize;
  
  if (IDIOM == IPAD) {
    incorrectAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:100];
    fontSize = [correctAnswer fontSizeWithFont:[UIFont fontWithName:@"ParryHotter" size:65] constrainedToSize: frame.size];
    //correctAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:55];
  }
  else {
    incorrectAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:60];
    fontSize = [correctAnswer fontSizeWithFont:[UIFont fontWithName:@"ParryHotter" size:20] constrainedToSize: frame.size];
    //correctAnswerLabel.font = [UIFont fontWithName:@"ParryHotter" size:20];
  }
  
  [correctAnswerLabel setFont:[UIFont fontWithName:@"ParryHotter" size:fontSize]];
  [correctAnswerLabel setText:correctAnswer];
  
  correctAnswerLabel.adjustsFontSizeToFitWidth = YES;
  if ([gameController questionNumber] > [gameController numOfQuestions]) {
    [nextViewButton setTitle:@"Finish Game" forState:UIControlStateNormal];
  }
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults boolForKey:@"showAnswers"]) {
    correctAnswerView.alpha = 1;
    self.correctAnswerButton.enabled = NO;
    self.correctAnswerButton.alpha = 0;
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


- (IBAction)showCorrectAnswer:(id)sender {
  
  [UIView animateWithDuration:0.8 animations:^() {
    correctAnswerView.alpha = 1.0;
  }];
  
  UIButton *tappedButton = sender;
  tappedButton.enabled = NO;
  [UIView animateWithDuration:0.8 animations:^() {
    tappedButton.alpha = 0.0;
  }];
  
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
