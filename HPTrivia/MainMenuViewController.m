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

#define IS_PHONEPOD5() ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

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
    //NSLog(@"We used the smaller picture");
    imageView.image = [UIImage imageNamed:@"parchment.png"];
  } else {
    //NSLog(@"We used the bigger picture");
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
