//
//  InputCollector.m
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString*) inputForPrompt: (NSString *) promptString {
	NSLog(@"%@", promptString);
	
	char inputChars[255];
	char *result = fgets(inputChars, 255, stdin);
	
	if (result != NULL) {
		return [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	return NULL;
}

@end
