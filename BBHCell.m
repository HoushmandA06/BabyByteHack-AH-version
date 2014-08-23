//
//  MMRCell.m
//  Memories
//
//  Created by Savitha Reddy on 7/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBHCell.h"

@implementation BBHCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imagePicture = [[UIImageView alloc] init];
        self.imagePicture.frame = CGRectMake(0, 0, 100, 100);
        self.imagePicture.clipsToBounds = YES;
        self.imagePicture.layer.cornerRadius = 50;
        [self.contentView addSubview:self.imagePicture];
        
        self.namePicture = [[UILabel alloc] init];
        self.namePicture.frame = CGRectMake(0, 90, 100, 20);
        self.namePicture.textAlignment= NSTextAlignmentCenter;
        self.namePicture.textColor = [UIColor blueColor];
        [self.contentView addSubview:self.namePicture];
    }
    return self;
}



@end
