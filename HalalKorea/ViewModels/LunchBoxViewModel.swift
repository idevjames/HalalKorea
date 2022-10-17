//
//  LunchBoxViewModel.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import Foundation

import RxSwift
import RxCocoa

class LunchBoxViewModel {
    struct Input {
        let didLoad: Observable<Void>
        let itemSelected: ControlEvent<IndexPath>
        let loadMore: Observable<Bool>
    }
    
    struct Output {
        var models = BehaviorRelay<[LunchBoxModel]>(value: [])
        var selected = PublishSubject<LunchBoxModel>()
    }
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    private var models = BehaviorRelay<[LunchBoxModel]>(value: [])
    private var selectedModel = PublishSubject<LunchBoxModel>()
    private var startIndex: Int = 0
    private let fetchingCount: Int = 10
    private var isLoading: Bool = false
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        input.didLoad
            .flatMap { [weak self] in self!.fetch() }
            .do { [weak self] in self?.startIndex = $0.count }
            .bind(to: self.models)
            .disposed(by: disposeBag)
        
        input.itemSelected
            .compactMap { self.models.value[$0.row] }
            .bind(to: self.selectedModel)
            .disposed(by: disposeBag)
        
        input.loadMore
            .filter { $0 && !self.isLoading }
            .flatMap { [weak self] _ in self!.fetch() }
            .subscribe(onNext: { [weak self] newModels in
                guard let self = self else { return }
                
                self.models.accept(self.models.value + newModels)
                self.startIndex = newModels.count
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        return Output(models: self.models,
                      selected: self.selectedModel)
    }
    
    // MARK: - Private Methods
    private func fetch() -> Observable<[LunchBoxModel]> {
        return Observable.create { emitter in
            
            ParseService.shared.fetchObjects(startIndex: self.startIndex,
                                             count: self.fetchingCount) { (result: Result<[LunchBoxModel], Error>) in
                switch result {
                case .success(let models):
                    emitter.onNext(models)
                    print("### Fetching Data Count: \(models.count)")
                    
                case .failure(let error):
                    print("### Fetching Data Error: \(error.localizedDescription)")
                    emitter.onError(error)
                }
                
                self.isLoading = false
            }

            return Disposables.create()
        }
    }
}
