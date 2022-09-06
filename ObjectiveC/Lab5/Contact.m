//
//  Contact.m
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName: (NSString *) contactName andEmail: (NSString *) contactEmail {
	if (self = [super init]) {
		_name = contactName;
		_email = contactEmail;
	}
	return self;
}

- (void) printContact {
  NSLog(@"Contact Name: %@, Contact Email: %@", _name, _email);
}

@end
