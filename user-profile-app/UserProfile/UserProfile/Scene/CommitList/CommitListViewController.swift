//
//  CommitList.swift
//  UserProfile
//
//  Created by Oat on 8/4/2564 BE.
//

import Foundation
import UIKit

class CommitListViewController: BaseViewController<CommitListViewModelType> {
  
  @IBOutlet weak var repositoryName: UILabel!
  @IBOutlet weak var repositoryDescription: UILabel!
  @IBOutlet weak var language: UILabel!
  @IBOutlet weak var starsCount: UILabel!
  @IBOutlet weak var forkCount: UILabel!
  
  @IBOutlet weak var commitMessage: UILabel!
  @IBOutlet weak var branchName: UILabel!
  @IBOutlet weak var authorAvatarImage: UIImageView!
  @IBOutlet weak var author: UILabel!
  @IBOutlet weak var committedDateTime: UILabel!

  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    super.setupView()
  }
  
  override func bindInput(viewModel: CommitListViewModelType) {
    rx.methodInvoked(#selector(viewDidLoad))
    .map({(_) in ()})
    .bind(to: viewModel.inputs.viewDidLoad)
    .disposed(by: bag)
  }
  
  override func bindOutput(viewModel: CommitListViewModelType) {
    let repositoryInfo = viewModel.outputs.repositoryInfo
    self.repositoryName.text = repositoryInfo.title
    self.repositoryDescription.text = repositoryInfo.description
    self.language.text = repositoryInfo.language
    self.starsCount.text = repositoryInfo.stars
    self.forkCount.text = repositoryInfo.commits
    
    viewModel.outputs.commit.drive(onNext: { (commit) in
      print(commit.commitMessage)
      self.commitMessage.text = commit.commitMessage
      self.branchName.text = commit.branchName
      self.author.text = commit.auther
      self.committedDateTime.text = commit.commitedDate
      self.authorAvatarImage.setImage(commit.autherAvatarURL)
    })
    .disposed(by: bag)
  }
}
