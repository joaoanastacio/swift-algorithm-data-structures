//
//  LinearSearching.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

/// Linear Search Algorithm - O(N)
/// Returns the index of the given target value from the collection. Otherwise, nil.
/// - Parameters:
///   - collection: an array of equatable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
	return index
  }
  return nil
}
