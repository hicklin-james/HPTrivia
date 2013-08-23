//
//  CategorySelectionViewController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategorySelectionViewController : UIViewController {
  NSString *category;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *charactersButton;
@property (strong, nonatomic) IBOutlet UIButton *spellsButton;
@property (strong, nonatomic) IBOutlet UIButton *wizardingWorldButton;

- (IBAction)backToMainMenu:(id)sender;
- (IBAction)transitionToDifficultySelection:(id)sender;


@end
