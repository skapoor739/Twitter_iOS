//
//  ViewController.swift
//  Twitter
//
//  Created by Shivam Kapur on 08/01/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout
    
{
    
    private var userArray: [User] = {
       let user1 = User(name: "Shivam Kapoor", userName: "@skapoor739", bioText: "Coder. Dreamer. Hustler. Tech. Aeroplanes. Smart. Hacker. Loves coffee. Beer, anyday. Book junkie. Loves reading documentation.", profileImageName: "a380")
        let user2 = User(name: "Lufthansa", userName: "@lufthansaIndia", bioText: "Official page of Lufthansa India.", profileImageName: "a380")

        return [user1, user2]
    }()
    
    private var tweetArray: [Tweet] = {
        let user1 = User(name: "Shivam Kapoor", userName: "@skapoor739", bioText: "Coder. Dreamer. Hustler. Tech. Aeroplanes. Smart. Hacker. Loves coffee. Beer, anyday. Book junkie. Loves reading documentation.", profileImageName: "a380")
        let user2 = User(name: "Lufthansa", userName: "@lufthansaIndia", bioText: "Official page of Lufthansa India.", profileImageName: "a380")

        let tweet1 = Tweet(user: user1, tweetMessage: "This is a test tweet message that I intend to put inside the message textView. It has no purpose and it does not mean shit. Nah. no shit. It's just that I want to adapt dynamic sizing. User experience is really a key facotr to be considered while writing apps. Just like I am writing this meaninngless tweet. Makes not sense. Just helps me increase the size of the text view. Ironic, we write apps and people write tweets. Both of us just wrtie. WRITE")
        
        let tweet2 = Tweet(user: user2, tweetMessage: "Ah. On purpose it's small. Don't mind. Focus on the big picture. :P")
        
        let tweet3 = Tweet(user: user1, tweetMessage: "This is a test tweet message that I intend to put inside the message textView. It has no purpose and it does not mean shit. Nah. no shit. It's just that I want to adapt dynamic sizing. User experience is really a key facotr to be considered while writing apps. Just like I am writing this meaninngless tweet. Makes not sense. Just helps me increase the size of the text view. Ironic, we write apps and people write tweets. Both of us just wrtie. WRITE...This is a test tweet message that I intend to put inside the message textView. It has no purpose and it does not mean shit. Nah. no shit. It's just that I want to adapt dynamic sizing. User experience is really a key facotr to be considered while writing apps. Just like I am writing this meaninngless tweet. Makes not sense. Just helps me increase the size of the text view. Ironic, we write apps and people write tweets. Both of us just wrtie. WRITE.")
        
        return [tweet1, tweet2, tweet3]
    }()
    
    private struct CellIdentifiers {
        static let userCellID = "userCellID"
        static let tweetCellID = "tweetCellID"
        static let footerID = "footerID"
        static let headerID = "headerID"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        collectionView?.backgroundColor = UIColor.color(r: 232, g: 236, b: 241)
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: CellIdentifiers.userCellID)
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: CellIdentifiers.tweetCellID)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CellIdentifiers.headerID)
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: CellIdentifiers.footerID)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 0
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return tweetArray.count
        }
        return userArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellforitem")
        switch indexPath.section {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.userCellID, for: indexPath) as? UserCell {
                cell.configureCell(user: userArray[indexPath.item])
                return cell
            }
            break
            
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tweetCellID, for: indexPath) as? TweetCell {
                cell.configureCell(tweet: tweetArray[indexPath.item])
                return cell
            }
            break
            
        default:
            return UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("sizeforitem")
        var textToCalculateWidthFor = ""
        var frameToReturn = CGRect.zero
        
        if indexPath.section == 0 {
            textToCalculateWidthFor = userArray[indexPath.item].bioText
            let sizeForBioTextView = CGSize(width: view.frame.width - 66, height: 1000)
            frameToReturn = NSString(string: textToCalculateWidthFor).boundingRect(with: sizeForBioTextView, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)], context: nil)
            
            return CGSize(width: view.frame.width, height: frameToReturn.height + 70)
            
        }   else if indexPath.section == 1 {
            let tweet = tweetArray[indexPath.item]
            
            let attributedMutableString = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15)])
            let userHandleAttributedString = NSAttributedString(string: "  \(tweet.user.userName)\n", attributes: [NSFontAttributeName: UIFont(name:"Helvetica", size: 12)!, NSForegroundColorAttributeName: UIColor.gray])
            
            attributedMutableString.append(userHandleAttributedString)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 2
            paragraphStyle.paragraphSpacingBefore = 4
            let tweetMessageAttributedString = NSAttributedString(string: tweet.tweetMessage, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black, NSParagraphStyleAttributeName: paragraphStyle])
            
            
            attributedMutableString.append(tweetMessageAttributedString)
            let sizeForAttributedText = CGSize(width: view.frame.width - 71, height: 1000)
            let sizeForTweetTextView = NSAttributedString(attributedString: attributedMutableString).boundingRect(with: sizeForAttributedText, options: [.usesDeviceMetrics, .usesLineFragmentOrigin], context: nil)
            print(sizeForTweetTextView)
            
            return CGSize(width: view.frame.width, height: sizeForTweetTextView.height + 8 + 8 + 25)
        }
        
        return .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
             let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CellIdentifiers.headerID, for: indexPath)
                return header
        }
        else if kind == UICollectionElementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: CellIdentifiers.footerID, for: indexPath)
            return footer
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: self.view.frame.size.width, height: 50)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: self.view.frame.size.width, height: 70)
        }
        
        return .zero
    }
    
}

