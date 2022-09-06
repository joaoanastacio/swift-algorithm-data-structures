//
//  ContactList.m
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList {
	NSMutableArray *_contacts;
}

- (instancetype)init {
	if (self = [super init]) {
		_contacts = [NSMutableArray new];
	}
	return self;
}

- (void) addContact:(Contact *) newContact {
	[_contacts addObject: newContact];
}

- (void) listContacts {
	if ([_contacts count] == 0) {
		NSLog(@"No existing contacts in the list");
	} else {
		for (int i = 0; i < [_contacts count]; i++) {
			Contact *currentContact = _contacts[i];
			NSLog(@"%d: <%@> (email= %@)", i, currentContact.name, currentContact.email);
		}
	}
}

@end
