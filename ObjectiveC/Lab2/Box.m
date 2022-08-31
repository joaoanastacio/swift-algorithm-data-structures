//
//  Box.m
//  Lab2
//
//  Created by Joao Victor Silva Anastacio on 2022-08-31.
//

#import "Box.h"

@interface Box ()

@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger length;

@end

@implementation Box

- (instancetype) initWithHeight: (NSUInteger) height andWidth: (NSUInteger) width andLength: (NSUInteger) length
{
	self = [super init];
	
	if (self) {
		_height = height;
		_width = width;
		_length = length;
	}
	return self;
}

- (NSUInteger) calculateVolume {
	return (self.length * self.width * self.height);
}

- (NSUInteger) timesFitInside: (Box *) box {
	NSUInteger lengthCalc = self.length / box.length;
	NSUInteger widthCalc = self.width / box.width;
	NSUInteger heightCalc = self.height / box.height;
	return (lengthCalc * widthCalc * heightCalc);
}

@end
