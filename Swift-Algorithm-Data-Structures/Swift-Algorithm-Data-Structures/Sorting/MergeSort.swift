//
//  MergeSort.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

// Merge Sort (Divide and Conquer)
// Time Complexity: O(N lgN)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  return merge(sortedLeft, sortedRight, comparator)
}

// O(N)
func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
	guard i < left.count else {
	  merged.append(contentsOf: right[j...])
	  break
	}
	guard j < right.count else {
	  merged.append(contentsOf: left[i...])
	  break
	}
	if comparator(left[i], right[j]) {
	  merged.append(left[i])
	  i += 1
	} else {
	  merged.append(right[j])
	  j += 1
	}
  }
  
  return merged
}
