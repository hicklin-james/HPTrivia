//
//  NumberOfQuestionsViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-22.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberOfQuestionsViewController : UIViewController {
  NSString *category;
  NSString *difficulty;
  NSInteger numberOfQuestions;
}

@property (strong, nonatomic) NSString* difficulty;
@property (strong, nonatomic) NSString* category;
@property (nonatomic, assign) NSInteger numberOfQuestions;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *tenButton;
@property (strong, nonatomic) IBOutlet UIButton *twentyFiveButton;
@property (strong, nonatomic) IBOutlet UIButton *fiftyButton;
@property (strong, nonatomic) IBOutlet UIButton *allButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

- (IBAction)beginGameWithNumberOfQuestions:(id)sender;
- (IBAction)backToDifficultySelection:(id)sender;
@end
