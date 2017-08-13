//
//  ViewController.swift
//  GenericMapper
//
//  Created by Gabriel vieira on 8/13/17.
//  Copyright © 2017 Gabriel vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let obj = GenericObjectMapper.withJsonFile(fileName: "mock", ofType: Temperature.self) {
            print(obj)
        }
        
        let jsonString = "{ \"celsius\": 42.5, \"fahrenheit\": 56.5 }"
        if let obj = GenericObjectMapper.withJson(jsonString: jsonString, ofType: Temperature.self) {
            print(obj.fahrenheit ?? " ")
            print(obj.celsius ?? " ")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

