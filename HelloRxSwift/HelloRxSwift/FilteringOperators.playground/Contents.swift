import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let ignoreSubject = PublishSubject<String>()

// IgnoreElements = ignore all elements, cool  when we don't care the actual result, just want to trigger the subscription

ignoreSubject
  .ignoreElements()
  .subscribe { (_) in
    print("subscription is called")
  }
  .disposed(by: disposeBag)

ignoreSubject.onNext("A") // the next event will be there but element wont' be
ignoreSubject.onNext("B")

// ElementAt(i) = get only the defined element from the sequence (base on index)

let elementAtSubject = PublishSubject<String>()
elementAtSubject.elementAt(2)
  .subscribe(onNext: { (element) in
    print("you are out \(element)")
  })
  .disposed(by: disposeBag)

elementAtSubject.onNext("X")
elementAtSubject.onNext("Y")
elementAtSubject.onNext("Z") // get only Z (2nd index)
elementAtSubject.onNext("T")

// filter = filter and pass the element based on the condition

let filterObservable = Observable.of(1,2,3,4,5,6,7)
filterObservable.filter { (element) -> Bool in
  element % 2 == 0
}
.subscribe(onNext: { print($0) }) // the element will be held by 2,4 and 6 as the condition
.disposed(by: disposeBag)

// Skip = skip the element by defining number

let skipObservable = Observable.of("A", "B", "C", "D", "E", "F")
skipObservable.skip(3)
  .subscribe(onNext: {
    print($0) // will skip 3 times then print the element, would start by D
  })
  .disposed(by: disposeBag)

// Skip while = continue skipping if the condition is still true

let skipWhileObservale = Observable.of(2,2,2,3,4,5,6,7)
skipWhileObservale.skipWhile { (element) -> Bool in
  element % 2 == 0
}
.subscribe(onNext: { print($0) }) // since 2 is even so, it will start from 3 (condition doesn't match)
.disposed(by: disposeBag)

// Skip Until = skip and waiting for trigger

let skipUntilSubject = PublishSubject<String>()
let triggerSubject = PublishSubject<String>()

skipUntilSubject.skipUntil(triggerSubject)
  .subscribe(onNext: { print($0)})
  .disposed(by: disposeBag)

skipUntilSubject.onNext("A")
skipUntilSubject.onNext("B")
skipUntilSubject.onNext("C") // these won't be get since the trigger is still no subscription

triggerSubject.onNext("X")
triggerSubject.onNext("Y")
triggerSubject.onNext("Z") // the trigger is get nexr event but didn't get anything since no subscription

skipUntilSubject.onNext("D") // this value will be on next event and show on skipUntil since trigger got the event

// take = take the most first element as the defined number

let takeObservable = Observable.of(1,2,3,4,5,6)
takeObservable.take(3)
  .subscribe(onNext: { print($0) }) // only 1,2 and 3 will be printed
  .disposed(by: disposeBag)

// takeWhile = take the element based on condition, if once it doesn't match then stop taking

let takeWhileObservable = Observable.of(2,4,6,7,8,10)
takeObservable.takeWhile { (element) -> Bool in
  element % 2 == 0
}
.subscribe(onNext: { print($0) }) // 2,4 and 6 will be printed then dismiss
.disposed(by: disposeBag)

// takeUntil = take the element until the trigger on

let takeUntilSubject = PublishSubject<String>()
let takeTriggerSubject = PublishSubject<String>()

takeUntilSubject.takeUntil(takeTriggerSubject)
  .subscribe(onNext: { print($0) })
  .disposed(by: disposeBag)

takeUntilSubject.onNext("Q")
takeUntilSubject.onNext("W") // take those

takeTriggerSubject.onNext("L") // triggered

takeUntilSubject.onNext("E") // E won't be an event since the tigger is already on

