//
//  ViewController.swift
//  CardGame
//
//  Created by Mohamed Picault on 8/17/20.
//  Copyright © 2020 Mohamed Picault. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore: Int = 0
    var rightScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func dealTapped(_ sender: Any) {
        //randomize numbers
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)

        //Updates card image
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named:"card\(rightNumber)")
        
        //Compares random card numbers
        if leftNumber > rightNumber{
            //player wins the deal
            leftScore += 1
            leftScoreLabel.text = "\(leftScore)"
        }
        else if leftNumber < rightNumber{
            //CPU wins the deal
            rightScore += 1
            rightScoreLabel.text = "\(rightScore)"
        }
        else{
             //A tie
        }
    }
    

}

