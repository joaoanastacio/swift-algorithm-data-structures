//
//  InsertionSort.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

// Time Complexity: O(n^2)
// Space Complexity: O(n)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 1..<elements.count {
	var j = i
	let toInsert = elements[j]
	while j > 0 && comparator(toInsert, elements[j - 1]) {
	  // shift
	  elements[j] = elements[j - 1]
	  j -= 1
	}
	elements[j] = toInsert
  }
  
  return elements
}
