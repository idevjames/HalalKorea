//
//  StoreViewController.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/26.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import RxViewController
import SnapKit
import Then

class StoreViewController: UIViewController {
    
    // MARK: - Varibles
    private let disposeBag = DisposeBag()

    // MARK: - UI Components
    private lazy var contentView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 20.0
    }
    
    private lazy var cosmeticsView = UIImageView().then {
        $0.image = Asset.Images.cosmetics.image
        $0.contentMode = .scaleToFill
        $0.tag = 111
    }
    
    private lazy var cosmeticsLabel = UILabel().then {
        $0.text = "Cosmetics"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 19, weight: .semibold)
        $0.tag = 111
    }
    
    private lazy var fashionView = UIImageView().then {
        $0.image = Asset.Images.fashion.image
        $0.contentMode = .scaleToFill
        $0.tag = 222
    }
    
    private lazy var fashionLabel = UILabel().then {
        $0.text = "Fashion"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 19, weight: .semibold)
        $0.tag = 222
    }
    
    private lazy var foodView = UIImageView().then {
        $0.image = Asset.Images.food.image
        $0.contentMode = .scaleToFill
        $0.tag = 333
    }
    
    private lazy var foodLabel = UILabel().then {
        $0.text = "Food"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 19, weight: .semibold)
        $0.tag = 333
    }
    
    private lazy var bioView = UIImageView().then {
        $0.image = Asset.Images.bio.image
        $0.contentMode = .scaleToFill
        $0.tag = 444
    }
    
    private lazy var bioLabel = UILabel().then {
        $0.text = "Bio"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 19, weight: .semibold)
        $0.tag = 444
    }
    
    private lazy var medicinesView = UIImageView().then {
        $0.image = Asset.Images.medicines.image
        $0.contentMode = .scaleToFill
        $0.tag = 555
    }
    
    private lazy var medicinesLabel = UILabel().then {
        $0.text = "Medicines"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 19, weight: .semibold)
        $0.tag = 555
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setLayouts()
        bindUI()
    }
    
    private func bindUI() {
        // Binding Button Event
        Observable.merge(
            cosmeticsView.rx.tapGesture().when(.recognized),
            fashionView.rx.tapGesture().when(.recognized),
            foodView.rx.tapGesture().when(.recognized),
            bioView.rx.tapGesture().when(.recognized),
            medicinesView.rx.tapGesture().when(.recognized)
        )
        .compactMap { $0.view?.tag }
        .asDriverComplete()
        .drive(onNext: { [weak self] in self?.moveToChild($0) })
        .disposed(by: disposeBag)
    }
    
    // MARK: - Routings
    private func moveToChild(_ tag: Int) {
        let labels = [cosmeticsLabel, fashionLabel, foodLabel, bioLabel, medicinesLabel]
        
        guard let title = labels.filter({ $0.tag == tag }).first?.text else { return }
        
        let storeListViewController = StoreListViewController(viewModel: StoreListViewModel(), title: title)
        self.navigationController?.pushViewController(storeListViewController, animated: true)
    }
}

extension StoreViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Store"
        
        view.addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(cosmeticsView)
        stackView.addArrangedSubview(fashionView)
        stackView.addArrangedSubview(foodView)
        stackView.addArrangedSubview(bioView)
        stackView.addArrangedSubview(medicinesView)
        
        cosmeticsView.addSubview(cosmeticsLabel)
        fashionView.addSubview(fashionLabel)
        foodView.addSubview(foodLabel)
        bioView.addSubview(bioLabel)
        medicinesView.addSubview(medicinesLabel)
    }
    
    private func setLayouts() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        cosmeticsLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        fashionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        foodLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bioLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        medicinesLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
