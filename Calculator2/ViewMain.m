//
//  ViewMain.m
//  Calculator2
//
//  Created by abi on 2019/03/05.
//  Copyright © 2019 abi. All rights reserved.
//

#import "ViewMain.h"

#import "AppDelegate.h"

@interface ViewMain (){
    
}
@end

@implementation ViewMain
@synthesize flug;
@synthesize ans;
@synthesize formArray;
@synthesize history;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _formula.text = @"";
    _answer.text = @"";
//    history = [[UITableView alloc] initWithFrame:self.view.bounds];
//    _history.delegate = self;
//    _history.dataSource = self;
//    [self.view addSubview:history];

//    formArray = [NSMutableArray arrayWithObject:@"?"];
    formArray = [NSMutableArray array];
    
//    _formArray = [[NSMutableArray alloc] init];
    self.title = @"計算機";
}

- (IBAction)touch_1:(id)sender {
    _formula.text = [_formula.text stringByAppendingString: @"1"];
}

- (IBAction)touch_2:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"2"];
}

- (IBAction)touch_3:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"3"];
}

- (IBAction)touch_4:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"4"];
}

- (IBAction)touch_5:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"5"];
}

- (IBAction)touch_6:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"6"];
}

- (IBAction)touch_7:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"7"];
}

- (IBAction)touch_8:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"8"];
}

- (IBAction)touch_9:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"9"];
}

- (IBAction)touch_0:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"0"];
}
- (IBAction)touch_period:(id)sender {
    _formula.text = [_formula.text stringByAppendingString: @"."];
}

- (IBAction)touch_plus:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"+"];
    
    self.flug = 1;
    
}

- (IBAction)touch_minus:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"-"];
    
    self.flug = 2;
}

- (IBAction)touch_asterisk:(id)sender {
    _formula.text = [_formula.text stringByAppendingString:@"*"];
    
    self.flug = 3;
}

- (IBAction)touch_srash:(id)sender {
    _formula.text = [_formula.text stringByAppendingString: @"/"];
    
    self.flug = 4;
}

- (IBAction)touch_root:(id)sender {
        _formula.text = [_formula.text stringByAppendingString: @"√"];
}

- (IBAction)touch_clear:(id)sender {
    _formula.text = @"";
    _answer.text = @"";
}

- (IBAction)touch_equal:(id)sender {
    NSString *form = _formula.text;

//    NSLog(@"%ld", formArray.count);
    [formArray addObject:form];
//    再読み込み
    [history reloadData];
//    NSLog(@"%ld", formArray.count);
    
    NSInteger n1 = [[form substringToIndex:1] intValue];
    
    NSInteger n2 = [[form substringFromIndex:2] intValue];
    
    switch (flug) {
        case 1:
            ans = n1 + n2;
            self.answer.text = [NSString stringWithFormat:@"%ld" ,ans];
            break;
        
        case 2:
            ans = n1 - n2;
            self.answer.text = [NSString stringWithFormat:@"%ld",ans];
            break;
            
        case 3:
            ans = n1 * n2;
            self.answer.text = [NSString stringWithFormat:@"%ld",ans];
            break;
            
        case 4:
            ans = n1 / n2;
            self.answer.text = [NSString stringWithFormat:@"%ld",ans];
            break;
            
        default:
            break;
            
    }
    
    self.formula.text = @"";
// アニメーションを使ってセクションを更新する。
//    [self.history reloadSections:[[NSMutableIndexSet alloc] init] withRowAnimation:UITableViewRowAnimationLeft];
    
//    _answer.text = n1 + n2
    
    
    
//    _answer.text =
    
//    _history.dataSource = 
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)history
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//-(NSInteger)history:(UITableView *)history numberOfRowsInSection:(NSInteger)section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return formArray.count;
    //    return [formArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [history dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
//    if ([tableView isEqual:history]) {
//        NSLog(@"true");
//    } else {
//        NSLog(@"false");
//    }
    
    
    cell.textLabel.text = [formArray objectAtIndex:indexPath.row];
    
//    UITableViewCell *cell = [history dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    cellがタップされた際の処理
    UITableViewCell *cell = [history cellForRowAtIndexPath:indexPath];

    if([self.formula.text isEqualToString: @""]){
            self.formula.text = cell.textLabel.text;
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確認" message:@"計算式を上書きしてよろしいですか？" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){self.formula.text = cell.textLabel.text;}]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){return;}]];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    }



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
