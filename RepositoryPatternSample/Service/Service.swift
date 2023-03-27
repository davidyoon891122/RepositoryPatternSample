//
//  Service.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func requestService(completion: @escaping ((Result<User, AFError>) -> Void))
    func requestSecondService(completion: @escaping ((Result<Users, AFError>) -> ()))
}

class UserService: ServiceProtocol {
    func requestService(completion: @escaping ((Result<User, AFError>) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
        
        AF.request(url, method: .get)
            .responseDecodable(of: User.self) { response in
                completion(response.result)
            }
    }
    
    func requestSecondService(completion: @escaping ((Result<Users, AFError>) -> ())) {
        let url = URL(string: "https://randomuser.me/api/")!
        
        AF.request(url, method: .get)
            .responseDecodable(of: Users.self) { response in
                completion(response.result)
            }
    }
}
