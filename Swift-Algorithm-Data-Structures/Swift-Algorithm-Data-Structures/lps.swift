//
//  lps.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-26.
//

import Foundation

// 30 points
func palindromeLength() -> Int {
	
	// Reading Initial String
	let string = readLine()!
	
	if string.count <= 1 {
		return string.count
	}
	
	// Parsing String to Char Array
	let splittedString = Array(string)
	
	// Defining controller for logic
	var maxLengthControl = 0, startIndexControl = 0
	
	for i in 0..<splittedString.count {
		palindromeBoundSearch(splittedString, i, i, &startIndexControl, &maxLengthControl)
		palindromeBoundSearch(splittedString, i, i + 1, &startIndexControl, &maxLengthControl)
	}

	return String(splittedString[startIndexControl..<(startIndexControl + maxLengthControl)]).count
}

private func palindromeBoundSearch(_ splittedString: [Character], _ leftBound: Int, _ rightBound: Int, _ startIndexControl: inout Int, _ maxLengthControl: inout Int) -> Void {
	// Parse Left and Right bound for var (Impossible to manipulate it as a let)
	var leftBound = leftBound
	var rightBound = rightBound
	
	while leftBound >= 0 && rightBound < splittedString.count && splittedString[leftBound] == splittedString[rightBound] {
		leftBound = leftBound - 1
		rightBound = rightBound + 1
	}
	
	if maxLengthControl < (rightBound - leftBound) - 1 {
		startIndexControl = leftBound + 1
		maxLengthControl = (rightBound - leftBound) - 1
	}
}


