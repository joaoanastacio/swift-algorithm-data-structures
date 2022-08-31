//
//  Box.h
//  Lab2
//
//  Created by Joao Victor Silva Anastacio on 2022-08-31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

- (instancetype) initWithHeight: (NSUInteger) height andWidth: (NSUInteger) width andLength: (NSUInteger) length;
- (NSUInteger) calculateVolume;
- (NSUInteger) timesFitInside: (Box *) box;

@end

NS_ASSUME_NONNULL_END
