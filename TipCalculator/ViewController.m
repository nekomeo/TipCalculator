//
//  ViewController.m
//  TipCalculator
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tipAmountLabel.text = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTipButton:(UIButton *)sender {
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmount = ((billAmount * 15)/100);
    NSString *tipString = [NSString stringWithFormat:@"%.2f", tipAmount];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    
    NSLog(@"Bill $%.2f at 15 percent is $%@", billAmount, tipString);
}

@end
