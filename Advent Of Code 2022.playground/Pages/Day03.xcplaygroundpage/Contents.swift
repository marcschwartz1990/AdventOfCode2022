//: [Previous](@previous)

import Foundation

class RuckSack {
    var sumOfPriorities = 0

    func solveRuckSack() {
        let puzzleInput = getPuzzleInput()
        let ruckSacks = splitRuckSacks(input: puzzleInput)
        for ruckSack in ruckSacks {
            let firstHalf = buildFirstHalfSet(input: ruckSack)
            let secondHalf = buildSecondHalfSubSequence(input: ruckSack)
            let missingLetter = getMissingLetter(firstHalf: firstHalf, secondHalf: secondHalf)
            let priority = getPriority(letter: missingLetter)
            self.sumOfPriorities += priority
        }
    }
    
    private func getPuzzleInput() -> String {
        let path = Bundle.main.path(forResource: "03", ofType: "txt")
        
        var puzzleInput = ""
        
        do {
            puzzleInput = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("Issue parsing string.")
        }
        
        return puzzleInput
    }
    
    private func splitRuckSacks(input: String) -> [String] {
        var ruckSacks = [String]()
        
        let inputWithoutLineBreaks = input.components(separatedBy: "\n")
        
        for ruckSack in inputWithoutLineBreaks {
            ruckSacks.append(ruckSack)
        }
        return ruckSacks
    }
    
    private func buildFirstHalfSet(input: String) -> Set<Character> {
        let startOfSecondHalf = input.index(input.startIndex, offsetBy: input.count / 2)
        let firstHalf = input[..<startOfSecondHalf]
        
        var firstHalfSet = Set<Character>()
        
        for letter in firstHalf {
            firstHalfSet.insert(letter)
        }
        
        return firstHalfSet
    }
    
    private func buildSecondHalfSubSequence(input: String) -> String.SubSequence {
        let startOfSecondHalf = input.index(input.startIndex, offsetBy: input.count / 2)
        let secondHalf = input[startOfSecondHalf...]
        return secondHalf
    }
    
    private func getMissingLetter(firstHalf: Set<Character>, secondHalf: String.SubSequence) -> Character {
        var missingLetter: Character?
        
        for letter in secondHalf {
            if firstHalf.contains(letter) {
                missingLetter = letter
            }
        }
        return missingLetter ?? "A"
    }
    
    private func getPriority(letter: Character) -> Int {
        if letter.isUppercase {
            return Int(letter.asciiValue! - 38)
        } else if letter.isLowercase {
            return Int(letter.asciiValue! - 96)
        }
        return 0
    }
}

class RuckSackPart2 {
    var sumOfPriorities = 0

    func solveRuckSack() {
        let puzzleInput = getPuzzleInput()
        let groupsOfElves = groupElves(input: puzzleInput)
        for groupOfElves in groupsOfElves {
            let badge = findBadge(groupOfElves: groupOfElves)
            let priority = getPriority(letter: badge)
            self.sumOfPriorities += priority
        }
    }
    
    private func getPuzzleInput() -> String {
        let path = Bundle.main.path(forResource: "03", ofType: "txt")
        
        var puzzleInput = ""
        
        do {
            puzzleInput = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("Issue parsing string.")
        }
        
        return puzzleInput
    }
    
    private func groupElves(input: String) -> [[String]] {
        var groupsOfElves = [[String]]()
        var groupOfElves = [String]()
        
        let elves = input.components(separatedBy: "\n")
        
        for elf in elves {
            groupOfElves.append(elf)
            if groupOfElves.count == 3 {
                groupsOfElves.append(groupOfElves)
                groupOfElves = []
            }
        }
        return groupsOfElves
    }

    private func findBadge(groupOfElves: [String]) -> Character {
        var badge: Character?
        
        let elfOne = groupOfElves[0]
        let elfTwo = groupOfElves[1]
        let elfThree = groupOfElves[2]
        
        for letter in elfOne {
            if elfTwo.contains(letter) {
                if elfThree.contains(letter) {
                    badge = letter
                }
            }
        }
        return badge ?? "A"
    }
    
    private func getPriority(letter: Character) -> Int {
        if letter.isUppercase {
            return Int(letter.asciiValue! - 38)
        } else if letter.isLowercase {
            return Int(letter.asciiValue! - 96)
        }
        return 0
    }
}

let ruckSack = RuckSack()
let ruckSack2 = RuckSackPart2()

ruckSack.solveRuckSack()
ruckSack2.solveRuckSack()

print(ruckSack.sumOfPriorities)
print(ruckSack2.sumOfPriorities)


//: [Next](@next)
