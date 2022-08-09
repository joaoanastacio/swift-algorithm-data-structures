//
//  SelectionSort.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

// Time Complexity: O(n^2)
// Space Complexity: O(n)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 0..<elements.count - 1 {
	var indexMin = i
	for j in i+1..<elements.count {
	  if comparator(elements[j], elements[indexMin]) {
		indexMin = j
	  }
	}
	if i != indexMin {
	  elements.swapAt(indexMin, i)
	}
  }
  return elements
}
