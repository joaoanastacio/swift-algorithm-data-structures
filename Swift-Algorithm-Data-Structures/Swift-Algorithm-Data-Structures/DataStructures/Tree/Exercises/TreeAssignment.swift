//
//  TreeAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-23.
//

import Foundation

/**
TEST CASES
 
 Sample Input1
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 
 Sample Output1
 4
 6
 1
 3
 1
 4

 Sample Input2
 12
 1 2
 1 3
 2 4
 3 5
 3 6
 4 7
 4 8
 5 9
 5 10
 6 11
 6 12

 Sample Output2
 1
 1
 2
 3
 3
 4
 4
 5
 5
 6
 6
 */
func whoIsMyParent() {
	print("Who's my parent?")
	
}

/**
 TEST CASES
 
 5
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1

 Sample Output1
 11

 Sample Input2
 8
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 6 2 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1
 6 3 2 7 4 -1
 7 6 4 8 5 -1
 8 7 5 -1

 Sample Output2
 20
 */
func diameterOfTree() {
	print("Diameter of the tree")
}

// Sub-problem
// d[n] = possible ways to fill up the 2xN tiles

// Guessing
// d[1] = 1
// d[2] = 2

// d[n] = d[n - 1] + d[n - 2]
