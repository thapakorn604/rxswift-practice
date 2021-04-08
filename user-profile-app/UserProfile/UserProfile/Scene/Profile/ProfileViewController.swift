//
//  ProfileViewController.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import Foundation
import RxDataSources
import Kingfisher

class ProfileViewController: BaseViewController<ProfileViewModelType> {
  
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var bioDescription: UILabel!
  @IBOutlet weak var repositoriesCount: UILabel!
  @IBOutlet weak var starsCount: UILabel!
  @IBOutlet weak var followersCount: UILabel!
  @IBOutlet weak var followingCount: UILabel!
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    super.setupView()
    self.avatarImage.roundedImageView()
    self.backgroundImage.darkenImageView()
    
    let nib: UINib = UINib(nibName: TableViews.repositoryCell, bundle: .this)
    tableView.register(nib, forCellReuseIdentifier: TableViews.repositoryCell)
  }
  
  override func bindInput(viewModel: ProfileViewModelType) {
    rx.methodInvoked(#selector(viewDidLoad))
      .map({(_) in ()})
      .bind(to: viewModel.inputs.viewDidLoad)
      .disposed(by: bag)
  }
  
  override func bindOutput(viewModel: ProfileViewModelType) {
    viewModel.outputs.profileInfo.drive(onNext: { (profileInfo) in
      
      self.profileName.text = profileInfo.profileName
      self.userName.text = profileInfo.userName
      self.bioDescription.text = profileInfo.bioDescription
      self.repositoriesCount.text = profileInfo.repositoriesCount
      self.starsCount.text = profileInfo.starsCount
      self.followersCount.text = profileInfo.followersCount
      self.followingCount.text = profileInfo.followingCount
      self.avatarImage.setImage(profileInfo.avatarURL)
      
    }).disposed(by: bag)
    
    
    viewModel.outputs.repositories.drive(tableView.rx.items(cellIdentifier: TableViews.repositoryCell, cellType: RepositoryCell.self)) { (row, repository, cell) in
      cell.bind(to: repository)
    }.disposed(by: bag)
  }
}
