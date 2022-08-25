//
//  TreeAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-23.
//

import Foundation

/**
TEST CASES
 
 Sample Input1
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 
 Sample Output1
 4
 6
 1
 3
 1
 4

 Sample Input2
 12
 1 2
 1 3
 2 4
 3 5
 3 6
 4 7
 4 8
 5 9
 5 10
 6 11
 6 12

 Sample Output2
 1
 1
 2
 3
 3
 4
 4
 5
 5
 6
 6
 */
func whoIsMyParent() {
	let n = Int(readLine()!)!
	  var adj = [[Int]](repeating: [], count: n + 1)
	  var visited = [Bool](repeating: false, count: n + 1)
	  var parent = [Int](repeating: 0, count: n + 1)
	  
	  for _ in 0..<n-1 {
		let edge = readLine()!.split(separator: " ").map { Int($0)! }
		let u = edge[0]
		let v = edge[1]
		adj[u].append(v)
		adj[v].append(u)
	  }
	  
	  let q = Queue<Int>()
	  q.enqueue(item: 1)  // root
	  visited[1] = true
	  while !q.isEmpty() {
		let u = q.dequeue()!
		for v in adj[u] {
		  if !visited[v] {
			visited[v] = true
			parent[v] = u
			q.enqueue(item: v)
		  }
		}
	  }
	  
	  for i in 2...n {
		print(parent[i])
	  }
}

/**
 TEST CASES
 
 5
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1

 Sample Output1
 11

 Sample Input2
 8
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 6 2 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1
 6 3 2 7 4 -1
 7 6 4 8 5 -1
 8 7 5 -1

 Sample Output2
 20
 */
func diameterOfTree() {
	struct Edge {
		let to: Int
		let distance: Int
	}
	  
	func bfs(node: Int, visited: inout [Bool], distances: inout [Int], adj: inout [[Edge]]) {
		let q = Queue<Int>()
		visited[node] = true
		q.enqueue(item: node)
		while !q.isEmpty() {
		  let x = q.dequeue()!
		  for i in 0..<adj[x].count {
			let edge = adj[x][i]
			if !visited[edge.to] {
			  distances[edge.to] = distances[x] + edge.distance
			  q.enqueue(item: edge.to)
			  visited[edge.to] = true
			}
		  }
		}
	}
	  
	func calcDiameter() {
		let n = Int(readLine()!)!
		var adj = [[Edge]](repeating: [], count: n + 1)
		var visited = [Bool](repeating: false, count: n + 1)
		var distances = [Int](repeating: 0, count: n + 1)
		
		for _ in 1...n {
		  let line = readLine()!.split(separator: " ").map { Int($0)! }
		  let from = line[0]
		  var j = 1
		  while j < line.count - 2 {
			let to = line[j]
			let dist = line[j + 1]
			adj[from].append(Edge(to: to, distance: dist))
			if line[j + 2] == -1 {
			  break
			}
			j += 2
		  }
		}
		var start = 1
		bfs(node: start, visited: &visited, distances: &distances, adj: &adj)
		for i in 2...n {
		  if distances[i] > distances[start] {
			start = i
		  }
		}
		
		var visited2 = [Bool](repeating: false, count: n + 1)
		var distances2 = [Int](repeating: 0, count: n + 1)
		bfs(node: start, visited: &visited2, distances: &distances2, adj: &adj)
		print(distances2.max()!) // O(n)
	  }
	  calcDiameter()
}
