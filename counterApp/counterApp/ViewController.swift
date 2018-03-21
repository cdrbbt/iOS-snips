//
//  ViewController.swift
//  counterApp
//
//  Created by iosdev on 20.3.2018.
//  Copyright © 2018 cdrbbt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.s
        display.text = String(count)
    }
    @IBOutlet weak var step: UISlider!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func decrement(_ sender: UIButton) {
        count -= Int(step.value)
        display.text = String(count)
    }
    
    @IBAction func inciment(_ sender: UIButton) {
        count += Int(step.value)
        display.text = String(count)
    }
    @IBAction func reset(_ sender: UIButton) {
        count = 0
        display.text = String(count)
    }
}

