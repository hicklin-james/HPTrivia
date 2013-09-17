//
//  MainMenuViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  if(!IS_PHONEPOD5()) {
    imageView.image = [UIImage imageNamed:@"parchment.png"];
  } else {
    imageView.image = [UIImage imageNamed:@"parchment-568h@2x.png"];
  }
  
  [self.titleLabel setFont:[UIFont fontWithName:@"ParryHotter" size:50]];
  
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Declaration is important here. It signals an unwind segue.
-(IBAction)unwindToMainMenu:(UIStoryboardSegue*)segue {
}

@end
