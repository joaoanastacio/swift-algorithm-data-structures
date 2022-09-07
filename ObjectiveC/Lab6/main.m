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


NSString *const menuPrompt = @"\nWhat would you like to do next?\n[roll] - Roll your dices\n[hold] - Hold a specific dice\n[quit] - Quit the program";

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
				NSUInteger *diceNumber = (NSUInteger) 1;
				[gameController holdDie: diceNumber];
				continue;
			}
			
			// MARK: Quit
			if ([userInput isEqualToString: @"quit"]) {
				isProgramRunning = NO;
			}
		}
	}
}
