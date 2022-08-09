//
//  BinarySearching.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

/// Binary Search Algorithm (for sorted collections) - O(lg N)
/// the index of the given target value from the collection. Otherwise, nil.
/// - Parameters:
///   - collection: an array of comparable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
  var lower = 0
  var upper = collection.count - 1
  while lower <= upper {
	let mid = (lower + upper) / 2
	if collection[mid] == target {
	  return mid
	} else if collection[mid] < target {
	  lower = mid + 1
	} else {
	  upper = mid - 1
	  
	}
  }
  return nil
}
