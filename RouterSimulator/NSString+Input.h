//
//  NSString+Input.h
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Input)

+ (NSString *) stringFromStandardInDelimitedByCharactersInSet:(NSCharacterSet *)delimiters;

@end
