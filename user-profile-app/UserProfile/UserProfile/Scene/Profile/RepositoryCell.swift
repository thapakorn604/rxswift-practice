//
//  RepositoryCell.swift
//  UserProfile
//
//  Created by Oat on 7/4/2564 BE.
//

import UIKit

class RepositoryCell: UITableViewCell {
  @IBOutlet weak var repositoryName: UILabel!
  @IBOutlet weak var repositoryDescription: UILabel!
  @IBOutlet weak var language: UILabel!
  @IBOutlet weak var starsCount: UILabel!
  @IBOutlet weak var forkCount: UILabel!
  @IBOutlet weak var wrapView: UIView!
  
  override func awakeFromNib() {
    self.selectionStyle = .none
  }
  
  func bind(to viewModel: RepositoryViewModel) {
    self.repositoryName.text = viewModel.title
    self.repositoryDescription.text = viewModel.description
    self.language.text = viewModel.language
    self.starsCount.text = viewModel.stars
    self.forkCount.text = viewModel.commits
  }
}
