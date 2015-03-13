//
//  CalculatorModel.h
//  Calculator
//
//  Created by Rockstar. on 3/9/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

- (void)pushOperand:(double)operand;
- (double)performCalculation: (NSString *)calculation;

+ (double) calculate:(id)calc;




@end
