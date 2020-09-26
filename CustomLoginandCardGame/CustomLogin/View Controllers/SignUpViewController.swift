//
//  SignUpViewController.swift
//  CustomLogin
//
//  Created by Mohamed Picault on 8/23/20.
//  Copyright © 2020 Mohamed Picault. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift


class SignUpViewController: UIViewController {
    

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 248/255, green: 167/255, blue: 27/255, alpha: 1)])
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 248/255, green: 167/255, blue: 27/255, alpha: 1)])
        emailTextField.attributedPlaceholder =  NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 248/255, green: 167/255, blue: 27/255, alpha: 1)])
        passwordTextField.attributedPlaceholder =  NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 248/255, green: 167/255, blue: 27/255, alpha: 1)])
        

    }

    //check the field and validate that everything is correct. If everything is correct, this method returns nil. However, if not correct will return the error message.
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " "{
            
            return "please fill in all the fields"
        }
        //Check if password is secure
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password) == false  {
            // Password isn't secured enough
            return "Please make sure password is 8 character long and contains a special character and a number."
        }

        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //validate fields
        let error = validateFields()
        
        if error != nil{
            //there is something wrong with the fields, show error message
            showError(error!)
        }
        else {
            //create clean version of the data fields
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    
                    //there was an error creating user
                    self.showError("Error creating user, try again!")
                    
                }
                else {
                    //user created successfully and stores first and last name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil{
                            //show error message
                            self.showError("User data couldn't ")
                        }
                    }
                    
                    //transition to the home screen
                    self.transitionToHome()
                    
                }
            }
            
            
        }
        
    }
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}

