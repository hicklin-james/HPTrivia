//
//  GameQuestion.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "GameQuestion.h"

@implementation GameQuestion

@synthesize question;
@synthesize correctAnswer;
@synthesize possibleAnswers;

-(id)init:(NSString*)theQuestion theCorrectAnswer:(NSString*)theCorrectAnswer answerOne:(NSString*)answerOne answerTwo:(NSString*)answerTwo answerThree:(NSString*)answerThree answerFour:(NSString*)answerFour {
  
  self = [super init];
  if (self) {
    question = theQuestion;
    correctAnswer = theCorrectAnswer;
    possibleAnswers = [NSMutableArray arrayWithObjects:answerOne, answerTwo, answerThree, answerFour, nil];
    return self;
  }
  return nil;
  
}

@end
