//
//  MinimumCostFlowAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-22.
//

import Foundation

func minimumCostFlow() -> Int {
	let firstLineReader = readLine()!.split(separator: " ").map { Int($0)! }
	
	let n = firstLineReader[0]
	let m = firstLineReader[1]
	let d = firstLineReader[2]
	var adjacencyList = [[Int]]()
	
	for _ in 1...m {
		let adjacencyLine = readLine()!.split(separator: " ").map { Int($0)! }
		adjacencyList.append([adjacencyLine[0], adjacencyLine[1], adjacencyLine[2]])
	}
	
	return minimumCostFlowHelper(n: n, m: m, d: d, adjacencyList: adjacencyList)
}

fileprivate func minimumCostFlowHelper(n: Int, m: Int, d: Int, adjacencyList: [[Int]]) -> Int {
	
	func dfs(start: Int, target: Int, adjacencyList: [[(v:Int, c:Int)]], res: inout [(p:Int, q:Int, c:Int)], visited: inout [Bool]) {
		visited[start] = true
		
		for vertice in adjacencyList[start] {
			if visited[vertice.v] {
				continue
			}
			
			res.append((start, vertice.v, vertice.c))
			
			if vertice.v == target {
				return
			}
			
			dfs(start: vertice.v, target: target, adjacencyList: adjacencyList, res: &res, visited: &visited)
			
			guard res.last!.q != target || res.last!.p != target else {
				return
			}
			_ = res.popLast()
		}
	}
	
	func disconnectEdge(p: Int, q: Int, adjacencyList: inout [[(v:Int, c:Int)]]) {
		for (i, edge) in adjacencyList[p].enumerated() {
			if edge.v == q {
				adjacencyList[p].remove(at: i)
				break
			}
		}
		
		for (j, edge) in adjacencyList[q].enumerated() {
			if edge.v == p {
				adjacencyList[q].remove(at: j)
				break
			}
		}
	}
	
	func connectEdge(p: Int, q: Int, c: Int, adjacencyList: inout [[(v:Int, c:Int)]]) {
		adjacencyList[p].append((q, c))
		adjacencyList[q].append((p, c))
	}
	
	var finalAdjacencyList = [[(v:Int, c:Int)]].init(repeating: [], count: n + 1)
	var addEdges = [(p:Int, q:Int, c:Int)]()
	
	for i in 0..<m {
		let p = adjacencyList[i][0]
		let q = adjacencyList[i][1]
		let c = adjacencyList[i][2]
		
		if i < n - 1 {
			finalAdjacencyList[p].append((q, c))
			finalAdjacencyList[q].append((p, c))
		} else {
			addEdges.append((p, q, c))
		}
	}
	
	var countDays = 0
	var isUsedEnhancer = false
	
	for addEdge in addEdges {
		var visited = [Bool].init(repeating: false, count: n + 1)
		var route = [(p:Int, q:Int, c:Int)]()
		dfs(start: addEdge.p, target: addEdge.q, adjacencyList: finalAdjacencyList, res: &route, visited: &visited)
		
		var maxCostEdge = route.first!
		for vc in route {
			if maxCostEdge.c < vc.c {
				maxCostEdge = vc
			}
		}
		
		if maxCostEdge.c < addEdge.c {
			continue
		}
		
		if !isUsedEnhancer {
			let deduction = maxCostEdge.c < d ? maxCostEdge.c : d
			if maxCostEdge.c - deduction <= addEdge.c {
				isUsedEnhancer = true
				continue
			}
		}
		
		disconnectEdge(p: maxCostEdge.p, q: maxCostEdge.q, adjacencyList: &finalAdjacencyList)
		connectEdge(p: addEdge.p, q: addEdge.q, c: addEdge.c, adjacencyList: &finalAdjacencyList)
		countDays += 1
	}
	
	return countDays
}
