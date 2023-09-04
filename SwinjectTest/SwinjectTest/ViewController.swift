//
//  ViewController.swift
//  SwinjectTest
//
//  Created by Дмитрий Цветков on 08.08.2023.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    let container = Container()
    var threadSafeContainer: Resolver! // Потокобезопасность

    override func viewDidLoad() {
        super.viewDidLoad()
        
        threadSafeContainer = container.synchronize()
        
        container.register(TestService.self) { r in
            TestService(testService2: r.resolve(TestService2.self)!)
        }
        container.register(TestService2.self) { r in
            TestService2(testService3: r.resolve(TestService3.self)!)
        }
        container.register(TestService3.self) { r in
            TestService3()
        }
        
        .initCompleted { resolver, testService3 in
            testService3.testService = resolver.resolve(TestService.self)
        }
        
        let test = threadSafeContainer.resolve(TestService.self)
        test?.sayHello()
    }
}

