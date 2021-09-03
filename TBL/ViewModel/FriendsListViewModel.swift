//
//  FriendsListViewModel.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class FriendsListViewModel: NSObject, UICollectionViewDelegate {
    typealias DiffableDataSource = UICollectionViewDiffableDataSource<Section, Friend>
    typealias DiffableSnapshot = NSDiffableDataSourceSnapshot<Section, Friend>
    
    private var sections = Section.allSections
    var dataSource: DiffableDataSource!
    private var lastUserId = 0
    private(set) var friends : [Friend]!
    private var collectionView : UICollectionView!
    
    var updateControllerAfterCellSelection : ((_ friend : Friend) -> ()) = {_ in }
    
    override init() {
        super.init()
    }
    
    func makeDataSource(collectionView: UICollectionView,  layout: FriendsListLayout) -> DiffableDataSource {
        self.collectionView = collectionView
        self.collectionView.delegate = self
        dataSource = DiffableDataSource(collectionView: collectionView,
                                        cellProvider: cellProvider)

        return dataSource
    }
    
    func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, friend: Friend) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: "FriendCollectionViewCell",
          for: indexPath) as? FriendCollectionViewCell
        cell?.friend = friend
        return cell
    }
    
    func getUsersList() {
        APIService.shared.getFriendsList { [self] result, error in
            guard let result = result else { return }
            friends = result.results
            applySnapshot()
        }
    }
    
    //
    func applySnapshot(animatingDifferences: Bool = true) {
      var snapshot = DiffableSnapshot()
      snapshot.appendSections(sections)
      sections.forEach { section in
        snapshot.appendItems(friends, toSection: section)
      }
      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    //UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        self.updateControllerAfterCellSelection(friend)
    }
}
