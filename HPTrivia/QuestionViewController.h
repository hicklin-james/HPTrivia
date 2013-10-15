//
//  QuestionViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"
#import "GameQuestion.h"

@interface QuestionViewController : UIViewController <UIAlertViewDelegate> {
  GameController *gameController;
  GameQuestion *currentQuestion;
}

@property (strong, nonatomic) GameQuestion *currentQuestion;
@property (strong, nonatomic) GameController *gameController;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *answerOneButton;
@property (strong, nonatomic) IBOutlet UIButton *answerTwoButton;
@property (strong, nonatomic) IBOutlet UIButton *answerThreeButton;
@property (strong, nonatomic) IBOutlet UIButton *answerFourButton;
@property (strong, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)giveUpOnGame:(id)sender;
- (IBAction)selectAnswer:(id)sender;
-(void)setupCurrentQuestion;
-(void)deleteLastQuestion;
//+(UIColor*)getBlueColor;

@end
