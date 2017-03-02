//
//  UserCell.swift
//  Twitter
//
//  Created by Shivam Kapur on 08/01/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit


let twitterColor = UIColor.color(r: 0, g: 132, b: 180)

class UserCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "a380")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shivam Kapoor"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@shivamkapoor5"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Coder. Dreamer. Hustler. Tech. Aeroplanes. Smart."
        textView.font = UIFont.boldSystemFont(ofSize: 15)
        textView.textColor = .black
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.sizeToFit()
        textView.contentInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.setTitleColor(twitterColor, for: .normal)
        button.layer.borderColor = twitterColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
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
    

    private func setupView() {
        addSubview(view: profileImageView)
        addSubview(view: nameLabel)
        addSubview(view: userNameLabel)
        addSubview(view: descriptionTextView)
        addSubview(view: followButton)
        addSubview(view: separatorView)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor, constant: -8).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) could not be implemented.")
    }
    
    func configureCell(user: User) {
        profileImageView.image = UIImage(named: user.profileImageName)
        nameLabel.text = user.name
        userNameLabel.text = user.userName
        descriptionTextView.text = user.bioText
        
    }
    
}
