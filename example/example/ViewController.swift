//
//  ViewController.swift
//  example
//
//  Created by Jorge Izquierdo on 4/28/16.
//  Copyright © 2016 Jorge Izquierdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = AppStrings.Title.localized
        mainLabel.text = AppStrings.View.Hello.localized
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

