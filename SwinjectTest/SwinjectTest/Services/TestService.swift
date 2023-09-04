//
//  TestService.swift
//  SwinjectTest
//
//  Created by Дмитрий Цветков on 08.08.2023.
//

import Foundation

class TestService {    
    private let testService2: TestService2?

    init(testService2: TestService2) {
        self.testService2 = testService2
    }
    
    func sayHello() {
        print("Hello from test")
    }
}


