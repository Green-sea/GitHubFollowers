//
//  UIhelper.swift
//  GitHubFollowers
//
//  Created by Ya on 22.12.22.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33),
//                                             heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                              heightDimension: .fractionalWidth(0.33))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
//                                                         subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
    }
}
