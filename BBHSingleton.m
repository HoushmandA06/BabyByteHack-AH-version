//
//  BBHSingleton.m
//  BabyByteHack
//
//  Created by Ali Houshmand on 8/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBHSingleton.h"

@implementation BBHSingleton

+(BBHSingleton *)mainData
{
    static dispatch_once_t create;
    static BBHSingleton * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[BBHSingleton alloc] init];
    });
    return singleton;
}

-(id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}


@end
