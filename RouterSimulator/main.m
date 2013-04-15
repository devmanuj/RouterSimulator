//
//  main.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Router.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Router *router = [[Router alloc] init];
        [router initiateRouter];
    }
    return 0;
}

