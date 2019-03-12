//
//  ViewMain.h
//  Calculator2
//
//  Created by abi on 2019/03/05.
//  Copyright © 2019 abi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewMain : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *formArray;
    UITableView *history;
    UIButton *Button_0;
    UIButton *Button_1;
    UIButton *Button_2;
    UIButton *Button_3;
    UIButton *Button_4;
    UIButton *Button_5;
    UIButton *Button_6;
    UIButton *Button_7;
    UIButton *Button_8;
    UIButton *Button_9;
    UIButton *Button_plus;
    UIButton *Button_minus;
    UIButton *Button_asterisk;
    UIButton *Button_srash;
    UIButton *Button_period;
    UIButton *Button_clear;
    UIButton *Button_root;
    UIButton *Button_equal;
    long flug;
    long ans;
}

@property (nonatomic) IBOutlet UITextField *answer;
@property (nonatomic) IBOutlet UITextField *formula;
@property (nonatomic) IBOutlet UITableView *history;
@property (nonatomic) IBOutlet UIButton *Button_0;
@property (nonatomic) IBOutlet UIButton *Button_1;
@property (nonatomic) IBOutlet UIButton *Button_2;
@property (nonatomic) IBOutlet UIButton *Button_3;
@property (nonatomic) IBOutlet UIButton *Button_4;
@property (nonatomic) IBOutlet UIButton *Button_5;
@property (nonatomic) IBOutlet UIButton *Button_6;
@property (nonatomic) IBOutlet UIButton *Button_7;
@property (nonatomic) IBOutlet UIButton *Button_8;
@property (nonatomic) IBOutlet UIButton *Button_9;
@property (nonatomic) IBOutlet UIButton *Button_plus;
@property (nonatomic) IBOutlet UIButton *Button_minus;
@property (nonatomic) IBOutlet UIButton *Button_asterisk;
@property (nonatomic) IBOutlet UIButton *Button_srash;
@property (nonatomic) IBOutlet UIButton *Button_period;
@property (nonatomic) IBOutlet UIButton *Button_clear;
@property (nonatomic) IBOutlet UIButton *Button_root;
@property (nonatomic) IBOutlet UIButton *Button_equal;

- (IBAction)touch_1:(id)sender;
- (IBAction)touch_2:(id)sender;
- (IBAction)touch_3:(id)sender;
- (IBAction)touch_4:(id)sender;
- (IBAction)touch_5:(id)sender;
- (IBAction)touch_6:(id)sender;
- (IBAction)touch_7:(id)sender;
- (IBAction)touch_8:(id)sender;
- (IBAction)touch_9:(id)sender;
- (IBAction)touch_0:(id)sender;
- (IBAction)touch_plus:(id)sender;
- (IBAction)touch_minus:(id)sender;
- (IBAction)touch_asterisk:(id)sender;
- (IBAction)touch_srash:(id)sender;
- (IBAction)touch_period:(id)sender;
- (IBAction)touch_clear:(id)sender;
- (IBAction)touch_root:(id)sender;
- (IBAction)touch_equal:(id)sender;

@end
