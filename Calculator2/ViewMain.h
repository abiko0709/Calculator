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
}

@property (nonatomic) IBOutlet UITextField *answer;
@property (nonatomic) IBOutlet UITextField *formula;
@property (nonatomic) IBOutlet NSMutableArray *formArray;
@property (nonatomic) IBOutlet UITableView *history;

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

@property (nonatomic) long flug;
@property (nonatomic) long ans;

@end
