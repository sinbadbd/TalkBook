//
//  NetworkService.swift
//  MovieZoo
//
//  Created by Imran on 2/9/23.
//

import Foundation
import Combine

public class ApiManager {
    
    static let shared = ApiManager()
    
    func request<T: Decodable>(_ endpoint: EndPointConvertible) -> AnyPublisher<T, Error> {
        
        var urlRequest = URLRequest(url: URL(string: endpoint.url)!)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.allHTTPHeaderFields = endpoint.headers
                
        if let parameters = endpoint.parameters {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                urlRequest.httpBody = jsonData
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        
        // Start monitoring network
        NetworkMonitor.shared.startMonitoring()
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ [self] (data, response) -> Data in
                if let response = response as? HTTPURLResponse,
                   (200..<300).contains(response.statusCode) == false {
                    throw SessionError.statusCode(response)
                }
                appendData(data, urlRequest: urlRequest)
                return data
            })
            .mapError { error -> APIError in
                print("✅ URL:- \(urlRequest):- \(error)")
                return APIError.encodingError(error.localizedDescription)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
