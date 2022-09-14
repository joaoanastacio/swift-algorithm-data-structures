//
//  ApplePaymentService.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (void) processPaymentAmount: (NSInteger) amount {
	NSLog(@"Payment of $%ld processed using Apple Pay." , amount);
}

- (BOOL) canProcessPayment {
	return arc4random_uniform(2);
}

@end
