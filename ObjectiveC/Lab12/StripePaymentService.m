//
//  StripePaymentService.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import "StripePaymentService.h"


@implementation StripePaymentService

- (void) processPaymentAmount: (NSInteger) amount {
	NSLog(@"Payment of $%ld processed using Stripe." , amount);
}

- (BOOL) canProcessPayment {
	return arc4random_uniform(2);
}

@end
