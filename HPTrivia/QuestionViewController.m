//
//  QuestionViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "QuestionViewController.h"
#import "NSMutableArray_Shuffling.h"
#import "CorrectAnswerViewController.h"
#import "IncorrectAnswerViewController.h"
#import "NSString+fitFontToButton.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

NSInteger timeLeft;
NSTimer *countdownTimer;

@synthesize currentQuestion;
@synthesize imageView;
@synthesize gameController;
@synthesize questionLabel;
@synthesize answerOneButton;
@synthesize answerThreeButton;
@synthesize answerFourButton;
@synthesize answerTwoButton;
@synthesize questionNumberLabel;

UIColor *blueTextColor;

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
    [self setBlueTextColor];
	// Do any additional setup after loading the view.
    self.timerLabel.textColor = blueTextColor;
  //[self setupCurrentQuestion];
}

-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self setupCurrentQuestion];
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self startCountdown:self];
}

- (IBAction)startCountdown:(id)sender
{
  timeLeft = 20;
  
  countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                             target:self
                                                           selector:@selector(advanceTimer:)
                                                           userInfo:nil
                                                            repeats:YES];
  
}

- (void)advanceTimer:(NSTimer *)timer
{
  timeLeft -= 1;
  self.timerLabel.text = [NSString stringWithFormat:@"%d", timeLeft];
  if (timeLeft < 5) {
    __unused NSTimer *newTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(test:) userInfo:nil repeats:NO]; // __unused supresses the warning
    [self.timerLabel setHidden:YES];
   // [self.timerLabel setHidden:NO];
    self.timerLabel.textColor = [UIColor colorWithRed:154/255.0f green:26/255.0f blue:14/255.0f alpha:1.0f];
  }
  else
    self.timerLabel.textColor = blueTextColor;
    
  if (timeLeft <= 0) {
    gameController.questionNumber++;
    [self performSegueWithIdentifier:@"incorrectAnswerSegue" sender:self];
  }
}

-(void)test:(NSTimer *)timer {
  [self.timerLabel setHidden:NO];
}

-(void)setupCurrentQuestion {
  
  currentQuestion = [gameController fetchRandomQuestion];
  CGFloat fontSize;
  //questionLabel.text = [currentQuestion question];
  
  CGRect frame = questionLabel.frame;
  frame.size.width -= 25; //l + r padding
  frame.size.height -= 25;
  
  if (IDIOM == IPAD) {
    fontSize = [[currentQuestion question] fontSizeWithFont:[UIFont fontWithName:@"Harry P" size:50] constrainedToSize: frame.size];
    //questionLabel.font = [UIFont fontWithName:@"ParryHotter" size:40];
  }
  else {
    //questionLabel.font = [UIFont fontWithName:@"ParryHotter" size:20];
    fontSize = [[currentQuestion question] fontSizeWithFont:[UIFont fontWithName:@"Harry P" size:30] constrainedToSize: frame.size];
  }
  //questionLabel.font = [UIFont fontWithName:@"Harry P" size:fontSize];
  //questionLabel.adjustsFontSizeToFitWidth = YES;
  [questionLabel setFont:[UIFont fontWithName:@"Harry P" size:fontSize]];
  [questionLabel setText:[currentQuestion question]];
  NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:answerOneButton, answerTwoButton, answerThreeButton, answerFourButton, nil];
  [buttonArray shuffle];
  
  for (int i = 0; i < 4; i++) {
    [self setupButtonForAnswer:[[currentQuestion possibleAnswers] objectAtIndex:i] theButton:[buttonArray objectAtIndex:i]];
  }
  
  questionNumberLabel.text = [NSString stringWithFormat:@"%d/%d", [gameController questionNumber], [gameController numOfQuestions]];
//  questionNumberLabel.font = [UIFont fontWithName:@"ParryHotter" size:50];
}

-(void)setupButtonForAnswer:(NSString*)answerString theButton:(UIButton*)theButton {

  theButton.titleLabel.textAlignment = NSTextAlignmentCenter;
 // [theButton.titleLabel sizeToFit];
  CGRect frame = theButton.frame;
  if (IDIOM == IPAD) {
    frame.size.width -= 55; //l + r padding
    frame.size.height -= 55;
  }
  else {
    frame.size.width -= 25; //l + r padding
    frame.size.height -= 25;
  }
  //theButton.titleLabel.frame = frame;
  //NSLog(answerString);
  //[theButton.titleLabel setFont:[UIFont fontWithName:@"harryp" size:25]];
  theButton.titleLabel.numberOfLines = 0;
  //theButton.titleLabel.adjustsFontSizeToFitWidth = YES;
  CGFloat fontSize;
  if (IDIOM == IPAD) {
    fontSize = [answerString fontSizeWithFont:[UIFont fontWithName:@"Harry P" size:44] constrainedToSize: frame.size];
  }
  else {
    fontSize = [answerString fontSizeWithFont:[UIFont fontWithName:@"Harry P" size:24] constrainedToSize: frame.size];
  }
  
  [theButton.titleLabel setFont:[UIFont fontWithName:@"Harry P" size:fontSize]];
  [theButton setTitle:answerString forState:UIControlStateNormal];
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

-(void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  self.timerLabel.text = @"20";
  self.timerLabel.textColor = blueTextColor;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  [countdownTimer invalidate];
  
  // Pass game controllers along
  if ([segue.identifier isEqual:@"correctAnswerSegue"]) {
    CorrectAnswerViewController *dest = segue.destinationViewController;
    dest.gameController = gameController;
  }
  if ([segue.identifier isEqual:@"incorrectAnswerSegue"]) {
    IncorrectAnswerViewController *dest = segue.destinationViewController;
    dest.gameController = gameController;
    dest.correctAnswer = [currentQuestion correctAnswer];
  }
  
}

- (IBAction)giveUpOnGame:(id)sender {
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Are you sure you want to give up the game?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
  [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  
  if (buttonIndex == 0) {
    
  }
  else {
    [self performSegueWithIdentifier:@"unwindToMainMenu" sender:self];
  }
  
}

- (IBAction)selectAnswer:(id)sender {
  
  UIButton *selectedButton = sender;
  gameController.questionNumber++;
  if ([selectedButton.titleLabel.text isEqual:[currentQuestion correctAnswer]]) {
    NSLog(@"Correct!");
    // add 1 to number of correct answers.
    gameController.correctAnswers++;
    [self performSegueWithIdentifier:@"correctAnswerSegue" sender:self];
  }
  else {
    NSLog(@"Incorrect!");
    [self performSegueWithIdentifier:@"incorrectAnswerSegue" sender:self];
  }
  
}

-(void)deleteLastQuestion {
  
  [[gameController allQuestions] removeObject:currentQuestion];
  
}

- (void)setBlueTextColor {
  if (!blueTextColor)
    blueTextColor = [UIColor colorWithRed:154/255.0f green:26/255.0f blue:14/255.0f alpha:1.0f];
}

@end
