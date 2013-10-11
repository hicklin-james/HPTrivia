//
//  GameQuestion.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameQuestion : NSObject  {
  NSString *question;
  NSString *correctAnswer;
  NSMutableArray *possibleAnswers;
}

@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *correctAnswer;
@property (strong, nonatomic) NSMutableArray *possibleAnswers;

-(id)init:(NSString*)theQuestion theCorrectAnswer:(NSString*)theCorrectAnswer answerOne:(NSString*)answerOne answerTwo:(NSString*)answerTwo answerThree:(NSString*)answerThree answerFour:(NSString*)answerFour;
-(id)copy;

@end
