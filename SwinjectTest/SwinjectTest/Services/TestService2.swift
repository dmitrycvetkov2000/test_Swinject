//
//  TestService2.swift
//  SwinjectTest
//
//  Created by Дмитрий Цветков on 08.08.2023.
//

import Foundation

class TestService2 {
    private let testService3: TestService3?

    init(testService3: TestService3) {
        self.testService3 = testService3
    }
    
    func sayHello() {
        print("Hello2 from test")
    }
}
