//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Caroline Chan on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    let items: [String] = ["Rock", "Paper", "Scissors"]
    @State private var initialPick: String = "Paper"
    @State private var winCondition: Bool = true
    @State private var userPick: String = "Paper"
    @State private var score: Int = 0
    @State private var round: Int = 1
    @State private var showAlert: Bool = false
    
    private var isCorrect: Bool {
        if winCondition {
            if initialPick == "Rock" {
                switch userPick {
                case "Paper":
                    return true
                default:
                    return false
                }
            } else if initialPick == "Paper" {
                switch userPick {
                case "Scissors":
                    return true
                default:
                    return false
                }
            } else {
                switch userPick {
                case "Rock":
                    return true
                default:
                    return false
                }
            }
        } else {
            if initialPick == "Rock" {
                switch userPick {
                case "Scissors":
                    return true
                default:
                    return false
                }
            } else if initialPick == "Paper" {
                switch userPick {
                case "Rock":
                    return true
                default:
                    return false
                }
            } else {
                switch userPick {
                case "Paper":
                    return true
                default:
                    return false
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("SCORE: \(score)")
                .font(.title2.weight(.bold))
                .foregroundColor(.red)
            
            Form {
                Section {
                    Text("App initial pick is \(initialPick)")
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
                if isCorrect {
                    score += 10
                }
                initialPick = items[Int.random(in: 0...2)]
                winCondition.toggle()
                if round == 10 {
                    showAlert = true
                }
                round += 1
            } label: {
                Label("SUBMIT", systemImage: "paperplane")
                    .foregroundColor(.red)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Game Over"), message: Text("Your score is \(score)"), dismissButton: .default(Text("Restart")){
                    restart()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func restart() {
        round = 0
        score = 0
    }
}
