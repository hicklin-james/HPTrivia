//
//  SettingsViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-26.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *unlockQuestionsSegControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *showAnswersSegControl;

- (IBAction)unlockQuestionsSegValueChanged:(id)sender;
- (IBAction)showAnswersValueChanged:(id)sender;



@end
