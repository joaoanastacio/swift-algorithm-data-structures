//
//  PaymentGateway.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void) processPaymentAmount: (NSInteger) amount {
	if(![self.paymentDelegate canProcessPayment]){
		NSLog(@"Unable to process the amount, please try again later.");
		return;
	}
	
	[self.paymentDelegate processPaymentAmount:amount];
}

@end
