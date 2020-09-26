//
//  HomeViewController.swift
//  CustomLogin
//
//  Created by Mohamed Picault on 8/23/20.
//  Copyright © 2020 Mohamed Picault. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButton(playButton)
    }
    
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let cardViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.cardViewController) as? CardViewController
           
        self.view.window?.rootViewController = cardViewController
        self.view.window?.makeKeyAndVisible()
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
