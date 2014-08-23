//
//  SPGAddItemVC.m
//  ShopPING
//
//  Created by Savitha Reddy on 6/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBHBabyProfile.h"
#import "BBHCollectionVC.h"

@interface BBHBabyProfile () <UITextFieldDelegate>

@end

@implementation BBHBabyProfile
{
    UIView *addFrame;
    UITextField *addName;
    UITextField *addDob;
    UIDatePicker *myPickerView;
    UIButton *registerBaby;
    UIButton *cancelBaby;
    NSArray *metric;
    UIButton * done;
    
}

#pragma mark - Create Add Form
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        addFrame = [[UIView alloc] initWithFrame:CGRectMake(20, 140, 280, 260)];
        //        addFrame.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:addFrame];
        
        addName = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 260, 40)];
        //        addName.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.0];
        addName.backgroundColor = [UIColor lightGrayColor];
        addName.placeholder = @" Please enter baby name";
        addName.delegate = self;
        addName.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        addName.clearsOnBeginEditing = YES;
        addName.autocapitalizationType = UITextAutocapitalizationTypeNone;
        addName.autocorrectionType = UITextAutocorrectionTypeNo;
        [addFrame addSubview:addName];
        
        UIView *metricView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
        
        myPickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        myPickerView.datePickerMode = UIDatePickerModeDate;
        [myPickerView addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
       
        addDob = [[UITextField alloc] initWithFrame:CGRectMake(10, 60, 260, 40)];
        //        addDob.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.0];
        addDob.backgroundColor = [UIColor lightGrayColor];
        addDob.placeholder = @" Click to enter date";
        addDob.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        addDob.inputView = myPickerView;
        [addFrame addSubview:addDob];
        
        done = [[UIButton alloc] initWithFrame:CGRectMake(0,0,100,100)];
        done.backgroundColor = [UIColor blueColor];
        done.layer.cornerRadius = 8;
        [done setTitle:@"Done" forState:UIControlStateNormal];
        [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [done addTarget:self action:@selector(closeDatePickerView) forControlEvents:UIControlEventTouchUpInside];

        [metricView addSubview:done];
        [metricView addSubview:myPickerView];
        
        
        UISegmentedControl *genderSelect = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@" Boy ", @" Girl ", nil]];
        [genderSelect setFrame:CGRectMake(10, 110, 260, 40)];
        //        [genderSelect setSelectedSegmentIndex:0];
        //        [genderSelect setImage:nil forSegmentAtIndex:0];
        //        [genderSelect setTintColor:[UIColor greenColor]];
        [genderSelect setUserInteractionEnabled:YES];
        [genderSelect addTarget:self action:@selector(mainSegmentControl:) forControlEvents: UIControlEventValueChanged];
        [addFrame addSubview:genderSelect];
        
        registerBaby = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 260, 44)];
        registerBaby.backgroundColor = [UIColor colorWithRed:0.0 green:0.7 blue:0.3 alpha:0.7];
        registerBaby.layer.cornerRadius = 5;
        [registerBaby setTitle:@"REGISTER" forState:UIControlStateNormal];
        [registerBaby addTarget:self action:@selector(openCollectionVC) forControlEvents:UIControlEventTouchUpInside];
        [addFrame addSubview:registerBaby];
        
        
    }
    return self;
}

-(void)closeDatePickerView
{
    
    [self.view endEditing:YES];
    
}


-(void) openCollectionVC
{
    BBHCollectionVC *collectionVC = [[BBHCollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    [self.navigationController pushViewController:collectionVC animated:YES];
    collectionVC.navigationController.navigationBarHidden = NO;
    
}

-(void) mainSegmentControl : (UISegmentedControl *) segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        NSLog(@"Boy Selected");
    }
    else if(segment.selectedSegmentIndex == 1)
    {
        NSLog(@"Girl Selected");
    }
}

-(void) updateTextField: (UIDatePicker *)sender
{
    NSDate *dateSelected = [sender date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    df.dateStyle = NSDateFormatterMediumStyle;
    addDob.text =[df stringFromDate:dateSelected];
}


-(void) hideKeyboard
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        addFrame.frame = CGRectMake(20, 140, 280, 260);
        
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        addFrame.frame = CGRectMake(20, 140, 280, 260);
    }];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    addName.textColor = [UIColor blackColor];
    addDob.textColor = [UIColor blackColor];
    int extraSlide = -1;
    [UIView animateWithDuration:0.3 animations:^{
        addFrame.frame = CGRectMake(20, extraSlide+100, 280, 260);
        
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 60)];
    //    header.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:header];
    UILabel *headerLabelg = [[UILabel alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH/2,60)];
    headerLabelg.text = @"BABY";
    headerLabelg.font = [UIFont fontWithName:@"Savoye LET" size:40];
    headerLabelg.textColor = [UIColor redColor];
    headerLabelg.textAlignment = NSTextAlignmentRight;
    [header addSubview:headerLabelg];
    UILabel *headerLabelb = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2,0,SCREEN_WIDTH/2,60)];
    headerLabelb.text = @"BYTE";
    headerLabelb.font = [UIFont fontWithName:@"Savoye LET" size:40];
    headerLabelb.textColor = [UIColor blueColor];
    headerLabelb.textAlignment = NSTextAlignmentLeft;
    [header addSubview:headerLabelb];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
