//
//  ContentView.swift
//  AOCDay01
//
//  Created by Marc-Developer on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var puzzleInput: PuzzleInput
    
    var body: some View {
        
        
        VStack {
            Button("Show me some ELVES!") {
                puzzleInput.getAllCalorieTotals()
            }
            .buttonStyle(.borderedProminent)
            .padding(60)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(puzzleInput.allCalorieCounts, id: \.self) {
                        ElfView(calorieTotal: $0)
                    }
                    
                }
            }
            .padding()
            Spacer()
        }
    }
    
//    func loadFile() {
//        if let fileURL = Bundle.main.url(forResource: "PuzzleInputTEST", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//
//            }
//        }
//    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
