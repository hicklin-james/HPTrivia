//
//  SubmitHighScoreViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-12.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitHighScoreViewController : UIViewController <UITextFieldDelegate> {
  NSInteger percentScore;
  NSString *difficulty;
  NSString *category;
}

@property (strong, nonatomic) IBOutlet UILabel *congratsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, assign) NSInteger percentScore;
@property (strong, nonatomic) NSString *difficulty;
@property (strong, nonatomic)NSString *category;

- (IBAction)submitHighScore:(id)sender;

@end
