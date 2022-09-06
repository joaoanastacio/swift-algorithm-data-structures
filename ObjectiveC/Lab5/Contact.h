//
//  Contact.h
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;

- (instancetype)initWithName: (NSString *) contactName andEmail: (NSString *) contactEmail;
- (void) printContact;

@end

NS_ASSUME_NONNULL_END
