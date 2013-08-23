//
//  NSMutableArray_Shuffling.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "NSMutableArray_Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
  NSUInteger count = [self count];
  for (NSUInteger i = 0; i < count; ++i) {
    // Select a random element between i and end of array to swap with.
    NSInteger nElements = count - i;
    NSInteger n = (arc4random() % nElements) + i;
    [self exchangeObjectAtIndex:i withObjectAtIndex:n];
  }
}

@end
