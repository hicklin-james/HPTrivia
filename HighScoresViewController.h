//
//  HighScoresViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-11.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "URBSegmentedControl.h"

@interface HighScoresViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
  NSString *difficulty;
  NSString *category;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet URBSegmentedControl *categorySegControl;
@property (strong, nonatomic) IBOutlet URBSegmentedControl *difficultySegControl;
@property (strong, nonatomic) IBOutlet UITableView *highScoresTable;
@property (strong, nonatomic) NSString *difficulty;
@property (strong, nonatomic) NSString *category;

- (IBAction)updateHighScoresTable:(id)sender;

@end
