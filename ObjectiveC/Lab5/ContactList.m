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
	// TODO: implement multiple phone numbers
	if([_contacts count] >= 1) {
		for (int i = 0; i < [_contacts count]; i++) {
			Contact *currentContact = _contacts[i];
			NSLog(@"Current contact: %@", currentContact);
			
			if([currentContact.email isEqualToString: newContact.email]) {
				NSLog(@"The email provided is already in use, please try again with another email.");
			} else {
				[_contacts addObject: newContact];
			}
		}
	} else {
		[_contacts addObject: newContact];
	}
}

- (void) listContact: (NSString *) contactId {
	NSInteger idParsed = [contactId integerValue];
	
	if(idParsed <= [_contacts count] && _contacts[idParsed] != NULL) {
		Contact *currentContact = _contacts[idParsed];
		NSLog(@"%ld: <%@> (email= %@)", (long) idParsed, currentContact.name, currentContact.email);
	} else {
		NSLog(@"Contact doesn't exists");
	}
}

- (void) listContactsByTerm: (NSString *) term {
	for (int i = 0; i < [_contacts count]; i++) {
		Contact *currentContact = _contacts[i];
		
		if([currentContact.name rangeOfString: term].location == 0 || [currentContact.email rangeOfString: term].location == 0) {
			NSLog(@"%d: <%@> (email= %@)", i, currentContact.name, currentContact.email);
		} else {
			NSLog(@"No contacts found using the given term");
		}
	}
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
