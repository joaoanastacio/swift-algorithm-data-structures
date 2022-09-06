//
//  main.m
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

NSString *const menuPrompt = @"\n\nWhat would you like to do next?\n[new] - Create a new contact\n[list] - List all contacts\n[quit] - Exit application\n";

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		InputCollector *inputCollector = [[InputCollector alloc] init];
		ContactList *contactList = [[ContactList alloc] init];
		
		bool isApplicationRunning = YES;
		
		while (isApplicationRunning) {
			NSString *userInput = [inputCollector inputForPrompt: menuPrompt];
		
			if([userInput isEqualToString: @"new"]) {
				NSString *contactName = [inputCollector inputForPrompt: @"Enter contact name:"];
				NSString *contactEmail = [inputCollector inputForPrompt: @"Enter contact email:"];
				Contact *contact = [[Contact alloc] initWithName: contactName andEmail: contactEmail];
				[contactList addContact: contact];
				continue;
			}
			
			if([userInput isEqualToString: @"list"]) {
				[contactList listContacts];
				continue;
			}
			
			// TODO: implement contact details
			
			// TODO: implement contact search (find)
			
			// TODO: implement prevent duplicate entries (for email - no duplicated emails)
			
			// TODO: implement multiple phone numbers
			
			// TODO: implement history feature
			
			if([userInput isEqualToString: @"quit"]) {
				NSLog(@"Merci d'utiliser ce programme, à bientôt ! À plus tard.");
				isApplicationRunning = NO;
			}
		}
	}
	return 0;
}
