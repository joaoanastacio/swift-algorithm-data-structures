//
//  AmazonPaymentService.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import "AmazonPaymentService.h"

@implementation AmazonPaymentService

- (void) processPaymentAmount: (NSInteger) amount {
	NSLog(@"Payment of $%ld processed using Amazon Payments." , amount);
}

- (BOOL) canProcessPayment {
	return arc4random_uniform(2);
}

@end
