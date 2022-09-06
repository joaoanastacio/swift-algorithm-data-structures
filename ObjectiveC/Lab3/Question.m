//
//  Question.m
//  Lab3
//
//  Created by Joao Victor Silva Anastacio on 2022-09-04.
//

#import "Question.h"

@implementation Question

- (instancetype)init {
	if (self = [super init]) {
		_leftValue = arc4random_uniform(100) + 10;
		_rightValue = arc4random_uniform(100) + 10;
		_answer = _leftValue + _rightValue;
	}
	return self;
}

-(NSInteger) answer {
	_endTime = [NSDate date];
	return _answer;
}

-(NSTimeInterval)answerTime {
	return (long) ceil([_endTime timeIntervalSinceDate: _startTime]);
}

- (void) generateQuestions {
	
}

@end
