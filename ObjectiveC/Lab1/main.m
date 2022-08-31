//
//  main.m
//  Lab1
//
//  Created by Joao Victor Silva Anastacio on 2022-08-30.
//

#import <Foundation/Foundation.h>

NSString *const promptInput = @"Enter a string: ";
NSString *const menuInput = @"Enter an option from the below menu:\n[1] Convert to Uppercase\n[2] Convert to Lowercase\n[3] Numberize your string\n[4] Canadianize your string\n[5] Respond your string\n[6] Space your string\n[q] To quit program";

NSString *getUserInput(int maxLength, NSString *prompt) {
  if (maxLength < 1) {
	maxLength = 255;
  }
	
  NSLog(@"%@", prompt);
  char inputChars[maxLength];
  char *result = fgets(inputChars, maxLength, stdin);
	
  if (result != NULL) {
	return [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  }
  return NULL;
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSString *userInput = getUserInput(255, promptInput);
		
		bool programStillRunning = YES;
		
		while (programStillRunning) {
			NSString *userMenuInput = getUserInput(255, menuInput);
			char *userMenuOption = [userMenuInput UTF8String];
			NSMutableString *defaultMultableString;
			
			switch (userMenuOption[0]) {
				case '1':
					NSLog(@"String in Uppercase: %@", [userInput uppercaseString]);
					continue;
					
				case '2':
					NSLog(@"String in Lowercase: %@", [userInput lowercaseString]);
					continue;
					
				case '3':
					NSLog(@"Numberize");
					continue;
					
				case '4':
					defaultMultableString = [NSMutableString stringWithString:userInput];
					[defaultMultableString appendString: @", eh?"];
					NSLog(@"Canadianized String: %@", defaultMultableString);
					continue;
					
				case '5':
					if ([[userInput substringFromIndex:[userInput length] - 1]  isEqual: @"?"]) {
						NSLog(@"I don't know");
					} else if ([[userInput substringFromIndex:[userInput length] - 1]  isEqual: @"!"]){
						NSLog(@"Whoa, calm down!");
					} else {
						NSLog(@"Neither ? nor ! were identified");
					}
					continue;
					
				case '6':
					defaultMultableString = [NSMutableString stringWithString:userInput];
					[defaultMultableString replaceOccurrencesOfString:@" " withString:@"-" options:0 range:NSMakeRange(0, defaultMultableString.length)];
					NSLog(@"De-Space-It String: %@", defaultMultableString);
					continue;
					
				case 'q':
					NSLog(@"Thank you for using this program");
					programStillRunning = NO;
					break;
					
				default:
					continue;
			}
			
		}
	}
	return 0;
}
