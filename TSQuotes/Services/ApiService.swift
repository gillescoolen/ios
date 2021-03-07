import Foundation
import Combine

final class ApiService {
  func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    return URLSession.shared.dataTaskPublisher(for: request)
        .map { response in
          response.data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
  }

  func getURL() -> URL {
    var components = URLComponents()

    components.scheme = "https"
    components.host = "api.taylor.rest"
    
    guard let url = components.url else {
        fatalError("Invalid URL.")
    }
    
    return url
  }
}

