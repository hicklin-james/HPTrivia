//
//  CorrectAnswerViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface CorrectAnswerViewController : UIViewController {
  GameController *gameController;
}

@property (strong, nonatomic) GameController *gameController;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *correctAnswerLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextViewButton;

- (IBAction)goToNextQuestion:(id)sender;

@end
