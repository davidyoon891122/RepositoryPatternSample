//
//  ViewController.swift
//  RepositoryPatternSample
//
//  Created by jiwon Yoon on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ViewModelType = ViewModel(service: UserService())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.inputs.requestUserInfo()
    }
}

