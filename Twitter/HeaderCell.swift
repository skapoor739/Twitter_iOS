//
//  HeaderCell.swift
//  Twitter
//
//  Created by Shivam Kapur on 26/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let followLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    let separatorView: SeparatorView = {
        let view = SeparatorView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        addSubview(view: followLabel)
        addSubview(view: separatorView)
        
        followLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        followLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        followLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        followLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) could not be implemented")
    }
}
