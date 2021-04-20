import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"

let observable = Observable.just(1) // normal one value

let observable2 = Observable.of(1,2,3,4,5) // get values one by one sequentially

let observable3 = Observable.of([1,2,3,4,5]) // get the whole array

let observable4 = Observable.from([1,2,3,4,5]) // make a sequence observable from an array

// subscription

let disposeBag = DisposeBag()

observable4.subscribe { (event) in // subscribe will ge tthe event, not value
  if let element = event.element { // simply get an element
    print(element)
  }
}

observable3.subscribe { (event) in
  if let element = event.element {
    print(element)
  }
}

observable4.subscribe(onNext: { (element) in // subscribe for only next event
  print(element)
}).dispose() // to prevent memory leaking, we need to dispose the subscribe everytime

observable4.subscribe(onNext: { (element) in // subscribe for only next event
  print(element)
}).disposed(by: disposeBag)// use disposeBag to properly dispose


// create Observable

Observable<String>.create { (observer) -> Disposable in
  observer.onNext("A")
  observer.onCompleted() // by doing this, "?" wouldn't be in next event
  observer.onNext("?")
  
  return Disposables.create()
}.subscribe(onNext: { print($0)},
            onError: {print($0)},
            onCompleted: { print("Completed")},
            onDisposed: {print("Disposed")}
)

// Subject = is Observable and Observer itself

// PublishSubject = simple subject

let publishSubject = PublishSubject<String>()

publishSubject.onNext("Number 1") // make an event

publishSubject.subscribe { (event) in
  print(event) // in this case, Number 1 wouldn't be shown since we subscribed after subject's event
}

publishSubject.onNext("Number 2") // that subscription will get Number 2 and 3  as usual
publishSubject.onNext("Number 3")

publishSubject.dispose() // if we dispose, it will discontinue get the event

publishSubject.onNext("Number 4") // won't get Number 4 here


// BehaviorSubject = similar to publish but initial value is a must

let behaviorSubject = BehaviorSubject(value: "Init value") // it will be the first value when we subscribe if there's nothing changed

behaviorSubject.onNext("changed value") // if we change the value before subsription, the first value will be changed one

behaviorSubject.subscribe { (event) in
  print(event)
}

// ReplaySubject = replat the event based on bufferSize

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("One")
replaySubject.onNext("Two")
replaySubject.onNext("Three")

replaySubject.subscribe { // in this case they will get last 2 events based on bufferSize
  print($0)
}

// BehaviorRelay = built-in for RxCocoa, same as normal behavior subject but can have a value state

let behaviorRelay = BehaviorRelay(value: "init element")

behaviorRelay.asObservable().subscribe {
  print($0)
}

behaviorRelay.accept("Hi Relay") // append the value

print(behaviorRelay.value) // the state of relay, it is the latest value

behaviorRelay.accept(behaviorRelay.value + "the next one") // can be combined the old state and next state

///////////////////////////////

