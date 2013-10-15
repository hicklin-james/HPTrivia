//
//  GameController.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameQuestion.h"

@interface GameController : NSObject {
  NSInteger questionNumber;
  NSInteger numOfQuestions;
  NSInteger correctAnswers;
  NSString *category;
  NSString *difficulty;
  NSMutableArray *allQuestions;
}

@property (nonatomic, assign) NSInteger numOfQuestions;
@property (nonatomic, assign) NSInteger correctAnswers;
@property (nonatomic, assign) NSInteger questionNumber;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *difficulty;
@property (strong, nonatomic) NSMutableArray *allQuestions;

-(id)init:(NSString*)theCategory theDifficulty:(NSString*)theDifficulty numberOfQuestions:(NSInteger)numberOfQuestions;
-(GameQuestion*)fetchRandomQuestion;
-(NSString*)getNextDifficultyLevel;
-(void)unlockNextDifficulty;
-(BOOL)didPass;
-(NSInteger)calculatePercentageScore;

@end
