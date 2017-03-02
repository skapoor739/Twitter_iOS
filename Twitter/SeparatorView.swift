//
//  SeparatorView.swift
//  Twitter
//
//  Created by Shivam Kapur on 26/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.color(r: 230, g: 230, b: 230)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) could not be implemented.")
    }
    
}
