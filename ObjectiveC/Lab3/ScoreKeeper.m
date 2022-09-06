//
//  ScoreKeeper.m
//  Lab3
//
//  Created by Joao Victor Silva Anastacio on 2022-09-04.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

-(instancetype) init {
	self = [super init];
	if (self) {
		_right = 0;
		_wrong = 0;
	}
	
	return self;
}

- (NSInteger) culcTotalRound {
	return _right + _wrong;
}
@end
