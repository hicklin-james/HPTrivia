//
//  HighScoresViewController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-11.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "HighScoresViewController.h"
#import "HighScoreCell.h"

@interface HighScoresViewController ()

@end

@implementation HighScoresViewController

NSArray *highScores;

@synthesize imageView;
@synthesize titleLabel;
@synthesize categorySegControl;
@synthesize difficultySegControl;
@synthesize difficulty;
@synthesize category;

#define IS_PHONEPOD5() ([UIScreen mainScreen].bounds.size.height == 568.0f && [UIScreen mainScreen].scale == 2.f && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Hides status bar
- (BOOL)prefersStatusBarHidden
{
  return YES;
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
    [titleLabel setFont:[UIFont fontWithName:@"ParryHotter" size:25]];
  
  [self setupSegControls];
  
  // if a category exists, change the seg controls to match the category
  if (category) {
    [self matchSegControlsToLastGame];
  }
  
  [self loadHighScoreFile];

}

-(void)setupSegControls {
  
  categorySegControl.frame = CGRectMake(categorySegControl.frame.origin.x,
                                         categorySegControl.frame.origin.y,
                                         categorySegControl.frame.size.width,
                                         categorySegControl.frame.size.height+7);
  difficultySegControl.frame = CGRectMake(difficultySegControl.frame.origin.x,
                                        difficultySegControl.frame.origin.y,
                                        difficultySegControl.frame.size.width,
                                        difficultySegControl.frame.size.height+7);
  
  categorySegControl.baseColor = [UIColor colorWithWhite:0.3 alpha:0.5];
  difficultySegControl.baseColor = [UIColor colorWithWhite:0.3 alpha:0.5];
  categorySegControl.segmentBackgroundColor = [UIColor colorWithRed:204/255.0f green:210/255.0f blue:208/255.0f alpha:0.2f];
  difficultySegControl.segmentBackgroundColor = [UIColor colorWithRed:204/255.0f green:210/255.0f blue:208/255.0f alpha:0.2f];
  categorySegControl.strokeColor = [UIColor colorWithWhite:0.3 alpha:0.5];
  difficultySegControl.strokeColor = [UIColor colorWithWhite:0.3 alpha:0.5];
  
  [categorySegControl setTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                           [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:10], NSFontAttributeName, nil]// colorWithRed:220.0/255.0 green:104.0/255.0 blue:1.0/255.0 alpha:0.8], NSForegroundColorAttributeName, nil]
                               forState:UIControlStateNormal];
  
  [categorySegControl setTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:10], NSFontAttributeName,nil]
                               forState:UIControlStateSelected];
  [difficultySegControl setTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:10], NSFontAttributeName, nil]
                               forState:UIControlStateNormal];
  [difficultySegControl setTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:10], NSFontAttributeName, nil]
                               forState:UIControlStateSelected];
}

-(void)matchSegControlsToLastGame {
  
  [categorySegControl setSelectedSegmentIndex:[self findCategoryIndex]];
  [difficultySegControl setSelectedSegmentIndex:[self findDifficultyIndex]];
  
}

-(NSInteger)findCategoryIndex {
  
  if ([category isEqual: @"Characters"]) {
    return 0;
  }
  else if ([category isEqual: @"Wizarding World"]) {
    return 1;
  }
  else {
    return 2;
  }
  
}

-(NSInteger)findDifficultyIndex {
 
  if ([difficulty isEqual: @"Easy"]) {
    return 0;
  }
  else if ([difficulty isEqual: @"Medium"]) {
    return 1;
  }
  else {
    return 2;
  }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  HighScoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"highScoreCell"];
  NSMutableDictionary *thisScore = [highScores objectAtIndex:indexPath.row];
  cell.nameLabel.text = [thisScore objectForKey:@"Name"];
  cell.nameLabel.font = [UIFont fontWithName:@"ParryHotter" size:12];
  if ([[thisScore objectForKey:@"Score"] integerValue] == 0)
      cell.scoreLabel.text = @"";
  else
    cell.scoreLabel.text = [NSString stringWithFormat:@"%@%%", [thisScore objectForKey:@"Score"]];
  cell.scoreLabel.font = [UIFont fontWithName:@"ParryHotter" size:15];
  cell.rankLabel.text = [NSString stringWithFormat:@"%d.", indexPath.row + 1];
  cell.rankLabel.font = [UIFont fontWithName:@"ParryHotter" size:15];
  return cell;
}

-(void)loadHighScoreFile {
  
  NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  path = [path stringByAppendingPathComponent:@"highScore.plist"];
  NSMutableDictionary *fullHSDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
  NSMutableDictionary *categoryDict = [fullHSDict objectForKey:[self getSelectedCategory]];
  highScores = [categoryDict objectForKey:[self getSelectedDifficulty]];
}

-(NSString*)getSelectedCategory {
  if (categorySegControl.selectedSegmentIndex == 0) {
    return @"Characters";
  }
  else if (categorySegControl.selectedSegmentIndex == 1) {
    return @"Wizarding World";
  }
  else
    return @"Spells";
}

-(NSString*)getSelectedDifficulty {
  if (difficultySegControl.selectedSegmentIndex == 0) {
    return @"Easy";
  }
  else if (difficultySegControl.selectedSegmentIndex == 1) {
    return @"Medium";
  }
  else
    return @"Hard";
}

- (IBAction)updateHighScoresTable:(id)sender {
  
  [self loadHighScoreFile];
  [self.highScoresTable reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
