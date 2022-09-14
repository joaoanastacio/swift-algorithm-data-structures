//
//  PaypalPaymentService.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void) processPaymentAmount: (NSInteger) amount {
	NSLog(@"Payment of $%ld processed using Paypal." , amount);
}

- (BOOL) canProcessPayment {
	return arc4random_uniform(2);
}

@end
