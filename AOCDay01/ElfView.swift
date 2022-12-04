//
//  ElfView.swift
//  AOCDay01
//
//  Created by Marc-Developer on 12/2/22.
//

import SwiftUI

struct ElfView: View {
    let calorieTotal: Int
    
    var body: some View {
        VStack {
            Image("elf")
                .resizable()
                .scaledToFit()
                .frame(width: 125)
                .frame(height: CGFloat(calorieTotal)/520)
            Text(String(calorieTotal))
        }
    }
}

struct ElfView_Previews: PreviewProvider {
    static var previews: some View {
        ElfView(calorieTotal: 65000)
    }
}
