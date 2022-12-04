//: [Previous](@previous)

import Foundation

class RockPaperScissors {
    var score: Int = 0
    
    let wins: [String: String] = ["A": "Y",
                                  "B": "Z",
                                  "C": "X"]
    
    let ties: [String: String] = ["A": "X",
                                  "B": "Y",
                                  "C": "Z"]
    
    let shapeScore: [String: Int] = ["X": 1,
                                     "Y": 2,
                                     "Z": 3]
    
    let roundResultScore: [Int: Int] = [0: 6,
                                        1: 3,
                                        2: 0]
    
    func getTotalScore() -> Int {
        
        let input = getPuzzleInput()
        let rounds = splitInputIntoTuples(input: input)
        
        rounds.forEach { round in
            let roundResult = evaluateRoundOutcome(round: round)
            updateScore(round: round, roundResult: roundResult)
        }
        
        return score
    }
    
    private func getPuzzleInput() -> String {
        let path = Bundle.main.path(forResource: "02", ofType: "txt")
        
        var puzzleInput = ""
        
        do {
            puzzleInput = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("Issue parsing string.")
        }
        
        return puzzleInput
    }
    
    private func splitInputIntoTuples(input: String) -> [(String, String)] {
        let inputWithoutLineBreaks = input.components(separatedBy: "\n")
        
        var rounds: [(String, String)] = []
        
        for round in inputWithoutLineBreaks {
            let firstLetter = round[round.startIndex]
            let secondLetterIndex = round.index(before: round.endIndex)
            let secondLetter = round[secondLetterIndex]
            
            rounds.append((String(firstLetter), String(secondLetter)))
        }
        return rounds
    }
    
    private func evaluateRoundOutcome(round: (String, String)) -> Int {
        // 0: Player Wins
        // 1: Tie
        // 2: Player Loses
        if wins[round.0] == round.1 {
            return 0
        } else if ties[round.0] == round.1 {
            return 1
        }
        return 2
    }
    
    private func updateScore(round: (String, String), roundResult: Int) {
        let shapeScore = shapeScore[round.1]!
        let roundResultScore = roundResultScore[roundResult]!
        score += (shapeScore + roundResultScore)
    }
}

class RockPaperScissorsPart2 {
    var score: Int = 0
    
    let wins: [String: String] = ["A": "Y",
                                  "B": "Z",
                                  "C": "X"]
    
    let losses: [String: String] = ["A": "Z",
                                    "B": "X",
                                    "C": "Y"]
    
    let ties: [String: String] = ["A": "X",
                                  "B": "Y",
                                  "C": "Z"]
    
    let shapeScore: [String: Int] = ["X": 1,
                                     "Y": 2,
                                     "Z": 3]
    
    let roundResultScore: [Int: Int] = [0: 6,
                                        1: 3,
                                        2: 0]
    
    func getTotalScore() -> Int {
        
        let input = getPuzzleInput()
        let rounds = splitInputIntoTuples(input: input)
        
        rounds.forEach { round in
            let roundResult = evaluateRoundOutcome(round: round)
            updateScore(round: round, roundResult: roundResult)
        }
        
        return score
    }
    
    private func getPuzzleInput() -> String {
        let path = Bundle.main.path(forResource: "PuzzleInput02", ofType: "txt")
        
        var puzzleInput = ""
        
        do {
            puzzleInput = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("Issue parsing string.")
        }
        
        return puzzleInput
    }
    
    private func splitInputIntoTuples(input: String) -> [(String, String)] {
        let inputWithoutLineBreaks = input.components(separatedBy: "\n")
        
        var rounds: [(String, String)] = []
        
        for round in inputWithoutLineBreaks {
            let firstLetter = round[round.startIndex]
            let secondLetterIndex = round.index(before: round.endIndex)
            let secondLetter = round[secondLetterIndex]
            
            rounds.append((String(firstLetter), String(secondLetter)))
        }
        return rounds
    }
    
    private func evaluateRoundOutcome(round: (String, String)) -> Int {
        // 0: Player Wins
        // 1: Tie
        // 2: Player Loses
        if round.1 == "Z" {
            return 0
        } else if round.1 == "Y" {
            return 1
        }
        return 2
    }
    
    private func updateScore(round: (String, String), roundResult: Int) {
        var shapeScore = 0
        
        let x = wins[round.0]!
        let y = ties[round.0]!
        let z = losses[round.0]!
        
        if roundResult == 0 {
            shapeScore = self.shapeScore[x]!
        } else if roundResult == 1 {
            shapeScore = self.shapeScore[y]!
        } else {
            shapeScore = self.shapeScore[z]!
        }
        
        let roundResultScore = roundResultScore[roundResult]!
        score += (shapeScore + roundResultScore)
    }
}

let rps = RockPaperScissors()
rps.getTotalScore()

let rps2 = RockPaperScissorsPart2()
rps2.getTotalScore()

//: [Next](@next)
