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

- (id)copy
{
  GameQuestion *questionCopy = [[GameQuestion alloc] init];
  
  //YOu may need to copy these values too, this is a shallow copy
  //If YourValues and someOtherValue are only primitives then this would be ok
  //If they are objects you will need to implement copy to these objects too
  questionCopy.question = self.question;
  questionCopy.correctAnswer = self.correctAnswer;
  questionCopy.possibleAnswers = self.possibleAnswers;
  //questionCopy.someOtherValue = self.someOtherValue;
  
  return questionCopy;
}

@end
