//
//  BBHSingleton.h
//  BabyByteHack
//
//  Created by Ali Houshmand on 8/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBHSingleton : NSObject

+(BBHSingleton *)mainData;

@property (nonatomic) NSString * theme;  //have getters/setters, by default = nill, which for NSInt = 0


@end
