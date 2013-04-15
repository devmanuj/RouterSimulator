//
//  IpAddress.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "IpAddress.h"
#import "NetworkRule.h"

static unsigned char const kOctetValue0 = 0;
static unsigned char const kOctetValue255 = 255;

@interface IpAddress()
{
    
}

@property(readwrite, nonatomic, assign) unsigned char firstOctet;
@property(readwrite, nonatomic, assign) unsigned char secondOctet;
@property(readwrite, nonatomic, assign) unsigned char thirdOctet;
@property(readwrite, nonatomic, assign) unsigned char fourthOctet;
@property(readwrite, nonatomic, strong) NSString *ipAddress;

@end

@implementation IpAddress


-(id)initWithString:(NSString *)ipAddressString
{
    self = [super init];
    
    if (self)
    {
        self.ipAddress = [NSString stringWithString:ipAddressString];
        
        NSArray *octetArray = [self.ipAddress componentsSeparatedByString:@"."];

        self.firstOctet = [[octetArray objectAtIndex:0] integerValue];
        self.secondOctet = [[octetArray objectAtIndex:1] integerValue];
        self.thirdOctet = [[octetArray objectAtIndex:2] integerValue];
        self.fourthOctet = [[octetArray objectAtIndex:3] integerValue];
        
    }
    
    return self;
}

-(BOOL)isEqual:(NSString *)anotherIpAddress
{
    if ([self.ipAddress isEqualToString:anotherIpAddress])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


-(BOOL)matchesRules:(NetworkRule *)rule
{
    
    if (rule.networkAddress.firstOctet != self.firstOctet)
    {
        return NO;
    }
    
    if (rule.subnetMask.secondOctet == kOctetValue255)
    {
        if (rule.networkAddress.secondOctet != self.secondOctet)
        {
            return NO;
        }
    }
    
    if (rule.subnetMask.thirdOctet == kOctetValue255)
    {
        if (rule.networkAddress.thirdOctet != self.thirdOctet)
        {
            return NO;
        }
    }
    
    return YES;

}

@end
