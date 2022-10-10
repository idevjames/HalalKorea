//
//  AccommodationViewController.swift
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

class AccommodationViewController: UIViewController {
    // MARK: - Variables
    private let viewModel: AccommodationViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    private lazy var listTableView = UITableView().then {
        $0.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        $0.estimatedRowHeight = 230
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
    }
    
    // MARK: - Initialize
    init(viewModel: AccommodationViewModel) {
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
            AccommodationViewModel.Input(
                didLoad: self.rx.viewDidAppear.take(1).mapToVoid(),
                itemSelected: listTableView.rx.itemSelected
            )
        )
                
        // 배열로 전달받은 모델 (객체)를 테이블뷰와 바인딩
        output.models
            .bind(to: listTableView.rx.items(cellIdentifier: ListCell.identifier, cellType: ListCell.self)) { (row, model, cell) in
                cell.configure(model: model)
            }
            .disposed(by: disposeBag)
        
        // 테이블뷰에서 선택된 모델 (객체)의 정보 전달
        output.selected
            .map {
                DetailViewController(viewModel: .init(), model: $0)
            }
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.navigationController?.pushViewController($0, animated: true)
            })
            .disposed(by: disposeBag)
            
    }
}

// MARK: - UI & Layouts
extension AccommodationViewController {
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
