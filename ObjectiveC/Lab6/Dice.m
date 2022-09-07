//
//  Dice.m
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init {
	if(self == [super init]) {
		_diceCurrentValue = self.randomizeDiceValue;
	}
	return self;
}

- (NSUInteger) randomizeDiceValue {
	NSUInteger lowerBound = 1;
	NSUInteger upperBound = 6;
	return (NSUInteger) (lowerBound + arc4random_uniform(upperBound - lowerBound + 1));
}

@end
