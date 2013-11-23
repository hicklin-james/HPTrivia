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

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

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
  
  if (IDIOM == IPAD) {
    [self.titleLabel setFont:[UIFont fontWithName:@"Parry Hotter" size:85]];
  }
  else {
    [self. titleLabel setFont:[UIFont fontWithName:@"Parry Hotter" size:55]];
  }
  
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
