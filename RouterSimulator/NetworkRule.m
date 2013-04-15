//
//  NetworkRule.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "NetworkRule.h"

NSString * const kWhiteSpace = @" ";

@interface NetworkRule()

@property(readwrite, nonatomic, strong) IpAddress *networkAddress;
@property(readwrite, nonatomic, strong) IpAddress *subnetMask;
@property(readwrite, nonatomic, strong) IpAddress *destinationMachineAddress;

@end

@implementation NetworkRule

-(id)initWithString:(NSString *)ruleString
{
    self = [super init];
    
    if (self)
    {
        NSArray *addresses = [ruleString componentsSeparatedByString:@" "];
        
        self.networkAddress = [[IpAddress alloc] initWithString:[addresses objectAtIndex:0]];
        self.subnetMask = [[IpAddress alloc] initWithString:[addresses objectAtIndex:1]];
        self.destinationMachineAddress = [[IpAddress alloc] initWithString:[addresses objectAtIndex:2]];
    }
    
    return self;
}



@end
