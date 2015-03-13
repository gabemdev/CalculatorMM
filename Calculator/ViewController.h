//
//  ViewController.h
//  Calculator
//
//  Created by Rockstar. on 3/9/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *calculatorLabel;

@property (nonatomic) float firstNumber;
@property (nonatomic) float secondNumber;
@property (nonatomic, copy) NSString *operation;


@end

