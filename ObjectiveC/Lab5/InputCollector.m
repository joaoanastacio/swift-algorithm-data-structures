//
//  InputCollector.m
//  Lab5
//
//  Created by Joao Victor Silva Anastacio on 2022-09-05.
//

#import "InputCollector.h"

@implementation InputCollector {
	NSMutableArray *_commands;
}

- (instancetype)init {
	if (self = [super init]) {
		_commands = [NSMutableArray new];
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

- (void) recordLastCommand: (NSString *) command {
	[_commands addObject: command];
}

- (void) listThreeLastCommands {
	if ([_commands count] >= 3) {
		NSLog(@"command: %@", _commands[[_commands count] - 3]);
		NSLog(@"command: %@", _commands[[_commands count] - 2]);
		NSLog(@"command: %@", _commands[[_commands count] - 1]);
	}
	
	else if ([_commands count] > 1 && [_commands count] <= 2) {
		NSLog(@"command: %@", _commands[[_commands count] - 2]);
		NSLog(@"command: %@", _commands[[_commands count] - 1]);
	}
	
	else if ([_commands count] == 1) {
		NSLog(@"command: %@", _commands[[_commands count] - 1]);
	}
	
	else {
		NSLog(@"No commands recorded yet");
	}
}

@end
