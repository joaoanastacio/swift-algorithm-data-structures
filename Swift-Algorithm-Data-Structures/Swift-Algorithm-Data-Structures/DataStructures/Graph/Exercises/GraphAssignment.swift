//
//  GraphAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

func cyclicPermutation() {
	let testCasesNumber = Int(readLine()!)!
	var caseCounter = 0
	
	while caseCounter < testCasesNumber {
		
		let permutationSize = Int(readLine()!)!
		let permutation = readLine()!.split(separator: " ")
		
		var adjacencyList = [[Int]](repeating: [], count: permutationSize + 1)
		
		for index in 0..<permutationSize {
			let u = index + 1
			let v = Int(permutation[u - 1])!
			adjacencyList[u].append(v)
		}
		
		func dfs(start: Int, adjacencyList: inout [[Int]], visited: inout [Bool]) {
			visited[start] = true
			
			for vertice in adjacencyList[start] {
				if !visited[vertice] {
					dfs(start: vertice, adjacencyList: &adjacencyList, visited: &visited)
				}
			}
		}
		
		var count = 0
		var visited = [Bool](repeating: false, count: permutationSize + 1)
		
		for vertice in 1..<adjacencyList.count {
			if !visited[vertice] {
				dfs(start: vertice, adjacencyList: &adjacencyList, visited: &visited)
				count += 1
			}
		}
		print("Result: ", count)
		caseCounter += 1
	}
}

func repeatingSequence() {
	func next(A: Int, P: Int) -> Int {
	  return
		String(A)
		  .compactMap { power(base: Int(String($0))!, exponent: P) }
		  .reduce(0, +)
	}
	
	func length(A: Int, P: Int, seq: Int, check: inout [Int]) -> Int {
	  if check[A] != 0 {
		return check[A] - 1
	  }
	  check[A] = seq
	  let nx = next(A: A, P: P)
	  return length(A: nx, P: P, seq: seq + 1, check: &check)
	}
	
	var check = [Int](repeating: 0, count: 1_000_000)
	
	let input = readLine()!.split(separator: " ").map { Int($0)! }
	
	let A = input[0]
	let P = input[1]
	
	print(length(A: A, P: P, seq: 1, check: &check))
}

func findTownJudge(_ n: Int, _ trust: [[Int]]) -> Int {
	var adjacencyList = [[Int]](repeating: [], count: n + 1)
	
	for person in trust {
		let personFirstIndex = person.first!
		let personLastIndex = person.last!
		adjacencyList[personFirstIndex].append(personLastIndex)
	}
	
	var possibleJudge = -1
	
	for node in 1...n {
		if adjacencyList[node].count == 0 {
			possibleJudge = node
			break
		}
	}
	
	if possibleJudge == -1 {
		return -1
	}
	
	for (node, row) in adjacencyList.enumerated() {
		if node == possibleJudge || node == 0 {
			continue
		}
		
		if !row.contains(possibleJudge) {
			return -1
		}
	}
	return possibleJudge
}

func numberOfProvinces(_ isConnected: [[Int]]) -> Int {
	var numberOfProvinces = 0;
	var visited = [Bool](repeating: false, count: isConnected.count)
	
	for index in 0..<isConnected.count {
		if visited[index] == false {
			dfs(adjacencyList: isConnected, visitedArray: visited, start: index)
			numberOfProvinces += 1
		}
	}
	
	func dfs(adjacencyList: [[Int]], visitedArray: [Bool], start: Int) {
		for i in 0..<adjacencyList.count {
			if visited[i] == false && adjacencyList[start][i] == 1 {
				visited[i] = true
				dfs(adjacencyList: adjacencyList, visitedArray: visitedArray, start: start)
			}
		}
	}
	
	return numberOfProvinces
}

func findCenterOfStarGraph(_ edges: [[Int]]) -> Int {
	if edges[0][0] == edges[1][1] || edges[0][0] == edges[1][0] {
	  return edges[0][0]
	} else {
	  return edges[0][1]
	}
}
