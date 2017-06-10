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
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;
@property (weak, nonatomic) IBOutlet UIButton *calculateTipButton;

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

- (IBAction)billAmountTextField:(UITextField *)sender
{
    float billAmount = [sender.text floatValue];
    float tip = (billAmount * self.tipSlider.value) / 100;
    
    NSString *tipFormatted = [NSString stringWithFormat:@"%.2f", tip];
    self.tipAmountLabel.text = [@"$" stringByAppendingString:tipFormatted];
}
- (IBAction)calculateTipButton:(UIButton *)sender
{
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmountFloat = [self.tipAmountTextField.text floatValue];
    float tipAmount = (billAmount * tipAmountFloat) / 100;
    NSString *tipString = [NSString stringWithFormat:@"%.2f", tipAmount];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    
    NSLog(@"Bill amount $%.2f at %@%% tip", billAmount, tipString);
}


- (IBAction)tipSlider:(UISlider *)sender
{
    float billAmount = [self.billAmountTextField.text floatValue];
    float tip = (billAmount * sender.value) / 100;
    
    NSString *tipFormatted = [NSString stringWithFormat:@"%.2f", tip];
    self.tipAmountLabel.text = [@"$" stringByAppendingString:tipFormatted];
    self.tipPercentLabel.text = [[NSString stringWithFormat:@"%.2f", sender.value] stringByAppendingString:@"%"];
}

@end
