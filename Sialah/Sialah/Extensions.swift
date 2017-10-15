//
//  Extensions.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

extension UIViewController {
    var rect: CGRect {
        get { return view.frame }
    }
    func X(_ percentage: CGFloat ) -> CGFloat { return percentage*rect.width/100 }
    func Y(_ percentage: CGFloat ) -> CGFloat { return percentage*rect.height/100 }
    func X(_ percentage: CGFloat, from: UIView ) -> CGFloat { return percentage*rect.width/100 + from.frame.maxX }
    func Y(_ percentage: CGFloat, from: UIView ) -> CGFloat { return percentage*rect.height/100 + from.frame.maxY }
    func RevX(_ percentage: CGFloat, width: CGFloat ) -> CGFloat { return (rect.width - percentage*rect.width/100) - width }
    func RevY(_ percentage: CGFloat, height: CGFloat) -> CGFloat { return (rect.height - percentage*rect.height/100) - height }
}

extension String {
    func toColor() -> UIColor {
        switch self {
        case "yellow": return UIColor.flatYellow
        case "red": return UIColor.flatRed
        case "blue": return UIColor.flatBlue
        case "brown": return UIColor.flatBrown
        default: return UIColor.flatBlack
        }
    }
}
