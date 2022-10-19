//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Caroline Chan on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var pick: [String] = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var winCondition: Bool = true
    let items: [String] = ["Rock", "Paper", "Scissors"]
    @State private var userPick: String = "Paper"
    @State private var score: Int = 0
    
    var body: some View {
        VStack {
            Text("SCORE: \(score)")
                .font(.title2.weight(.bold))
                .foregroundColor(.red)
            
            Form {
                Section {
                    Text("App initial pick is \(pick[0])")
                    Text(winCondition ? "Player must win" : "Player must lose")
                } header: {
                    Label("Initial condition", systemImage: "gamecontroller")
                        .foregroundColor(.red)
                }
                
                Section {
                    Picker("Player pick", selection: $userPick) {
                        ForEach(items, id: \.self) { item in
                            Text(item)
                        }
                    }
                } header: {
                    Label("Pick to satisfy condition", systemImage: "checkmark")
                        .foregroundColor(.red)
                }
            }
            
            Button{
                
            } label: {
                Label("SUBMIT", systemImage: "paperplane")
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
