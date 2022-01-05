
import Foundation
import Alamofire
import SwiftUI


enum EndpointError: Error {
    case parsingModel
}

@frozen enum YGOApiResult<Success, Failure> {
    
    /// A success, storing a `Success` value.
    case success(Success)
    
    /// A failure, storing a `Failure` value.
    case failure(Failure)
    
}

class ApiService {
    public var chuck: ApiChuck
    
    private var baseURL = "https://api.chucknorris.io/jokes/random"
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.waitsForConnectivity = true
        
        return Session(
            configuration: configuration
            //   interceptor: WrApiRequestInterceptor()
            //uncomment this line if you want to debug API response on console
            //eventMonitors: [WrApiNetworkLogger()]
        )
    }()
    
    enum RemoteResourceError: Error {
        case notFound
        case notAbleToDeserialize
    }
    
    enum ApiError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    
    public static var shared: ApiService = ApiService()
    
    private init() {
        chuck = ApiChuck()
        
    }
    
    func get<T: Decodable>(
       // endpoint: String,
       // headers: HTTPHeaders,
        completion: @escaping (Result<T, Error>) -> Void
    ) async throws {
        let urlString = baseURL
        
        guard let url = URL(string: urlString) else {
            //completion(.failure(ApiError.invalidURL))
            throw ApiError.invalidURL
        }
        
        
        AF.request(
            url,
            method: .get
        )
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completion(.success(decodedResponse))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        
    }
}
