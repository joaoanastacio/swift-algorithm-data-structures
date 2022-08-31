//
//  happy.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-26.
//

import Foundation

// 20 points (none, unsure, happy, sad)

func happyOrSad() -> String {
	
	// Reading Input
	let string = readLine()!
	
	// Defining Controler Variables
	var happyCount = string.components(separatedBy: ":-)").count - 1
	print("Happy Count: \(happyCount)")
	var sadCount = string.components(separatedBy: ":-(").count - 1
	print("Sad Count: \(sadCount)")
	
	if happyCount == 0 && sadCount == 0 {
		return "none"
	} else if happyCount == sadCount {
		return "unsure"
	} else if happyCount > sadCount {
		return "happy"
	} else {
		return "sad"
	}
}
