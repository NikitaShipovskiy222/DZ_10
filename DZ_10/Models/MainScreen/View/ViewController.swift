//
//  ViewController.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit

class ViewController: UIViewController {

    
    private let collectionData = CollectionSection.mockData()
    
    private lazy var collectionView: UICollectionView = {
        $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.resuesId)
        $0.register(MessengeCollectionViewCell.self, forCellWithReuseIdentifier: MessengeCollectionViewCell.resuesId)
        $0.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.resuesId)
        $0.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.resuesId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: getLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }

    private func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0: return self.makeStorySection()
            case 1: return self.makeMessengeSection()
            case 2: return self.makeNewsSection()
            default: return self.makeBannerSection()
                
            }
        }
    }
    
    private func makeStorySection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                               heightDimension: .absolute(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 46, trailing: 30)
        return section
    }
    
    private func makeMessengeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .estimated(98))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize , repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 46, trailing: 30)
        return section
    }
    
    private func makeNewsSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .estimated(98))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize , repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 46, trailing: 30)
        return section
    }
    
    private func makeBannerSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 46, leading: 0, bottom: 23, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(239))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
//        group.contentInsets = NSDirectionalEdgeInsets(top: , leading: 10, bottom: 23, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 23, trailing: 30)
        return section
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let item = collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.resuesId, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: item)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessengeCollectionViewCell.resuesId, for: indexPath) as? MessengeCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: item)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.resuesId, for: indexPath) as? NewsCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: item)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.resuesId, for: indexPath) as? BannerCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: item)
            return cell
        }
    
    
    }
    

    
}
