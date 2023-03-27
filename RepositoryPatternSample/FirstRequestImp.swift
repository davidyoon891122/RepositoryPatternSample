//
//  FirstRequestImp.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation

enum RepositoryError: Error {
    case notFound
}

struct FirstRequestImp: Repository {
    typealias T = DomainUser
    
    private let service = UserService()
    
    func get(id: Int, completionHandler: @escaping (DomainUser?, Error?) -> Void) {
        service.requestService { result in
            switch result {
            case .success(let userInfo):
                print(userInfo)
                let domainUser = DomainUser(
                    name: userInfo.name,
                    street: userInfo.address.street,
                    city: userInfo.address.city,
                    postcode: userInfo.address.zipcode,
                    latitude: userInfo.address.geo.lat,
                    longitude: userInfo.address.geo.lng
                )
                
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
