//
//  CalculatorModel.m
//  Calculator
//
//  Created by Rockstar. on 3/9/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel ()
@property (nonatomic) NSMutableArray *model;

@end

@implementation CalculatorModel

- (NSMutableArray *)model {
    if (_model == nil) _model = [[NSMutableArray alloc] init];
    return _model;
}

- (void)pushOperand:(double)operand {
    [_model addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performCalculation:(NSString *)calculation {
    [_model addObject:calculation];
    return [CalculatorModel calculate:self.calculation];

}

- (id)calculation {
    return [_model copy];
}

+ (double)popCalc: (NSMutableArray *)stack {
    double result = 0;

    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];

    if ([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        if ([operation isEqualToString:@"+"]) {
            result = [self popCalc:stack] + [self popCalc:stack];
        } else if ([@"*" isEqualToString:operation]) {
            result = [self popCalc:stack] * [self popCalc:stack];
        } else if ([@"-" isEqualToString:operation]) {
            double substract = [self popCalc:stack];
            result = [self popCalc:stack] - substract;
        } else if ([@"/" isEqualToString:operation]) {
            double divisor = [self popCalc:stack];
            if (divisor) result = [self popCalc:stack] / divisor;
        }
    }
    return result;
}


+ (double)calculate:(id)calc {
    NSMutableArray *stack;
    if ([calc isKindOfClass:[NSArray class]]) {
        stack = [calc mutableCopy];
    }
    return [self popCalc: stack];
}

@end
