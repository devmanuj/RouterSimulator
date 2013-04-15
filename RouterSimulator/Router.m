//
//  Router.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "Router.h"
#import "IpAddress.h"
#import "NetworkRule.h"
#import "NSString+Input.h"

extern NSString * const kWhiteSpace;
NSString * const kError = @"error";
static NSString * const kDefault = @"default";

@interface Router()

@property(nonatomic, strong) NSMutableArray *rules;
@property(nonatomic, strong) IpAddress *defaultgateway;

-(void)configureRules;
-(void)identifyRoutes;
-(IpAddress *)calulateDestinationAddress:(IpAddress *)route Error:(NSError **)error;
-(NSString *)takeInputFromUser;

@end

@implementation Router


-(void)initiateRouter
{
    NSLog(@"\"NETWORK ROUTER SIMULATOR\"\n");
    
    do
    {
        @try
        {
            [self configureRules];
            [self identifyRoutes];
        }
        @catch (NSException *exception)
        {
            NSLog(@"Invalid input values, kindly enter correct input values");
        }
    } while (1);


}


-(void)configureRules
{
    self.rules = [NSMutableArray array];
    self.defaultgateway = nil;
    
    NSInteger ruleCount = [[self takeInputFromUser] integerValue];
    
    for (int index = 1; index <= ruleCount; index++)
    {
        NSString *userInput = [self takeInputFromUser];
        
        NSArray *enteredWords = [userInput componentsSeparatedByString:kWhiteSpace];
        
        if ([[enteredWords objectAtIndex:0] isEqualToString:kDefault])
        {
            self.defaultgateway = [[IpAddress alloc] initWithString:[enteredWords objectAtIndex:1]];
            continue;
        }
        else
        {
            NetworkRule *rule = [[NetworkRule alloc] initWithString:userInput];
            [[self rules] addObject:rule];
        }
    }
}


-(void)identifyRoutes
{
    NSInteger routeCount = [[self takeInputFromUser] integerValue];
    
    for (int index = 1; index <= routeCount; index++)
    {
        NSString *userInput = [self takeInputFromUser];
        
        IpAddress *route = [[IpAddress alloc] initWithString:userInput];
        
        NSError *error;
        IpAddress *destination = [self calulateDestinationAddress:route Error:&error];
        
        if (destination)
        {
            NSLog(@"%@",destination.ipAddress);
        }
        else
        {
            NSLog(@"%@",[[error userInfo] objectForKey:kError]);
        }
    }
}

-(IpAddress *)calulateDestinationAddress:(IpAddress *)route Error:(NSError **)error
{
    for (NetworkRule *rule in self.rules)
    {
        if ([route matchesRules:rule])
            return rule.destinationMachineAddress;
    }
    
    if (self.defaultgateway)
    {
        return self.defaultgateway;
    }
    else
    {
        NSDictionary *errorDictionary = [NSDictionary dictionaryWithObject:@"NO ROUTE DEFINED" forKey:kError];
            
        *error = [NSError errorWithDomain:@"NO ROUTE DEFINED" code:0 userInfo:errorDictionary];
    }
    
    return nil;
}


-(NSString *)takeInputFromUser
{
    NSString * input = [NSString stringFromStandardInDelimitedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    return input;
}


@end
