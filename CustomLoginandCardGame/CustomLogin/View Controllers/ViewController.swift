//
//  ViewController.swift
//  CustomLogin
//
//  Created by Mohamed Picault on 8/23/20.
//  Copyright © 2020 Mohamed Picault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
    }
    func setUpElement(){
        Utilities.styleHollowButton(loginButton)
        Utilities.styleFilledButton(signUpButton)
        
    }

    @IBAction func loginTapped(_ sender: Any) {
    }
    

    @IBAction func signUpButton(_ sender: Any) {
    }
}

