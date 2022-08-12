//
//  TopologicalSortAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-10.
//

import Foundation

func courseSchedule(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
	if prerequisites.count == 1 || prerequisites.isEmpty {
		return true
	}
	
	// 2. Map indegree list based on adjacency list
	var adjacencyList = [[Int]](repeating: [], count: numCourses)
	var indegreeList = [Int](repeating: 0, count: numCourses)
	
	for node in prerequisites {
		adjacencyList[node[1]].append(node[0])
		indegreeList[node[0]] += 1
	}
	
	// 3. Topological Sort
	let queue = Queue<Int>()
	for (index, node) in indegreeList.enumerated() {
		if node == 0 {
			queue.enqueue(item: index)
		}
	}
	
	// 4. Applying BFS
	while !queue.isEmpty() {
		let node = queue.dequeue()!
		
		for adjacencyListNode in adjacencyList[node] {
			indegreeList[adjacencyListNode] -= 1
			
			if indegreeList[adjacencyListNode] == 0 {
				queue.enqueue(item: adjacencyListNode)
			}
		}
	}
	
	// Filtering and Validating
	for indegree in indegreeList {
		print("Finally checking indegree list 1: \(indegreeList)")
		if indegree != 0 {
			return false
		}
	}
	print("Finally checking indegree list 2: \(indegreeList)")
	return indegreeList.filter {$0 != 0}.count == 0
}

func courseScheduleII(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
	
	if prerequisites.count == 1 {
		let firstCourse = prerequisites[0][1]
		let secondCourse = prerequisites[0][0]
		return [firstCourse, secondCourse]
	}
	
	// 2. Map indegree list based on adjacency list
	var adjacencyList = [[Int]](repeating: [], count: numCourses)
	var indegreeList = [Int](repeating: 0, count: numCourses)
	var resultList = [Int]()
	
	for node in prerequisites {
		adjacencyList[node[1]].append(node[0])
		indegreeList[node[0]] += 1
	}
	
	// 3. Topological Sort
	let queue = Queue<Int>()
	
	for (index, node) in indegreeList.enumerated() {
		if node == 0 {
			queue.enqueue(item: index)
		}
	}
	
	// 4. Applying BFS
	print("Checking the queue: \(queue)")
	while !queue.isEmpty() {
		let node = queue.dequeue()!
		resultList.append(node)
		
		for adjacencyListNode in adjacencyList[node] {
			indegreeList[adjacencyListNode] -= 1
			
			if indegreeList[adjacencyListNode] == 0 {
				queue.enqueue(item: adjacencyListNode)
			}
		}
	}
	return resultList.count == numCourses ? resultList : []
}
