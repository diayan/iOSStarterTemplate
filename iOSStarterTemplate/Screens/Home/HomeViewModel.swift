//
//  HomeViewmodel.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 16/11/2023.
//

import SwiftUI

public class HomeViewModel: ObservableObject {
    @Published public private(set) var counter = 0
    
    public func increment() {
        counter += 1
    }
}

