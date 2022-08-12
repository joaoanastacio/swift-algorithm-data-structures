//
//  FloodFillAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-09.
//

import Foundation

/*
 Next N lines: 0s and 1s where 0(unripe tomatoes), 1(ripe tomatoes), -1(no tomatoes)

 Output Specification
 The minimum days. (O if already ripe, -1 if there’s no way to get all ripe tomatoes)
 */
func daysToRipen() -> Void {
	
	struct Square {
		let x: Int
		let y: Int
	}
	
	let directionsX = [0, 0, 1, -1]
	let directionsY = [1, -1, 0, 0]
	
	var tomatoBoxMap = [[Int]]()
	
	let firstLine = readLine()!.split(separator: " ")
	
	let m = Int(firstLine[0])!
	let n = Int(firstLine[1])!
	
	var adjacencyMatrix = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
	
	for _ in 0..<n {
		let row = readLine()!.map { Int(String($0))! }
		tomatoBoxMap.append(row)
	}
	
	func bfs(x: Int, y: Int, identifier: Int) {
		let queue = Queue<Square>()
		queue.enqueue(item: Square(x: x, y: y))
		adjacencyMatrix[x][y] = identifier
		
		while !queue.isEmpty() {
			let lastSquare = queue.dequeue()!
			let x = lastSquare.x
			let y = lastSquare.y
			
			for index in 0..<4 {
				let nextXElement = x + directionsX[index]
				let nextYElement = y + directionsY[index]
				
				if nextXElement >= 0 && nextXElement < n && nextYElement >= 0 && nextYElement < n {
					if tomatoBoxMap[nextXElement][nextYElement] == 1 && adjacencyMatrix[nextXElement][nextYElement] == 0 {
						queue.enqueue(item: Square(x: nextXElement, y: nextYElement))
						adjacencyMatrix[nextXElement][nextYElement] = identifier
					}
				}
			}
			
		}
	}
	
	var identifier = 0
	for x in 0..<n {
		for y in 0..<m {
			if tomatoBoxMap[x][y] == 0 && adjacencyMatrix[x][y] == 0 {
				identifier += 1
				bfs(x: x, y: y, identifier: identifier)
				print()
				
				print("Tomato")
				print(tomatoBoxMap)
				
				print("Adjacency")
				print(adjacencyMatrix)
			}
		}
	}
	print(identifier)
}

func shortestBridgeLength() -> Void {
	print("Shortest Bridge Length")
}

