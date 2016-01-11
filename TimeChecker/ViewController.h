//
//  ViewController.h
//  TimeChecker
//
//  Created by MikamiHayato on 2016/01/10.
//  Copyright © 2016年 MikamiHayato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* inputTarget;
@property (weak, nonatomic) IBOutlet UITextField* inputTextStart;
@property (weak, nonatomic) IBOutlet UITextField* inputTextEnd;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *labelTarget;
@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@property (weak, nonatomic) IBOutlet UILabel *labelEnd;


- (IBAction)inputField;
- (IBAction)inputFieldStart;
- (IBAction)inputFieldEnd;

+ (BOOL)isInclude:(int)target between:(int)start and:(int)end;

@end

