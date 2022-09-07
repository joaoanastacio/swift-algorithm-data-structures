//
//  main.m
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"


NSString *const menuPrompt = @"\nWhat would you like to do next?\n[roll] - Roll your dices\n[list] - List all contacts\n";

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		InputCollector *inputCollector = [[InputCollector alloc] init];
		
		BOOL isProgramRunning = YES;
		
		while (isProgramRunning) {
			NSString *userInput = [inputCollector inputForPrompt: menuPrompt];
			
			if ([userInput isEqualToString: @"roll"]) {
				Dice *dice1 = [[Dice alloc] init];
				NSLog(@"Dice 1: %lu", dice1.diceCurrentValue);
				
				Dice *dice2 = [[Dice alloc] init];
				NSLog(@"Dice 2: %lu", dice2.diceCurrentValue);

				Dice *dice3 = [[Dice alloc] init];
				NSLog(@"Dice 3: %lu", dice3.diceCurrentValue);

				Dice *dice4 = [[Dice alloc] init];
				NSLog(@"Dice 4: %lu", dice4.diceCurrentValue);

				Dice *dice5 = [[Dice alloc] init];
				NSLog(@"Dice 5: %lu", dice5.diceCurrentValue);
				
				continue;
			}
			
			if ([userInput isEqualToString: @"quit"]) {
				isProgramRunning = NO;
			}
		}
	}
}
