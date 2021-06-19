//
//  ViewController.swift
//  DataStructureAndAlgorithms
//
//  Created by mac on 19/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    func setup(){
        var arr = [1,2,3,4,5,6,7,8,9,10]
        let status = Linear.search(arr: &arr, item: 11)
        print(status)
    }

}

