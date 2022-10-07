//
//  ListViewModel.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/07.
//

import Foundation

import RxSwift
import RxCocoa

class ListViewModel {
    struct Input {
        let didLoad: Observable<Void>
        let itemSelected: ControlEvent<Void>
    }
    
    struct Output {
        let models = BehaviorRelay<[AccommodationModel]>(value: [])
    }
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    private let output = Output()
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        input.didLoad
            .flatMap { [weak self] in self!.fetch() }
            .bind(to: output.models)
            .disposed(by: disposeBag)
        
        return output
    }
    
    // MARK: - Private Methods
    private func fetch() -> Observable<[AccommodationModel]> {
        return Observable.create { emitter in
            ParseService.shared.fetchObjects { (result: Result<[AccommodationModel], Error>
) in
                switch result {
                case .success(let dtos):
                    emitter.onNext(dtos)
                    
                case .failure(let error):
                    emitter.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
