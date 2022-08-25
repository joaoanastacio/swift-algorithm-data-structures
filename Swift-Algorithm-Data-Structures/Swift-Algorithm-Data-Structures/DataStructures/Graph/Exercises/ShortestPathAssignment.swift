//
//  ShortestPathAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-24.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
	var adjacencyList = [[(vertice: Int, weight: Int)]](repeating: [(Int, Int)](), count: n)
	var dist = [Int](repeating: Int.max, count: n)
	dist[k - 1] = 0
	
	for time in times {
		let sourceNode = time[0] - 1
		let targetNode = time[1] - 1
		let nodeWeight = time[2]
		adjacencyList[sourceNode].append((vertice: targetNode, weight: nodeWeight))
	}
	
	var queue = Queue<(weight: Int, targetNode: Int)>()
	queue.enqueue(item: (0, k - 1))
	
	var checked = Set<Int>()
	
	while !queue.isEmpty() {
		let count = queue.count
		
		for _ in 0..<count {
			let (weight, targetNode) = queue.dequeue()!
			checked.insert(targetNode)
			
			for nextNode in adjacencyList[targetNode] {
				let nextWeight = weight + nextNode.weight
				
				if !checked.contains(nextNode.vertice) && nextWeight < dist[nextNode.vertice] {
					dist[nextNode.vertice] = nextWeight
					queue.enqueue(item: (nextWeight, nextNode.vertice))
				}
			}
		}
	}
	
	if checked.count != n {
		return -1
	}
	return dist.max() ?? -1
}

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
	var dist = [Int](repeating: Int.max, count: n)
	dist[src] = 0
	
	for _ in 0...k {
		var currentDist = dist
		
		for flight in flights {
			let from = flight[0]
			let to = flight[1]
			let price = flight[2]
			
			if dist[from] != Int.max && dist[from] + price < currentDist[to] {
				currentDist[to] = dist[from] + price
			}
		}
		dist = currentDist
	}
	return dist[dst] == Int.max ? -1 : dist[dst]
}

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
	var dist = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
	
	for edge in edges {
		let start = edge[0]
		let end = edge[1]
		let weight = edge[2]
		
		dist[start][end] = weight
		dist[end][start] = weight
	}
	
	for node in 0..<n {
		dist[node][node] = 0
	}
	
	for i in 0..<n {
		for j in 0..<n {
			for k in 0..<n {
				if dist[j][i] + dist[i][k] < dist[j][k] {
					dist[j][k] = dist[j][i] + dist[i][k]
				}
			}
		}
	}
	
	var result = -1
	var minValue = Int.max

	for (j, distList) in dist.enumerated() {
		var cnt = 0
				
		for (i, x) in distList.enumerated() {
			if i != j {
				if x <= distanceThreshold {
					cnt += 1
				}
			}
		}
				
		if minValue >= cnt {
			minValue = cnt
			result = j
		}
	}
	
	return result
}

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
	var edgesManager = [Double](repeating: 0.0, count: n)
	edgesManager[start] = 1
	
	while true {
		var k = false
		
		for i in 0..<edges.count {
			if edgesManager[edges[i][0]] * succProb[i] > edgesManager[edges[i][1]] {
				edgesManager[edges[i][1]] = edgesManager[edges[i][0]] * succProb[i]
				k = true
			}
			
			if edgesManager[edges[i][1]] * succProb[i] > edgesManager[edges[i][0]] {
				edgesManager[edges[i][0]] = edgesManager[edges[i][1]] * succProb[i]
				k = true
			}
		}
		
		if k == false {
			break
		}
	}
	return edgesManager[end]
}

func minimumEffortPath(_ heights: [[Int]]) -> Int {
	return 0
}
