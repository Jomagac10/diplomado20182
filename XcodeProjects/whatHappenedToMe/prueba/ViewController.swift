//
//  ViewController.swift
//  prueba
//
//  Created by markmota on 2/24/18.
//  Copyright © 2018 markmota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // > Changed UITextField to UILabel, added @IB reference.
    @IBOutlet weak var outtletText: UILabel!
    @IBOutlet weak var aoutletButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aoutletButton.setTitle("Touch me!", for: .normal)
    }

    //Added @IB reference.
    @IBAction func actionButton(_ sender: UIButton) {
        outtletText.text = "You are a genius "
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

