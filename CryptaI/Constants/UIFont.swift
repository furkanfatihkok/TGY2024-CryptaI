//
//  UIFont.swift
//  CryptaI
//
//  Created by FFK on 3.05.2024.
//

import UIKit

extension UIFont {
    
    static func latoRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular.ttf", size: size) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static func latoBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold.ttf", size: size) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static func latoBlack(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Black.ttf", size: size) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static func latoLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Light.ttf", size: size) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static func latoThin(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Thin.ttf", size: size) ?? UIFont.systemFont(ofSize: 14)
    }
}
