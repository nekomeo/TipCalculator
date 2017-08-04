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
@property (weak, nonatomic) IBOutlet UITextField *tipAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;

@property (nonatomic) float billAmount;
@property (nonatomic) float customTip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tipAmountLabel.text = @"";
    
    self.billAmountTextField.delegate = self;
    self.tipAmountTextField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateTipButton:(UIButton *)sender
{
    [self calculateCustomTip];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        [self.billAmountTextField resignFirstResponder];
    }
    else
    {
        [self.tipAmountTextField resignFirstResponder];
    }
    return YES;
}

- (IBAction)tipSlider:(UISlider *)sender
{
    float billAmount = [self.billAmountTextField.text floatValue];
    float tip = (billAmount * sender.value) / 100;
    
    NSString *tipFormatted = [NSString stringWithFormat:@"%.2f", tip];
    self.tipAmountLabel.text = [@"$" stringByAppendingString:tipFormatted];
    self.tipPercentLabel.text = [[NSString stringWithFormat:@"%.2f", sender.value] stringByAppendingString:@"%"];
}

- (void)calculateTipAtRate:(float)rate
{
    self.billAmount = [self.billAmountTextField.text floatValue];
    
    if (rate == 0) {
        rate = 0.15;
    }
    
    float tipAmount = self.billAmount * rate;
    //    NSLog(@"Tip amount $%.2f", tipAmount);
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.2f", tipAmount];
}

- (void)calculateCustomTip
{
    self.customTip = [self.tipAmountTextField.text floatValue];
    [self calculateTipAtRate:self.customTip/100];
}

@end
