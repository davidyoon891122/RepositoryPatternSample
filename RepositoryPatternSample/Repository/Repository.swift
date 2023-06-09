//
//  Repository.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import Foundation
import Combine

protocol Repository {
    associatedtype T
    
    func get(id: Int, completionHandler: @escaping (T?, Error?) -> Void)
    func list(completionHandler: @escaping ([T]?, Error?) -> Void)
    func add(_ item: T, completionHandler: @escaping (Error?) -> Void)
    func delete(_ item: T, completionHandler: @escaping (Error?) -> Void)
    func edit(_ item: T, completionHandler: @escaping (Error?) -> Void)
}


protocol CombineRepository {
    associatedtype T
    
    func get(id: Int) -> AnyPublisher<T, Error>
    func list() -> AnyPublisher<[T], Error>
    func add(_ item: T) -> AnyPublisher<Void, Error>
    func delete(_ item: T) -> AnyPublisher<Void, Error>
    func edit(_ item: T) -> AnyPublisher<Void, Error>
}
