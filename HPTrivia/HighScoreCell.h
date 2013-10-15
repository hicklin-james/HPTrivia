//
//  HighScoreCell.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-11.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoreCell : UITableViewCell {
  
  UILabel *nameLabel;
  UILabel *scoreLabel;
  UILabel *rankLabel;
  
}

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *rankLabel;

@end
