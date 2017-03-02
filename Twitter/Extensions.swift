//
//  Extensions.swift
//  Twitter
//
//  Created by Shivam Kapur on 25/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubview(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}

extension UIColor {
    
    static func color(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
