//
//  UF.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The UF struct represents a union-find (disjoint sets) data structure
/// It supports **union** and **find** operations, along with methods for
/// determining whether two nodes are in the same component and the total
/// number of components.
/// This implementation uses weighted quick union (by size or rank) with
/// full path compression.
/// Initializing a data structure with **n** nodes takes linear time.
/// Afterwards, **union**, **find**, and **connected** take logarithmic time
/// (in the worst case) and **count** takes constant time.
/// Moreover, the amortized time per **union**, **find**, and **connected** operation
/// has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
public struct UF {
	/// parent[i] = parent of i
	private var parent: [Int]
	/// size[i] = number of nodes in tree rooted at i
	private var size: [Int]
	/// number of components
	private(set) var count: Int
	
	/// Initializes an empty union-find data structure with **n** elements
	/// **0** through **n-1**.
	/// Initially, each elements is in its own set.
	/// - Parameter n: the number of elements
	public init(_ n: Int) {
		self.count = n
		self.size = [Int](repeating: 1, count: n)
		self.parent = [Int](repeating: 0, count: n)
		for i in 0..<n {
			self.parent[i] = i
		}
	}
	
	/// Returns the canonical element(root) of the set containing element `p`.
	/// - Parameter p: an element
	/// - Returns: the canonical element of the set containing `p`
	public mutating func find(_ p: Int) -> Int {
		var pReference = p

		while pReference != parent[pReference] {
			parent[pReference] = parent[parent[pReference]]
			pReference = parent[pReference]
		}
		return pReference
	}
	
	/// Returns `true` if the two elements are in the same set.
	/// - Parameters:
	///   - p: one elememt
	///   - q: the other element
	/// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
	public mutating func connected(_ p: Int, _ q: Int) -> Bool {
		return find(p) == find(q)
	}
	
	public mutating func union(_ p: Int, _ q: Int) -> Bool {
		let i = find(p)
		let j = find(q)
		
		if i == j { return false }
		
		if size[i] < size[j] {
			parent[i] = j
			size[j] += size[i]
			return true
		} else {
			parent[j] = i
			size[i] += size[j]
			return true
		}
	}
}

func findCircleNum(_ isConnected: [[Int]]) -> Int {
	if isConnected.isEmpty {
		return 0
	}
	
	var unionFind = UF(isConnected.count)
	
	for connectedRow in 0..<isConnected.count {
		for connectedColumn in connectedRow..<connectedRow+1 {
			if isConnected[connectedRow][connectedColumn] == 1 {
				unionFind.union(connectedRow, connectedColumn)
			}
		}
	}
	var provincesSet: Set<Int> = []
	for index in 0..<isConnected.count {
		provincesSet.insert(unionFind.find(index))
	}
	return provincesSet.count
}

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
	var unionFind = UF(edges.count)
	
	for edge in edges {
		if !unionFind.union(edge[0] - 1, edge[1] - 1) {
			return edge
		}
	}
	return [0]
}

func longestConsecutive(_ nums: [Int]) -> Int {
	if nums.count == 0 {
		return 0
	}
	
	var numSet: Set<Int> = []
	var unionFind = UF(nums.count)
	
	for num in nums {
		if numSet.contains(num) {
			continue
		}

		if numSet.contains(num - 1) {
			unionFind.union(num, num-1)
		}
		
		if numSet.contains(num + 1) {
			unionFind.union(num, num+1)
		}
		numSet.insert(num)
	}
	return min(unionFind.count, numSet.count)
}
