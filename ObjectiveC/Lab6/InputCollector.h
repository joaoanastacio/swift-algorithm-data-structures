//
//  InputCollector.h
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

- (NSString*) inputForPrompt: (NSString *) promptString;

@end

NS_ASSUME_NONNULL_END
