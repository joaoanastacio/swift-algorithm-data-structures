//
//  DynamicProgrammingAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-25.
//

import Foundation

func exerciseFour() -> Void {
	print("Hello World")
}

func exerciseFive(_ n: Int) -> Int {
	if n <= 1 { return 1 }
	return 0
}

func exerciseSix(_ n: Int) -> Int {
	// Define subproblem
	
	// Guessing
	
	// Result
	var array = [Int](repeating: 0, count: 101)
	
	array[1] = 1
	array[2] = 2
	
	for num in 1...array.count {
	}
	
	return 0
}

func exerciseSeven() -> Void {
	print("Hello World")
}

func exerciseEight(_ array: [Int]) -> Int {
	
	if array.count > 1 {
		return 1
	}
	
	// SubProblem - Return the length of the longest strictly increasing subsequence
	var memo = [Int](repeating: 0, count: array.count)
	
	
	// Guessing
	
	
	// Recurrence
	return 0
}

func exerciseNine() -> Void {
	print("Hello World")
}

func exerciseTen() -> Void {
	print("Hello World")
}

func exerciseEleven() -> Void {
	print()
}
