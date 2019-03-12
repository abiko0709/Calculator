//
//  ViewMain.m
//  Calculator2
//
//  Created by abi on 2019/03/05.
//  Copyright © 2019 abi. All rights reserved.
//

#import "ViewMain.h"

#import "AppDelegate.h"

@interface ViewMain ()
@end

@implementation ViewMain
@synthesize flug;
@synthesize ans;
@synthesize formArray;
@synthesize history;

/* 初期表示 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    _formula.text = @"";
    _answer.text = @"";
    flug = 0;
    formArray = [NSMutableArray array];
    self.title = @"計算機";
}

/* 1ボタンタップ */
- (IBAction)touch_1:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"1"];
}

/* 2ボタンタップ */
- (IBAction)touch_2:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"2"];
}

/* 3ボタンタップ */
- (IBAction)touch_3:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"3"];
}

/* 4ボタンタップ */
- (IBAction)touch_4:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"4"];
}

/* 5ボタンタップ */
- (IBAction)touch_5:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"5"];
}

/* 6ボタンタップ */
- (IBAction)touch_6:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"6"];
}

/* 7ボタンタップ */
- (IBAction)touch_7:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"7"];
}

/* 8ボタンタップ */
- (IBAction)touch_8:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"8"];
}

/* 9ボタンタップ */
- (IBAction)touch_9:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"9"];
}

/* 0ボタンタップ */
- (IBAction)touch_0:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"0"];
}

/* .ボタンタップ */
- (IBAction)touch_period:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"."];
}

/* +ボタンタップ */
- (IBAction)touch_plus:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"+"];
}

/* -ボタンタップ */
- (IBAction)touch_minus:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"-"];
}

/* *ボタンタップ */
- (IBAction)touch_asterisk:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString:@"*"];
}

/* /ボタンタップ */
- (IBAction)touch_srash:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"/"];
}

/* √ボタンタップ */
- (IBAction)touch_root:(id)sender
{
    _formula.text = [_formula.text stringByAppendingString: @"√"];
}

/* Cボタンタップ */
- (IBAction)touch_clear:(id)sender
{
    _formula.text = @"";
    _answer.text = @"";
}

/* =ボタンタップ */
- (IBAction)touch_equal:(id)sender
{
    NSString *form = _formula.text;

//  TextFieldに計算式を入力していない場合／⚪︎+⚪︎形式でない場合はメッセージを表示する
    if([form isEqualToString:@""]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告"
                                                                                 message:@"計算式を入力してください。"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action){return;}]];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
//      TextFieldに入力された計算式が正しいか入力チェックを行う
        NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        NSCharacterSet *numtarget1 = [NSCharacterSet characterSetWithCharactersInString:[form substringToIndex:1]];
        NSCharacterSet *numtarget2 = [NSCharacterSet characterSetWithCharactersInString:[form substringFromIndex:2]];
        NSCharacterSet *sign = [NSCharacterSet characterSetWithCharactersInString:@"+*-/"];
        NSCharacterSet *signtarget = [NSCharacterSet characterSetWithCharactersInString:[form substringWithRange:NSMakeRange(1, 1)]];
        
        if([numbers isSupersetOfSet:numtarget1] == NO || [numbers isSupersetOfSet:numtarget2] == NO || [sign isSupersetOfSet:signtarget] == NO){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告"
                                                                                     message:@"計算式が正しくありません。"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action){return;}]];
            [self presentViewController:alertController animated:YES completion:nil];
        }else{
            NSInteger n1 = [[form substringToIndex:1] intValue];
            NSInteger n2 = [[form substringFromIndex:2] intValue];
            
            //  formArrayに同じ計算式がなければ値を追加
            if (![formArray containsObject:_formula.text]) {
                [formArray addObject:form];
            }
                
            //  TableView再読み込み
            [history reloadData];
            
            NSString *sign = [form substringWithRange:NSMakeRange(1, 1)];
            if([sign isEqualToString:@"+"]){
                flug = 1;
            }else if ([sign isEqualToString:@"-"]){
                flug = 2;
            }else if ([sign isEqualToString:@"*"]){
                flug = 3;
            }else if ([sign isEqualToString:@"/"]){
                flug = 4;
            }
            
            //  四則計算分岐のswitch文
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
        }
    }
}

/* TableViewのセクション数を返すメソッド */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/* TableVIewの行数を返すメソッド */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return formArray.count;
}

/* TableViewのセルの値を設定するメソッド */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [history dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
        cell.textLabel.text = [formArray objectAtIndex:indexPath.row];
    
    return cell;
}

/* TableViewのセルタップ */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [history cellForRowAtIndexPath:indexPath];
    
//  セルの色を変える
    cell.contentView.backgroundColor = [UIColor yellowColor];

    if([self.formula.text isEqualToString: @""]){
            self.formula.text = cell.textLabel.text;
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確認"
                                                                                 message:@"計算式を上書きしてよろしいですか？"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action){self.formula.text = cell.textLabel.text;}]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action){return;}]];
            
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
