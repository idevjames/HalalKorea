//
//  BaseViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

import RxSwift
import RxCocoa
import RxRelay

class BaseViewController<VM: BaseViewModel, C: Coordinator>: UIViewController {

    // MARK: - Variables
    var disposeBag = DisposeBag()
    let viewModel: VM
    weak var coordinator: C?
    
    // MARK: - Initialize
    init(viewModel: VM, coordinator: C) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.setNeedsUpdateConstraints()
        
        setupUI()
        bindViewModel()
    }

    func setupUI() {
        
    }
    
    func bindViewModel() {
    
    }
}
