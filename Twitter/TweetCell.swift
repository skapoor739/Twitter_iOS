//
//  TweetCell.swift
//  Twitter
//
//  Created by Shivam Kapur on 28/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "a380")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.text = "SOME SAMPLE TEXT TO TEST THE SIZE AND WIDTH FIT"
        return textView
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
        addSubview(view: profileImageView)
        addSubview(view: separatorView)
        addSubview(view: messageTextView)
        
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        messageTextView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        messageTextView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        messageTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) could not be implemented.")
    }
    
    func configureCell(tweet: Tweet) {
        let attributedMutableString = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15)])
        let userHandleAttributedString = NSAttributedString(string: "  \(tweet.user.userName)\n", attributes: [NSFontAttributeName: UIFont(name:"Helvetica", size: 12)!, NSForegroundColorAttributeName: UIColor.gray])
        
        attributedMutableString.append(userHandleAttributedString)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1
        paragraphStyle.paragraphSpacingBefore = 2
        let tweetMessageAttributedString = NSAttributedString(string: tweet.tweetMessage, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black, NSParagraphStyleAttributeName: paragraphStyle])

        
        attributedMutableString.append(tweetMessageAttributedString)
        
        messageTextView.attributedText = attributedMutableString
        profileImageView.image = UIImage(named: tweet.user.profileImageName)
    }
    

    
}
