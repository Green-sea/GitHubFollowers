//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Ya on 3.01.23.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(dissmissVC))
        print(userName)
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    @objc
    func dissmissVC() {
        dismiss(animated: true)
    }
}
