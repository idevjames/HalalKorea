//
//  ListViewController.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/07.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import RxViewController
import SnapKit
import Then

class ListViewController: UIViewController {
    // MARK: - Variables
    private let viewModel: ListViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    private lazy var listTableView = UITableView().then {
        $0.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        $0.estimatedRowHeight = 230
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
    }
    
    // MARK: - Initialize
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setLayouts()
        bindUI()
        bindViewModel()
    }
    
    private func bindUI() {
        
    }
    
    private func bindViewModel() {
        let output = viewModel.transform(
            ListViewModel.Input(
                didLoad: self.rx.viewDidAppear.take(1).mapToVoid()
            )
        )
                
        // Binding TableView Data
        output.models
            .bind(to: listTableView.rx.items(cellIdentifier: ListCell.identifier, cellType: ListCell.self)) { (row, model, cell) in
                cell.configure(model: model)
            }
            .disposed(by: disposeBag)
        
        listTableView.rx.itemSelected
    }
}

// MARK: - UI & Layouts
extension ListViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "List"
        
        view.addSubview(listTableView)
    }
    
    private func setLayouts() {
        listTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
