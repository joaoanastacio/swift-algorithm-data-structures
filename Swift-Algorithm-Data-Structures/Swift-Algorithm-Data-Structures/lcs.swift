//
//  lcs.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-26.
//

import Foundation

func longestCommonSubsequence() -> Int {
	
	// Reading Input 1
	let s1 = readLine()!
	
	// Reading Input 2
	let s2 = readLine()!
	
	// Parsing Strings to Character Array
	let splittedString1 = Array(s1)
	let splittedString2 = Array(s2)
	
	// Array Mapping
	var arr = [[Int]](repeating: [Int](repeating: 0, count: s2.count+1), count: s1.count+1)
	
	for i in 0..<s1.count {
		for j in 0..<s2.count {
			if splittedString1[i] == splittedString2[j] {
				arr[i + 1][j + 1] = 1 + arr[i][j]
			} else {
				let maxComparison = max(arr[i][j + 1], arr[i + 1][j])
				arr[i + 1][j + 1] = maxComparison
			}
		}
	}
	return arr[s1.count][s2.count]
}
