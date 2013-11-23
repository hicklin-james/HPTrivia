//
//  CategorySelectionViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "CategorySelectionViewController.h"
#import "DifficultySelectionViewController.h"

@interface CategorySelectionViewController ()

@end

@implementation CategorySelectionViewController

@synthesize imageView;
@synthesize charactersButton;
@synthesize spellsButton;
@synthesize wizardingWorldButton;
#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
}

- (IBAction)backToMainMenu:(id)sender {
  
  [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual:@"difficultySelectionSegue"]) {
    DifficultySelectionViewController *dest = segue.destinationViewController;
    dest.category = category;
  }
}

- (IBAction)transitionToDifficultySelection:(id)sender {
  
  if ([sender isEqual:charactersButton]) {
    NSLog(@"Characters button pushed");
    category = @"Characters";
  }
  else if ([sender isEqual:spellsButton]) {
    NSLog(@"Spells button pushed");
    category = @"Spells";
  }
  else {
    NSLog(@"Wizarding World button pushed");
    category = @"Wizarding World";
  }
  [self performSegueWithIdentifier:@"difficultySelectionSegue" sender:self];
}
@end
