//
//  ViewController.m
//  Calculator
//
//  Created by Rockstar. on 3/9/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsEnteringNumber;
@property (nonatomic) CalculatorModel *model;

@end

@implementation ViewController
float calcNumberFirst;
float calcNumberSecond;
float calculation;
double result;
int operationType;

- (CalculatorModel *)model {
    if (!_model) _model = [[CalculatorModel alloc] init];
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Actions

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    if (_userIsEnteringNumber) {
        self.calculatorLabel.text = [self.calculatorLabel.text stringByAppendingString:digit];
    } else {
        self.calculatorLabel.text = digit;
        _userIsEnteringNumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender {

    if (_userIsEnteringNumber) [self onEqualsPressed];
    double result = [_model performCalculation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.calculatorLabel.text = resultString;
    

}

- (IBAction)onEqualsPressed {

    [_model pushOperand:[self.calculatorLabel.text doubleValue]];
    _userIsEnteringNumber = NO;
}

- (IBAction)onResetPressed:(id)sender {
    _operation = @"0";
    result = 0.0;
    operationType = -1;
    [self.calculatorLabel setText:_operation];

}



-(void)addNumber:(int)number{
    if (_operation == NULL) {
        _operation = @"0";
    }

    if (number > -1) {
        _operation = [NSString stringWithFormat:@"%1$@%2$d", _operation, number];
    } else if ([_operation length] > 0) {
        _operation = [_operation substringToIndex:[self.operation length] -1];
    }

    if ([_operation length] <= 0) {
        _operation = @"";
    }

    [self.calculatorLabel setText:_operation];
}

- (void)addDot {
    _operation = [NSString stringWithFormat:@"%1$@.", _operation];
    [self.calculatorLabel setText:_operation];
}


@end
