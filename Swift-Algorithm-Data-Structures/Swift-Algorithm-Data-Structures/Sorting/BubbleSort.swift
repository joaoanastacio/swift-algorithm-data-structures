//
//  BubbleSort.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

// Time Complexity: O(n^2)
// Space Complexity: O(n)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
	for j in 1..<elements.count - i {
	  if comparator(elements[j], elements[j - 1]) {
		let temp = elements[j - 1]
		elements[j - 1] = elements[j]
		elements[j] = temp
	  }
	}
  }
  return elements
}
