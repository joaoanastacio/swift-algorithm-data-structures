//
//  GameController.h
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

- (instancetype)initWithDiceArray: (NSMutableArray *) currentDiceArray andHeldDiceCollection: (NSMutableDictionary *) currentHeldDiceCollection;
- (void) holdDice: (NSUInteger *) diceNumber;

@end

NS_ASSUME_NONNULL_END
