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
    
    let repository = FirstRequestImp()
    let secondRepository = SecondRequestImp()

    func requestUserInfo() {
        repository.get(id: 1) { (user, error) in
            if let error = error {
                print(error)
            }
            
            if let user = user {
                print(user.name)
                print(user.street)
                print(user.city)
                print(user.postcode)
                print(user.latitude)
                print(user.longitude)
            }
        }
        
        secondRepository.get(id: 1) { (user, error) in
            if let error = error {
                print(error)
            }
            
            if let user = user {
                print(user.name)
                print(user.street)
                print(user.city)
                print(user.postcode)
                print(user.latitude)
                print(user.longitude)
            }
            
        }
    }
}
