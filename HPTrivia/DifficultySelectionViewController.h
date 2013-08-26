//
//  DifficultySelectionViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DifficultySelectionViewController : UIViewController {
  NSString *category;
  NSString *difficulty;
}

@property (strong, nonatomic) NSString* difficulty;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *easyButton;
@property (strong, nonatomic) IBOutlet UIButton *mediumButton;
@property (strong, nonatomic) IBOutlet UIButton *hardButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

- (IBAction)backToCategorySelection:(id)sender;
- (IBAction)beginGame:(id)sender;


@end
