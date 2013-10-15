//
//  NSString+fitFontToButton.h
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-14.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (fitFontToButton)
- (CGFloat)fontSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
