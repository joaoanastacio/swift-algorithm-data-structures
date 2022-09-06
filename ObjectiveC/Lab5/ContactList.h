//
//  ContactList.h
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

- (void) addContact:(Contact *) newContact;
- (void) listContacts;

@end

NS_ASSUME_NONNULL_END
