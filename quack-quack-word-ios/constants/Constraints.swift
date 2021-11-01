//
//  Constraints.swift
//  hello-word-ios
//
//  Created by hungphan on 11/1/21.
//

import UIKit

public let screenSize = UIScreen.main.bounds
public let windownSize = UIApplication.shared.windows.first

public enum EConstraint: CGFloat {
    case LEFT
    case RIGHT
    case TOP
    case BOTTOM
    
    var value: CGFloat {
        switch self {
            case .TOP : return 30
            case .BOTTOM: return 30
            case .RIGHT: return -30
            case .LEFT: return 30
        }
    }
}
