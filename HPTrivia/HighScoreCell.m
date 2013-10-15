//
//  HighScoreCell.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-11.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "HighScoreCell.h"

@implementation HighScoreCell

@synthesize nameLabel;
@synthesize scoreLabel;
@synthesize rankLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
