//
//  ScoreKeeper.h
//  Lab3
//
//  Created by Joao Victor Silva Anastacio on 2022-09-04.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreKeeper : NSObject

@property NSInteger right;
@property NSInteger wrong;

- (NSInteger) culcTotalRound;

@end

NS_ASSUME_NONNULL_END
