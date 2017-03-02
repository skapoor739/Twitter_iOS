//
//  FooterCell.swift
//  Twitter
//
//  Created by Shivam Kapur on 26/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

class FooterCell: UICollectionViewCell {
    
    let showMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.textColor = UIColor.color(r: 0, g: 132, b: 180)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let separatorView: SeparatorView = {
        let view = SeparatorView()
        return view
    }()
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        setupView()
    }
    
    func setupView() {
        addSubview(view: whiteBackgroundView)
        addSubview(view: showMoreLabel)
        addSubview(view: separatorView)
        
        whiteBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        whiteBackgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        whiteBackgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        whiteBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        showMoreLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        showMoreLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        showMoreLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        showMoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) could not be implemented.")
    }
}
