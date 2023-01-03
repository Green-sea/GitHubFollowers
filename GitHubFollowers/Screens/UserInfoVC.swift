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
        print(userName!)
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                user
                
            case .failure(let error):
                self.present(GFAlertVC(title: "Something went wrong",
                                       message: error.rawValue, buttonTitle: "ok"), animated: true)
            }
        }
    }
    
    
    @objc
    func dissmissVC() {
        dismiss(animated: true)
    }
}
