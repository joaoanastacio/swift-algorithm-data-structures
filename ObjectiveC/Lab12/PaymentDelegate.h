//
//  PaymentDelegate.h
//  Lab12
//
//  Created by Joao Victor Silva Anastacio on 2022-09-14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaymentDelegate <NSObject>

- (void) processPaymentAmount: (NSInteger) amount;
- (BOOL) canProcessPayment;

@end

NS_ASSUME_NONNULL_END
