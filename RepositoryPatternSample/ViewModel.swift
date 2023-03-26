//
//  ViewModel.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation

protocol ViewModelInput {
    
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
}
