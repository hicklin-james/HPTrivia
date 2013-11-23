//
//  NSString+fitFontToButton.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-10-14.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#define IOS_NEWER_OR_EQUAL_TO_7 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 7.0 )

#import "NSString+fitFontToButton.h"

@implementation NSString (fitFontToButton)

- (CGFloat)fontSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {

  /*CGFloat fontSize = [font pointSize];
  CGFloat height;
  if (IOS_NEWER_OR_EQUAL_TO_7) {
    CGRect newFrame = [self boundingRectWithSize:CGSizeMake(size.width,FLT_MAX)
                                options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSLineBreakByWordWrapping)
                             attributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: font, nil] forKeys:[NSArray arrayWithObjects:NSFontAttributeName, nil]]
                                context:nil];
    height = newFrame.size.height;
  }
  else {
    height = [self sizeWithFont:font constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;  // PRE iOS7
  }
  UIFont *newFont = font;
  
  //Reduce font size while too large, break if no height (empty string)
  while (height > size.height && height != 0) {
    fontSize--;
    newFont = [UIFont fontWithName:font.fontName size:fontSize];
    if (IOS_NEWER_OR_EQUAL_TO_7) {
      CGRect newFrame = [self boundingRectWithSize:CGSizeMake(size.width,FLT_MAX)
                                           options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSLineBreakByWordWrapping)
                                        attributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: newFont, nil] forKeys:[NSArray arrayWithObjects:NSFontAttributeName, nil]]
                                           context:nil];
      height = newFrame.size.height;
    }
    else {
      height = [self sizeWithFont:newFont constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;  // PRE iOS7
    }
  };
  
  // Loop through words in string and resize to fit
  for (NSString *word in [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]) {
    //CGFloat width = [word sizeWithFont:newFont].width;
    CGFloat width = [word sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:newFont, NSFontAttributeName, nil]].width;
    while (width > size.width && width != 0) {
      fontSize--;
      newFont = [UIFont fontWithName:font.fontName size:fontSize];
     // width = [word sizeWithFont:newFont].width;
      width = [word sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:newFont, NSFontAttributeName, nil]].width;
    }
  }
  return fontSize;
   */
  
  CGFloat fontSize = [font pointSize];
  CGFloat height = [self sizeWithFont:font constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;
  UIFont *newFont = font;
  
  //Reduce font size while too large, break if no height (empty string)
  while (height > size.height && height != 0) {
    fontSize--;
    newFont = [UIFont fontWithName:font.fontName size:fontSize];
    height = [self sizeWithFont:newFont constrainedToSize:CGSizeMake(size.width,FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;
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
