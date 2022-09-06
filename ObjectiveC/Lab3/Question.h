//
//  Question.h
//  Lab3
//
//  Created by Joao Victor Silva Anastacio on 2022-09-04.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property NSInteger rightValue;
@property NSInteger leftValue;

@property NSString *question;
@property (nonatomic) NSInteger answer;

@property NSDate *startTime;
@property NSDate *endTime;

-(NSTimeInterval)answerTime;
- (void) generateQuestions;

@end

NS_ASSUME_NONNULL_END
