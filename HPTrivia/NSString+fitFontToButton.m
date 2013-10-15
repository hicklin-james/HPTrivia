//
//  NSString+fitFontToButton.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-14.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "NSString+fitFontToButton.h"

@implementation NSString (fitFontToButton)

- (CGFloat)fontSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
  CGFloat fontSize = [font pointSize];
  CGFloat height = [self sizeWithFont:font constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:UILineBreakModeWordWrap].height;
  UIFont *newFont = font;
  
  //Reduce font size while too large, break if no height (empty string)
  while (height > size.height && height != 0) {
    fontSize--;
    newFont = [UIFont fontWithName:font.fontName size:fontSize];
    height = [self sizeWithFont:newFont constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:UILineBreakModeWordWrap].height;
  };
  
  // Loop through words in string and resize to fit
  for (NSString *word in [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]) {
    CGFloat width = [word sizeWithFont:newFont].width;
    while (width > size.width && width != 0) {
      fontSize--;
      newFont = [UIFont fontWithName:font.fontName size:fontSize];
      width = [word sizeWithFont:newFont].width;
    }
  }
  return fontSize;
}

@end
