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
        let accommodationModel = BehaviorSubject<AccommodationModel>(value: .init())
    }
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    private let output = Output()
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        input.model
            .subscribe { model in
                guard let model = model as? AccommodationModel else { return }
                
                output.accommodationModel.onNext(model)
            } onError: { error in
                output.accommodationModel.onError(error)
            }
            .disposed(by: disposeBag)

        return output
    }
    
    // MARK: - Private Methods
}
