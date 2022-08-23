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
	let directionX = [1, -1, 0, 0]
	let directionY = [0, 0, 1, -1]
	
	let firstLineReader = readLine()!.split(separator: " ").map { Int($0)! }
	let width = firstLineReader[0]
	let height = firstLineReader[1]
	
	var days = [[Int]](repeating: [Int](repeating: -1, count: width), count: height)
	var grid = [[Int]]()
	
	for _ in 0..<height {
		grid.append(readLine()!.split(separator: " ").map { Int($0)! })
	}
	
	let queue = Queue<(x: Int, y: Int)>()
	
	for currentRow in 0..<height {
		for currentColumn in 0..<width {
			if grid[currentRow][currentColumn] == 1 {
				queue.enqueue(item: (x: currentColumn, y: currentRow))
			}
			days[currentRow][currentColumn] = 0
		}
	}
	
	while !queue.isEmpty() {
		let firstItem = queue.dequeue()!
		
		let x = firstItem.x
		let y = firstItem.y
		
		for i in 0..<4 {
			let nx = x + directionX[i]
			let ny = y + directionY[i]
			
			if nx >= 0 && nx < width && ny >= 0 && ny < height {
				if grid[nx][ny] == 0 && days[nx][ny] == -1 {
					days[nx][ny] = days[x][y] + 1
					queue.enqueue(item: (x: nx, y: ny))
				}
			}
		}
	}
	
	var answer = 0
	
	for heightRow in 0..<height {
		for widthColumn in 0..<width {
			if grid[heightRow][widthColumn] == 0 && days[heightRow][widthColumn] == -1 {
				answer = -1
				print(answer)
				return
			}
			
			if answer < days[heightRow][widthColumn] {
				answer = days[heightRow][widthColumn]
			}
		}
	}
	
	print("Output: \(answer)")
}

func shortestBridgeLength() -> Void {
	print("Shortest Bridge Length")
}

