//
//  FriendsListViewController.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class FriendsListViewController: UIViewController {
    private var friendListViewModel : FriendsListViewModel!
    var selectedFriend : Friend!
    @IBOutlet var collectionView : UICollectionView!
    
    private var layout = FriendsListLayout()
    private lazy var dataSource = friendListViewModel.makeDataSource(collectionView: collectionView, layout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout.make()
        
        friendListViewModel = FriendsListViewModel()
        friendListViewModel.getUsersList()
        
        //viewModel binding to update Controller when cell is selected
        friendListViewModel.updateControllerAfterCellSelection =  { [self] friend in
            selectedFriend = friend
            self.performSegue(withIdentifier: "showDetails", sender: self)
        }
        
        // Initialize diffable data source
        _ = dataSource.snapshot()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! FriendDetailsViewController
            destinationVC.friend = selectedFriend
    }

}
