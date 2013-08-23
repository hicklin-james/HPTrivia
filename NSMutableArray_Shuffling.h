//
//  NSMutableArray_Shuffling.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif

@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end
