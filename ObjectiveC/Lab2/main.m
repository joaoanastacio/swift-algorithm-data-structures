//
//  main.m
//  Lab2
//
//  Created by Joao Victor Silva Anastacio on 2022-08-31.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		// Declaring Variables
		NSUInteger height1 = 24.0;
		NSUInteger height2 = 6.0;
		
		NSUInteger width1 = 40.0;
		NSUInteger width2 = 4.0;
		
		NSUInteger length1 = 56.0;
		NSUInteger length2 = 7.0;
	    
		// Initializing a Box
		Box *box1 = [[Box alloc] initWithHeight: (unsigned long) height1 andWidth: (unsigned long) width1  andLength: (unsigned long) length1];
		Box *box2 = [[Box alloc] initWithHeight:(unsigned long) height2 andWidth: (unsigned long)width2 andLength: (unsigned long) length2];
		
		// Calculating the volume of the Box
		NSLog(@"Box 1 Volume: %lu", (unsigned long)[box1 calculateVolume]);
		
		// Checking Box inside Box
		NSLog(@"How many boxes fit in Box 1: %lu", (unsigned long)[box1 timesFitInside: box2]);
	}
	return 0;
}
