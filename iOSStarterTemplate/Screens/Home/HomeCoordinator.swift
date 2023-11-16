//
//  HomeCoordinator.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 16/11/2023.
//

import SwiftUI

public class HomeCoordinator: Coordinator {
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public var rootViewController: UIViewController?
    private lazy var viewModel = HomeViewModel()
    
    public func start() {
        let rootController = UIHostingController(
            rootView: HomeView(viewModel: self.viewModel)
        )
        rootController.title = "Home"
        self.rootViewController = rootController
    }
}
