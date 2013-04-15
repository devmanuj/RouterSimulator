//
//  NSString+Input.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "NSString+Input.h"

@implementation NSString (Input)

+ (NSString *) stringFromStandardInDelimitedByCharactersInSet:(NSCharacterSet *)delimiters
{
    NSMutableString * string = [NSMutableString string];
    unichar input = '\0';
    while ((input = getchar()))
    {
        if ([delimiters characterIsMember:input])
        {
            break;
        }
        [string appendFormat:@"%C", input];
        
    }
    return string;
}

@end
