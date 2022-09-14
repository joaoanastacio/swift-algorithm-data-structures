//
//  GameController.m
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import "GameController.h"

@implementation GameController {
	NSMutableArray *_currentDiceArray;
	NSMutableDictionary *_currentHeldDiceCollection;
}

- (instancetype)initWithDiceArray: (NSMutableArray *) currentDiceArray andHeldDiceCollection: (NSMutableDictionary *) currentHeldDiceCollection {
	if (self == [super init]) {
		_currentDiceArray = currentDiceArray;
		_currentHeldDiceCollection = currentHeldDiceCollection;
	}
	return self;
}

- (void) holdDice: (NSUInteger *) diceNumber {
	NSString *diceNumberParsedString = [NSString stringWithFormat:@"%li", diceNumber];
	
	if (_currentHeldDiceCollection[diceNumberParsedString]) {
		NSString *currentValueForKey = [_currentHeldDiceCollection objectForKey: diceNumberParsedString];
		NSNumber *currentValueAsNumber = [NSNumber numberWithLongLong: currentValueForKey.longLongValue];
		NSUInteger currentValueParsed = currentValueAsNumber.unsignedIntegerValue + 1;
		[_currentHeldDiceCollection setValue: [NSString stringWithFormat: @"%li", currentValueParsed] forKey: diceNumberParsedString];
		
	} else {
		[_currentHeldDiceCollection setValue: @"1" forKey: diceNumberParsedString];
	}
}

- (void) printHeldDice {
	
}

@end
