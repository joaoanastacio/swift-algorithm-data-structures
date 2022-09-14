//
//  main.m
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSInteger price = arc4random_uniform(901) + 100;
		NSString *const menuPrompt = [NSString stringWithFormat:@"\nThank you for shopping at Acme.com Your total today is $%ld. Please select your payment method: 1: Paypal, 2: Stripe, 3: Amazon\n", price];
		
		InputCollector *inputCollector = [[InputCollector alloc] init];
		PaymentGateway *gateway = [[PaymentGateway alloc] init];
		
		NSString *userInput = [inputCollector inputForPrompt: menuPrompt];

		if([userInput isEqualToString: @"1"]) {
			PaypalPaymentService *paypal = [PaypalPaymentService new];
			gateway.paymentDelegate = paypal;
			[gateway processPaymentAmount: price];
		}
		
		if([userInput isEqualToString: @"2"]) {
			StripePaymentService *stripe = [StripePaymentService new];
			gateway.paymentDelegate = stripe;
			[gateway processPaymentAmount: price];
		}
		
		if([userInput isEqualToString: @"3"]) {
			AmazonPaymentService *amazon = [AmazonPaymentService new];
			gateway.paymentDelegate = amazon;
			[gateway processPaymentAmount: price];
		}
	}
	return 0;
}
