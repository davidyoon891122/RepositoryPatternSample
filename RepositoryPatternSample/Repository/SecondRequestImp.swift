//
//  SecondRequestImp.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation

struct SecondRequestImp: Repository {
    typealias T = DomainUser
    
    private let service = UserService()
    
    func get(id: Int, completionHandler: @escaping (DomainUser?, Error?) -> Void) {
        service.requestSecondService { result in
            switch result {
            case .success(let userInfo):
                guard let user = userInfo.results.first else {
                    completionHandler(nil, RepositoryError.notFound)
                    return
                }
                
                let domainUser = DomainUser(
                    name: "\(user.name.first) \(user.name.last)",
                    street: user.location.street.name,
                    city: user.location.city,
                    postcode: "\(user.location.postcode)",
                    latitude: user.location.coordinates.latitude, longitude: user.location.coordinates.longitude)
                completionHandler(domainUser, nil)
                
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
    func list(completionHandler: @escaping ([DomainUser]?, Error?) -> Void) {
        
    }
    
    func add(_ item: DomainUser, completionHandler: @escaping (Error?) -> Void) {
        
    }
    
    func delete(_ item: DomainUser, completionHandler: @escaping (Error?) -> Void) {
        
    }
    
    func edit(_ item: DomainUser, completionHandler: @escaping (Error?) -> Void) {
        
    }
}
