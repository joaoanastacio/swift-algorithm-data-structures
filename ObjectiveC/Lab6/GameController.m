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

@end
