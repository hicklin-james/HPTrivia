//
//  GameController.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "GameController.h"

@implementation GameController

@synthesize category;
@synthesize difficulty;
@synthesize questionNumber;
@synthesize allQuestions;
@synthesize correctAnswers;
@synthesize numOfQuestions;


-(id)init:(NSString*)theCategory theDifficulty:(NSString*)theDifficulty numberOfQuestions:(NSInteger)numberOfQuestions {
  
  self = [super init];
  if (self) {
    category = theCategory;
    difficulty = theDifficulty;
    questionNumber = 1;
    correctAnswers = 0;
    numOfQuestions = numberOfQuestions;
    allQuestions = [[NSMutableArray alloc] init];
    NSString *path;
    if ([category  isEqual: @"Characters"]) {
      // Path to the plist (in the application bundle)
      path = [[NSBundle mainBundle] pathForResource:
              @"characterQuestions" ofType:@"plist"];
    }
    else if ([category isEqual:@"Spells"]) {
      path = [[NSBundle mainBundle] pathForResource:
              @"spellQuestions" ofType:@"plist"];
    }
    else if ([category isEqual:@"Wizarding World"]) {
      path = [[NSBundle mainBundle] pathForResource:
              @"wizardingWorldQuestions" ofType:@"plist"];
    }
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSMutableArray *questionsArray = [plistDict objectForKey:difficulty];
    for (int i = 0; i < [questionsArray count]; i++) {
      NSMutableDictionary *thisQuestionDict = [questionsArray objectAtIndex:i];
      // NSLog([NSString stringWithFormat:@"The question title is: %@", [thisQuestion objectForKey:@"Question"]], nil);
      NSString *thisQuestion = [thisQuestionDict objectForKey:@"Question"];
      NSString *thisAnswer = [thisQuestionDict objectForKey:@"Correct Answer"];
      NSString *thisFirstAnswer = [thisQuestionDict objectForKey:@"Answer 1"];
      NSString *thisSecondAnswer = [thisQuestionDict objectForKey:@"Answer 2"];
      NSString *thisThirdAnswer = [thisQuestionDict objectForKey:@"Answer 3"];
      NSString *thisFourthAnswer = [thisQuestionDict objectForKey:@"Answer 4"];
      GameQuestion *fullQuestion = [[GameQuestion alloc] init:thisQuestion theCorrectAnswer:thisAnswer answerOne:thisFirstAnswer answerTwo:thisSecondAnswer answerThree:thisThirdAnswer answerFour:thisFourthAnswer];
      
      [allQuestions addObject:fullQuestion];
    }
    
    if (numOfQuestions == 0)
      numOfQuestions = [allQuestions count];
    
    NSLog([NSString stringWithFormat:@"There are %d questions at this difficulty in this category", [allQuestions count]], nil);
    
    
    return self;
  }
  return nil;
  
}

-(GameQuestion*)fetchRandomQuestion {
  
  int randNum = arc4random_uniform([allQuestions count]);
  NSLog([NSString stringWithFormat:@"%d", randNum], nil);
  return [allQuestions objectAtIndex:randNum];
}

-(NSString*)getNextDifficultyLevel{
  
  if ([difficulty isEqual:@"Easy"])
    return @"Medium";
  else if ([difficulty isEqual:@"Medium"])
    return @"Hard";
  else
    return @"allFinished";
  
}

-(void)unlockNextDifficulty {
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([difficulty isEqual:@"Easy"])
    [defaults setInteger:1 forKey:[NSString stringWithFormat:@"%@ Difficulty Allowed", category]];
  else if ([difficulty isEqual:@"Medium"])
    [defaults setInteger:2 forKey:[NSString stringWithFormat:@"%@ Difficulty Allowed", category]];
}

@end