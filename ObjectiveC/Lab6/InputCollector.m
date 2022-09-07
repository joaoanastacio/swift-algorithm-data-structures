//
//  InputCollector.m
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init {
	if (self == [super init]) {
		// Do something here
	}
	return self;
}

- (NSString*) inputForPrompt: (NSString *) promptString {
	NSLog(@"%@", promptString);
	
	char inputChars[255];
	char *result = fgets(inputChars, 255, stdin);
	
	if (result != NULL) {
		return [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	return NULL;
}

@end
