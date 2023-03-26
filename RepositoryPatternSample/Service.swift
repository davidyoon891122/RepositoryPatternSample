//
//  Service.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func requestService(completion: @escaping ((User) -> ()))
}

class UserService: ServiceProtocol {
    func requestService(completion: @escaping ((User) -> ())) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
        
        AF.request(url, method: .get)
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    completion(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
