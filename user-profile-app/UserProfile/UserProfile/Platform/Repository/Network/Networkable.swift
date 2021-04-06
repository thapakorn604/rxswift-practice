
import Foundation
import RxSwift

protocol Networkable {
  func call<T: Codable>(_ request: Request) -> Observable<T>
}

final class AlamofireNetwork: Networkable {
  private let baseUrl: URL
  
  public init() {
    baseUrl = URL(string: "https://api.github.com/")!
  }
  
  func call<T>(_ request: Request) -> Observable<T> where T : Decodable, T : Encodable {
    let baseUrl = self.baseUrl
    return .create { (observer) -> Disposable in
      
      let task = URLSession.shared.dataTask(with: request.makeRequest(baseUrl: baseUrl)) { (data, response, error) in
        
        do {
          
          guard let data = data else {
            observer.onError(NSError())
            return
          }
          
          let entity = try JSONDecoder().decode(T.self, from: data)
          observer.onNext(entity)
          observer.onCompleted()
          
        } catch {
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

