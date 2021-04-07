
import Foundation
import RxSwift

protocol Networkable {
  func call<T: Codable>(_ request: Request) -> Observable<T>
}

final class URLSessionNetwork: Networkable {
  private let baseUrl: URL
  
  public init() {
    baseUrl = URL(string: "https://api.github.com/")!
  }
  
  func call<T: Codable>(_ request: Request) -> Observable<T> {
    let baseUrl = self.baseUrl
    print(request.makeRequest(baseUrl: baseUrl))
    return .create { (observer) -> Disposable in
      
      let task = URLSession.shared.dataTask(with: request.makeRequest(baseUrl: baseUrl)) { (data, response, error) in
        
        do {
          
          guard let data = data else {
            print("onError")
            observer.onError(NSError())
            return
          }
          
          let decoder: JSONDecoder = JSONDecoder()
          let entity: T = try decoder.decode(T.self, from: data)
          print("onNext")
          observer.onNext(entity)
          observer.onCompleted()
          
        } catch {
          print("onCatch: \(error.localizedDescription)")
          debugPrint(error)
          observer.onError(error)
        }
      }
      
      
      task.resume()
      
      return Disposables.create {
        task.cancel()
      }
    }
  }
}

