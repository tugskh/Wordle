//
//  Guess.swift
//  Wordle
//
//  Created by Tugs Khaliunbat on 6/9/23.
//

import SwiftUI

struct Guess {
    
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map {
            String($0)
        }
    }
    
}
