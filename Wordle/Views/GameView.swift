//
//  ContentView.swift
//  Wordle
//
//  Created by Tugs Khaliunbat on 6/9/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    @State private var showSettings = false
    var body: some View {
        ZStack {
            NavigationView() {
                VStack {
                    if Global.screenHeight < 600 {
                        Text("")
                    }
                    Spacer()
                    
                    VStack(spacing: 3) {
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                        }
                    }
                    
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth/5)
                    Spacer()
                    Keyboard()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    
                    Spacer()
                }
                .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
                .disabled(dm.showStats)
                .overlay(alignment: .top) {
                    if let toastText = dm.toastText {
                        ToastView(toastText: toastText)
                            .offset(y: 20)
                    }
                }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                if !dm.inPlay {
                                    Button {
                                        dm.newGame()
                                    } label: {
                                        Text("New")
                                            .foregroundColor(.primary)
                                    }

                                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "questionmark.circle")
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .principal) {
                            Text("WORDLE")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(dm.hardMode ? Color(.systemRed) : .primary)
                                .minimumScaleFactor(0.5)
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button {
                                    withAnimation {
                                        dm.showStats.toggle()
                                    }
                                } label : {
                                    Image(systemName: "chart.bar")
                                }
                                
                                Button {
                                    showSettings.toggle()
                                } label : {
                                    Image(systemName: "gearshape.fill")
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                    }
            }
            
            if dm.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
