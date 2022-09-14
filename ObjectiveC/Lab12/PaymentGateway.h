//
//  PaymentGateway.h
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import <Foundation/Foundation.h>
#import "PaymentDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentGateway : NSObject

@property (nonatomic, weak) id<PaymentDelegate> paymentDelegate;

- (void) processPaymentAmount: (NSInteger) amount;

@end

NS_ASSUME_NONNULL_END
