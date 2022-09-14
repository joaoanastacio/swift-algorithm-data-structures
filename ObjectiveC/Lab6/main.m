//
//  main.m
//  Lab6
//
//  Created by Joao Victor Silva Anastacio on 2022-09-06.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"
#import "GameController.h"


NSString *const menuPrompt = @"\nWhat would you like to do next?\n[roll] - Roll your dices\n[hold] - Hold a specific dice\n[reset] - Un-hold all dice\n[display] - Show current stats\n[done] - Quit the program";
NSString *const holdPrompt = @"\nEnter the number of the die:\n";

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		InputCollector *inputCollector = [[InputCollector alloc] init];
		NSMutableArray *currentDiceArray = [NSMutableArray new];
		NSMutableDictionary *heldDiceCollection = [NSMutableDictionary new];
		GameController *gameController = [[GameController alloc] initWithDiceArray: currentDiceArray andHeldDiceCollection: heldDiceCollection];
		
		BOOL isProgramRunning = YES;
		
		while (isProgramRunning) {
			NSString *userInput = [inputCollector inputForPrompt: menuPrompt];
			
			// MARK: Roll
			if ([userInput isEqualToString: @"roll"]) {
				Dice *dice1 = [[Dice alloc] init];
				[currentDiceArray addObject: dice1];
				
				Dice *dice2 = [[Dice alloc] init];
				[currentDiceArray addObject: dice2];

				Dice *dice3 = [[Dice alloc] init];
				[currentDiceArray addObject: dice3];

				Dice *dice4 = [[Dice alloc] init];
				[currentDiceArray addObject: dice4];

				Dice *dice5 = [[Dice alloc] init];
				[currentDiceArray addObject: dice5];
				
				continue;
			}
			
			// MARK: Hold
			if ([userInput isEqualToString: @"hold"]) {
				NSString *userHoldInput = [inputCollector inputForPrompt: holdPrompt];
				NSUInteger *diceNumber = (NSUInteger) [userHoldInput intValue];
				[gameController holdDice: diceNumber];
				continue;
			}
			
			// MARK: Reset
			if ([userInput isEqualToString: @"reset"]) {
				NSLog(@"Inside Reset");
				continue;
			}
			
			// MARK: Display
			if ([userInput isEqualToString: @"display"]) {
				NSLog(@"Inside Display");
				continue;
			}
			
			// MARK: Done
			if ([userInput isEqualToString: @"done"]) {
				isProgramRunning = NO;
			}
		}
	}
}
