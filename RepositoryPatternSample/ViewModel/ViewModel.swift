//
//  ViewModel.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation

protocol ViewModelInput {
    func requestUserInfo()
}

protocol ViewModelOutput {
    
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

class ViewModel: ViewModelType, ViewModelInput, ViewModelOutput {
    var inputs: ViewModelInput { self }
    var outputs: ViewModelOutput { self }
    
    var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }

    func requestUserInfo() {
        service.requestService { userInfo in
            print(userInfo.name)
            print(userInfo.address.street)
            print(userInfo.address.city)
            print(userInfo.address.zipcode)
            print(userInfo.address.geo.lat)
            print(userInfo.address.geo.lng)
        }
        
        service.requestSecondService { userInfo in
            if let user = userInfo.results.first {
                print("\(user.name.first) \(user.name.last)")
                print(user.location.street.name)
                print(user.location.city)
                print(user.location.postcode)
                print(user.location.coordinates.latitude)
                print(user.location.coordinates.longitude)
            }
        }
        
    }
}
