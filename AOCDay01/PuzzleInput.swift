//
//  PuzzleInput.swift
//  AOCDay01
//
//  Created by Marc-Developer on 12/1/22.
//

import Foundation

class PuzzleInput: ObservableObject {
    
    @Published var puzzleInput: String = "Click above to see the answer!"
    @Published var allCalorieCounts = [Int]()
    
    func findElfWithMostCalories() -> Int {
        getPuzzleInput()
        let elves = separateOutEachElf(puzzleInput: puzzleInput)
        let elvesConvertedToInt = convertElfCalorieTotalsToInt(elves: elves)
        let elfCalorieTotals = totalAllCalorieCounts(elves: elvesConvertedToInt)
        let highestCalorieTotal = getHighestCalorieCount(elves: elfCalorieTotals)
        return highestCalorieTotal
    }

    func findTotalOfThreeMostCalories() -> Int {
        getPuzzleInput()
        let elves = separateOutEachElf(puzzleInput: puzzleInput)
        let elvesConvertedToInt = convertElfCalorieTotalsToInt(elves: elves)
        let elfCalorieTotals = totalAllCalorieCounts(elves: elvesConvertedToInt)
        let TotalOfHighestThreeCalorieCounts = getTotalOfHighestThreeCalorieCounts(elves: elfCalorieTotals)
        
        return TotalOfHighestThreeCalorieCounts
    }
    
    func getAllCalorieTotals() {
        getPuzzleInput()
        let elves = separateOutEachElf(puzzleInput: puzzleInput)
        let elvesConvertedToInt = convertElfCalorieTotalsToInt(elves: elves)
        let elfCalorieTotals = totalAllCalorieCounts(elves: elvesConvertedToInt)
        self.allCalorieCounts = elfCalorieTotals
    }

    func getPuzzleInput() {
        let path = Bundle.main.path(forResource: "PuzzleInput", ofType: "txt")
        
        do {
            self.puzzleInput = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("Issue parsing string.")
        }
    }

    func removeSingleLineBreakFromString(string: String) -> [String] {
        string.components(separatedBy: "\n")
    }

    func separateOutEachElf(puzzleInput: String) -> [[String]] {
        
        let elvesWithLineBreaks = puzzleInput.components(separatedBy: "\n\n")
        var separatedCalorieAmounts = [[String]]()
        
        for messyNumber in elvesWithLineBreaks {
            let cleanNumber = removeSingleLineBreakFromString(string: messyNumber)
            separatedCalorieAmounts.append(cleanNumber)
        }
        return separatedCalorieAmounts
    }

    func convertElfCalorieTotalsToInt(elves: [[String]]) -> [[Int]] {
        var separatedCalorieAmountsInt = [[Int]]()

        for elf in elves {
            let ints = elf.map { Int($0) ?? 0 }
            separatedCalorieAmountsInt.append(ints)
        }
        return separatedCalorieAmountsInt
    }

    func totalAllCalorieCounts(elves: [[Int]]) -> [Int] {
        var totals = [Int]()

        for calories in elves {
            let total = calories.reduce(0) { $0 + $1 }
            totals.append(total)
        }
        return totals
    }

    func getHighestCalorieCount(elves: [Int]) -> Int {
        elves.max()!
    }

    func getTotalOfHighestThreeCalorieCounts(elves: [Int]) -> Int {
        var total: Int
        
        let sortedCalorieTotals = elves.sorted(by: >)
        
        let firstThree = sortedCalorieTotals[0...2]
        total = firstThree.reduce(0, +)
        
        return total
    }
}
