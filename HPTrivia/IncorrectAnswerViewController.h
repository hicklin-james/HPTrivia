//
//  IncorrectAnswerViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface IncorrectAnswerViewController : UIViewController {
  GameController *gameController;
  NSString *correctAnswer;
}

@property (strong, nonatomic) NSString* correctAnswer;
@property (strong, nonatomic) GameController *gameController;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *incorrectAnswerLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextViewButton;
@property (strong, nonatomic) IBOutlet UILabel *correctAnswerLabel;

- (IBAction)goToNextQuestion:(id)sender;

@end
