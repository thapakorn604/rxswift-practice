//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Oat on 19/4/2564 BE.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let _: Observable  = Observable.from([1,2,3,4,5,6])
  }


}

