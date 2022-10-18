//
//  DetailViewModel.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/10.
//

import Foundation

import RxSwift
import RxCocoa

class DetailViewModel {
    struct Input {
        let model: Observable<AnyObject?>
    }
    
    struct Output {
        let accommodationModel = BehaviorRelay<AccommodationModel>(value: .init())
        let lunchBoxModel = BehaviorRelay<LunchBoxModel>(value: .init())
    }
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    private let output = Output()
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        input.model
            .subscribe { model in
                if let model = model as? AccommodationModel {
                    output.accommodationModel.accept(model)
                } else if let model = model as? LunchBoxModel {
                    output.lunchBoxModel.accept(model)
                }
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)

        return output
    }
    
    // MARK: - Private Methods
}
