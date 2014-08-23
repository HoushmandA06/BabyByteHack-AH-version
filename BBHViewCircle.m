//
//  BBHViewCircle.m
//  BabyByteHack
//
//  Created by Savitha Reddy on 8/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBHViewCircle.h"

@implementation BBHViewCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self drawEllipse:context];
 
    }
    return self;
}

-(void)drawEllipse:(CGContextRef)context{
    
    CGContextSaveGState(context);
    
    //Set color of current context
    [[UIColor blackColor] set];
    
    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor] CGColor]);
    
    //Draw ellipse
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);
    
    CGContextRestoreGState(context);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
