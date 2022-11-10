//
//  MiceTourListViewModel.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/01.
//

import Foundation
import RxSwift
import RxCocoa

class MiceTourListViewModel {
    struct Input {
        let didLoad: Observable<Void>
        let itemSelected: ControlEvent<IndexPath>
        let loadMore: Observable<Bool>
    }
    
    struct Output {
        var models = BehaviorRelay<[MiceTourModel]>(value: [])
        var selected = PublishSubject<MiceTourModel>()
    }
    
    // MARK: - Variables
    private let category: String
    private let disposeBag = DisposeBag()
    private var models = BehaviorRelay<[MiceTourModel]>(value: [])
    private var selectedModel = PublishSubject<MiceTourModel>()
    private var startIndex: Int = 0
    private let fetchingCount: Int = 10
    private var isLoading: Bool = false
    private var isNoMore: Bool = false
    
    init(category: String) {
        self.category = category
    }
    
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
            .filter { $0 && !self.isLoading && !self.isNoMore }
            .flatMap { [weak self] _ in self!.fetch() }
            .subscribe(onNext: { [weak self] newModels in
                guard let self = self else { return }
                
                self.models.accept(self.models.value + newModels)
                self.startIndex += newModels.count
                
                if newModels.count == 0 {
                    self.isNoMore = true
                }
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        return Output(models: self.models,
                      selected: self.selectedModel)
    }
    
    // MARK: - Private Methods
    private func fetch() -> Observable<[MiceTourModel]> {
        return Observable.create { [weak self] emitter in
            guard let self = self else { return Disposables.create() }
            
            ParseService.shared.fetchObjects(startIndex: self.startIndex,
                                             count: self.fetchingCount,
                                             compareColumn: "col_mice_category",
                                             compareValue: self.category) { (result: Result<[MiceTourModel], Error>) in
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