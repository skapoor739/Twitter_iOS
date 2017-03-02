//
//  HomeController+navControllerSetup.swift
//  Twitter
//
//  Created by Shivam Kapur on 26/02/17.
//  Copyright © 2017 ShivamKapur. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setupNavigationBar() {
        setupNavBarAppearance()
        setupTitleView()
        setupLeftNavBarButton()
        setupRightNavBarButtons()
    }
    
    private func setupNavBarAppearance() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
    }
    
    private func setupTitleView() {
        var twitterImage = UIImageView(image: #imageLiteral(resourceName: "title_icon").withRenderingMode(.alwaysOriginal))
        twitterImage.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        twitterImage.contentMode = .scaleAspectFit
        navigationItem.titleView = twitterImage
    }
    
    private func setupLeftNavBarButton() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavBarButtons() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
    }
    
    
    
}
