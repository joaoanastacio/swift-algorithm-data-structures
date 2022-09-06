//
//  InputCollector.h
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

- (NSString*) inputForPrompt: (NSString *) promptString;
- (void) recordLastCommand: (NSString *) command;
- (void) listThreeLastCommands;

@end

NS_ASSUME_NONNULL_END
