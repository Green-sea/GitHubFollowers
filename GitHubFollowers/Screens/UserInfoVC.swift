//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Ya on 3.01.23.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    var itemViews: [UIView] = []
    
    var userName: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congigureViewController()
        getUserInfo()
        layoutUI()
    }
    
    
    func congigureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(dissmissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserIngoHeaderVC(user: user), to: self.headerView)
                    self.add(childVC: GFRepoItemInfoVC(user: user), to: self.itemViewOne)
                    self.add(childVC: GFFolloserItemVC(user: user), to: self.itemViewTwo)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.present(GFAlertVC(title: "Something went wrong",
                                           message: error.rawValue, buttonTitle: "ok"), animated: true)
                }
            }
        }
    }
    
    
    func layoutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo]
        
        let padding = CGFloat(20)
        let itemHeight = CGFloat(140)
        
        for item in itemViews{
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),

            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc
    func dissmissVC() {
        dismiss(animated: true)
    }
}
