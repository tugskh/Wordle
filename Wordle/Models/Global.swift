//
//  Global.swift
//  Wordle
//
//  Created by Tugs Khaliunbat on 6/9/23.
//

import UIKit

enum Global {
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var scrrenHeight :CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDimensions: CGFloat {
        min(screenWidth,scrrenHeight)
    }
    
    static var boardWidth: CGFloat {
        switch minDimensions {
        case 0...320:
            return screenWidth - 55
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
}
