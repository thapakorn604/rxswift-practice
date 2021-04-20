import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let strikes = PublishSubject<String>()

// Ignore = ignore all elements

strikes
  .ignoreElements()
  .subscribe { (_) in
    print()
  }

