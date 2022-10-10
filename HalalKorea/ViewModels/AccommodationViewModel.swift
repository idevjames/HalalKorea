//
//  AccommodationViewModel.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/07.
//

import Foundation

import RxSwift
import RxCocoa

class AccommodationViewModel {
    struct Input {
        let didLoad: Observable<Void>
        let itemSelected: ControlEvent<IndexPath>
    }
    
    struct Output {
        var models = BehaviorRelay<[AccommodationModel]>(value: [])
        var selected = PublishSubject<AccommodationModel>()
    }
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    private let output = Output()
    private var models = BehaviorRelay<[AccommodationModel]>(value: [])
    private var selectedModel = PublishSubject<AccommodationModel>()
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        input.didLoad
            .flatMap { [weak self] in self!.fetch() }
            .subscribe { [weak self] models in
                self?.models.accept(models)
            } onError: { error in
                print("[fetching failed] \(error.localizedDescription)")
            }
            .disposed(by: disposeBag)

        input.itemSelected
            .compactMap { self.models.value[$0.row] }
            .subscribe(onNext: { model in
                self.selectedModel.onNext(model)
            }, onError: { error in
                print("[selected failed] \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
        
        return Output(models: self.models,
                      selected: self.selectedModel)
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
