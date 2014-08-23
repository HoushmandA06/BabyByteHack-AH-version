//
//  BBHViewController.m
//  BabyByteHack
//
//  Created by Savitha Reddy on 8/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBHViewController.h"
#import "BBHViewCircle.h"
#import "BBHSingleton.h"

@interface BBHViewController ()

@end

@implementation BBHViewController
{
    BBHViewCircle *view;
    NSMutableDictionary * sampleText;
    UILabel * textGuide;
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    sampleText = [@{@"Shapes":@"Make shapes with fingers: Circle, Square, Triangle",
                    @"Animals":@"Make fun animal noises: Bird, Kitten, Puppy",
                    @"Baby":@"Point to baby's: Ears, Eyes, Nose",
                    @"Colors":@"Find colors in the room: Blue, Red, Green",
                    @"House":@"What's in the house: Door, Window, Floor",
                    @"People":@"Point to a picture of: Mother, Baby, Brother/Sister",
                    @"MealTime":@"Some foods we eat: Milk, Apple, Banana",
                    @"BathTime":@"Whats in the bath: Bubbles, Water, Ducky",
                    @"BedTime":@"What do we say for bedtime: Goodnight, Sleepy, Tired",
                    } mutableCopy];
    
    textGuide = [[UILabel alloc] initWithFrame:CGRectMake(10, self.navigationController.view.frame.origin.y+40, SCREEN_WIDTH, 100)];
    textGuide.textColor = [UIColor orangeColor];
    textGuide.font = [UIFont fontWithName:@"Helvetica" size:12];
    textGuide.text = sampleText[[BBHSingleton mainData].theme];

    [self.view addSubview:textGuide];

    view = [[BBHViewCircle alloc] init];
//            WithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
