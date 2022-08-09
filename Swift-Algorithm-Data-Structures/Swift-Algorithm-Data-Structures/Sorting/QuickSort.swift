//
//  QuickSort.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
	if arr.count <= 1 {
		return
	}

	if start < end {
		let partition = partition(&arr, start, end)
		quickSort(&arr, start, partition)
		quickSort(&arr, partition + 1, end)
	}
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
	let pivot = arr[start]
	var lower = start - 1
	var upper = end + 1

	while true {
		repeat {
			upper -= 1
		} while arr[upper] > pivot

		repeat {
			lower += 1
		} while arr[lower] < pivot

		if lower < upper {
			arr.swapAt(lower, upper)
		} else {
			return upper
		}
	}
}
