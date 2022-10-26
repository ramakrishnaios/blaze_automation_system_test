//
//  APICallManager.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//


import Foundation
public enum Result<Success, Failure: Error> {
  /// A success, storing a `Success` value.
  case success(Success)
  /// A failure, storing a `Failure` value.
  case failure(Failure)
}

class APIService {
    func getData(apiEndPoint:String,completion : @escaping  (Result<OrganizationsResponse?, Error>) -> Void){
        guard let url = URL.init(string: BaseURLs.devURL + apiEndPoint) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(OrganizationsResponse.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
