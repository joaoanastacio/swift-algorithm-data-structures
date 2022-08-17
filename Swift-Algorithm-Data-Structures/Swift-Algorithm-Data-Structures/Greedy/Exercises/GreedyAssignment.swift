//
//  GreedyAssignment.swift
//  Swift-Algorithm-Data-Structures
//
//  Created by Joao Victor Silva Anastacio on 2022-08-15.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
	var finalCostAmount = 0
	
	let costArraySortedMinimumDifference = costs.sorted {($0[0] - $0[1]) <= ($1[0] - $1[1])}
	
	for i in 0..<costArraySortedMinimumDifference.count {
		finalCostAmount += costArraySortedMinimumDifference[i][i < costArraySortedMinimumDifference.count / 2 ? 0 : 1]
	}
	return finalCostAmount
}

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
	if intervals.count <= 1 {
		return true
	}
	
	var intervalArraySortedByStartTimeDifference = intervals.sorted() {
		if $0[0] != $1[0] {
			return $0[0] < $1[0]
		} else {
			return $0[1] < $1[1]
		}
	}
	
	for i in 0..<intervalArraySortedByStartTimeDifference.count - 1 {
		if intervalArraySortedByStartTimeDifference[i][1] > intervalArraySortedByStartTimeDifference[i + 1][0] {
			return false
		}
	}
	return true
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
	let allGasReduced = gas.reduce(0) {$0 + $1}
	let allCostReduced = cost.reduce(0) {$0 + $1}
	
	if allGasReduced < allCostReduced {
		return -1
	}
	
	var gasStationIndex = 0
	var gasSum = 0
	var costSum = 0
	
	for (index, currentGas) in gas.enumerated() {
		gasSum += currentGas
		costSum += cost[index]

		if gasSum < costSum {
			gasStationIndex = index + 1
			gasSum = 0
			costSum = 0
		}
	}
	return gasStationIndex
}

func partitionLabels(_ s: String) -> [Int] {
	guard s.count > 1 && s.count <= 500 else {
		return []
	}
	
	var lastIndexByLetter = [String: Int]()
	
	for index in 0..<s.count {
		lastIndexByLetter[String(s[index])] = index
	}
	
	var partitionsMapping: [Int] = []
	var start = 0
	var end = 0
	
	for index in 0..<s.count {
		end = max(end, lastIndexByLetter[String(s[index])]!)
		
		if index == end {
			partitionsMapping.append(index - start + 1)
			start = index + 1
		}
	}
	return partitionsMapping
}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
	print("Exercise Task Scheduler")
	return 0
}
