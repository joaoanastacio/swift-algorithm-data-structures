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

NSString *const menuPrompt = @"\n\nWhat would you like to do next?\n[new] - Create a new contact\n[list] - List all contacts\n[quit] - Exit application\n[show] - Check specific contact details\n[find] - Find specific contact\n";

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
			
			if([userInput isEqualToString: @"show"]) {
				NSString *contactId = [inputCollector inputForPrompt: @"Enter the contact id: "];
				[contactList listContact: contactId];
				continue;
			}
			
			if([userInput isEqualToString: @"find"]) {
				NSString *term = [inputCollector inputForPrompt: @"Enter a term for search: "];
				[contactList listContactsByTerm: term];
				continue;
			}
			
			// TODO: implement history feature
			
			if([userInput isEqualToString: @"quit"]) {
				NSLog(@"Merci d'utiliser ce programme, à bientôt ! À plus tard.");
				isApplicationRunning = NO;
			}
		}
	}
	return 0;
}
