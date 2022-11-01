//
//  MiceTourViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/01.
//

import UIKit
import ViewPager_Swift

class MiceTourViewController: UIViewController {
    // MARK: - UI Components
    private var viewPager: ViewPager!
    private var domesticViewController: MiceTourListViewController!
    private var foreignViewController: MiceTourListViewController!
    
    // MARK: - Variables
    private var tabs: [ViewPagerTab] = {
        return [ViewPagerTab(title: "Domestic", image: nil),
                ViewPagerTab(title: "Foreign", image: nil)]
    }()
    
    private var options: ViewPagerOptions = {
        let options = ViewPagerOptions()
        options.tabType = .basic
        options.distribution = .normal
        options.tabViewBackgroundDefaultColor = .white
        options.tabViewBackgroundHighlightColor = .white
        options.tabViewTextDefaultColor = .black
        options.tabViewTextHighlightColor = Asset.Colors.primaryGreen.color
        options.tabIndicatorViewBackgroundColor = Asset.Colors.primaryGreen.color
        
        return options
    }()
    
    // MARK: - Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "MICE Tour"
        view.backgroundColor = .white
        
        setLayouts()
        setChildViewController()
        setViewPager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setChildViewController() {
        domesticViewController = MiceTourListViewController(viewModel: MiceTourListViewModel(category: "Domestic"))
        foreignViewController = MiceTourListViewController(viewModel: MiceTourListViewModel(category: "Foreign"))
    }
    
    private func setViewPager() {
        viewPager = ViewPager(viewController: self)
        viewPager.setOptions(options: options)
        viewPager.setDataSource(dataSource: self)
        viewPager.setDelegate(delegate: self)
        viewPager.build()
    }
    
    private func setLayouts() {
        let screenWidth = UIScreen.main.bounds.width
        let attr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]
        let leftTabStringWidth = ("Domestic" as NSString).size(withAttributes: attr).width
        let rightTabStringWidth = ("Foreign" as NSString).size(withAttributes: attr).width
        let padding = (screenWidth - leftTabStringWidth - rightTabStringWidth) / 4
        
        options.tabViewPaddingLeft = padding
        options.tabViewPaddingRight = padding
    }
}

extension MiceTourViewController: ViewPagerDataSource {
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position:Int) -> UIViewController {
        return (position == 0) ? domesticViewController : foreignViewController
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
    }
    
    func startViewPagerAtIndex() -> Int {
        return 0
    }
}

extension MiceTourViewController: ViewPagerDelegate {
    func willMoveToControllerAtIndex(index:Int) {
    }
    
    func didMoveToControllerAtIndex(index: Int) {
    }

}
