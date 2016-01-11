//
//  ViewController.m
//  TimeChecker
//
//  Created by MikamiHayato on 2016/01/10.
//  Copyright © 2016年 MikamiHayato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _inputTarget.keyboardType = UIKeyboardTypeNumberPad;
    _inputTextStart.keyboardType = UIKeyboardTypeNumberPad;
    _inputTextEnd.keyboardType = UIKeyboardTypeNumberPad;
    
    _label.text = @"時間を入力してください";
    _labelTarget.text = @"指定時刻";
    _labelStart.text = @"開始時刻";
    _labelEnd.text = @"終了時刻";
}


+ (UIView*)createInputView:(ViewController*)target action:(SEL)action{
    UIView* accessoryView =[[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
    accessoryView.backgroundColor = [UIColor whiteColor];

    // ボタンを作成
    UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(210,10,100,30);
    [closeButton setTitle:@"閉じる" forState:UIControlStateNormal];

    // ボタンを押したときの動作
    [closeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    // サブビュー作成
    [accessoryView addSubview:closeButton];
    
    return accessoryView;
}


- (IBAction)inputField{
    _inputTarget.inputAccessoryView = [ViewController createInputView:self action:@selector(closeKeyboard:)];
}

-(void)closeKeyboard:(id)sender{
    [_inputTarget resignFirstResponder];
    [self updateLabel];
}


- (IBAction)inputFieldStart{
    _inputTextStart.inputAccessoryView = [ViewController createInputView:self action:@selector(closeKeyboardStart:)];
}

-(void)closeKeyboardStart:(id)sender{
    [_inputTextStart resignFirstResponder];
    [self updateLabel];
}


- (IBAction)inputFieldEnd{
    _inputTextEnd.inputAccessoryView = [ViewController createInputView:self action:@selector(closeKeyboardEnd:)];
}

-(void)closeKeyboardEnd:(id)sender{
    [_inputTextEnd resignFirstResponder];
    [self updateLabel];
}


-(void)updateLabel{
    _label.numberOfLines = 2;


    NSDictionary* dict = @{_labelTarget.text:_inputTarget.text,
                          _labelStart.text:_inputTextStart.text,
                          _labelEnd.text:_inputTextEnd.text,
                          };

    for (NSString* key in [dict allKeys]) {
        NSString* value = [dict objectForKey:key];
        if ([value length] == 0) {
            _label.text = [NSString stringWithFormat:@"エラー:%@を入力してください", key];
            return;
        }

        int minHour = 0;
        int maxHour = 24;
        int time = [value intValue];
        if (!(minHour <= time && time <= maxHour)) {
            _label.text = [NSString stringWithFormat:@"エラー:%@\n0から24で入力してください", key];
            return;
        }
    }

    int target = [_inputTarget.text intValue];
    int start = [_inputTextStart.text intValue];
    int end = [_inputTextEnd.text intValue];

    if ([ViewController isInclude:target between:start and:end]) {
        _label.text = @"判定結果:OK\n指定時刻は範囲に含まれます";
    } else {
        _label.text = @"判定結果:NG\n指定時刻は範囲に含ません";
    }
}

+ (BOOL)isInclude:(int)target between:(int)start and:(int)end{
    int maxHour = 24;
    if (end < start) {
        end += maxHour;
        target += maxHour;
    }
    
    if (start == end) {
        return start == target;
    } else {
        return start <= target && target < end;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
