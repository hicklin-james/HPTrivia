//
//  GameCompleteViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface GameCompleteViewController : UIViewController {
  GameController *gameController;
}

@property (strong, nonatomic) GameController *gameController;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *unlockedLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *highScoreButton;
@property (strong, nonatomic) IBOutlet UIButton *mainMenuButton;

@end
