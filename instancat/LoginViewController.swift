//
//  LoginViewController.swift
//  instancat
//
//  Created by Raul Aliaga Shapiama on 11/21/19.
//  Copyright © 2019 RaulAliaga. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginClickButton(_ sender: Any) {
        print("log in")
        
        if(usernameTextField.text != "" && passwordTextField.text != ""){
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!){
                (user, err) in
                
                if( user != nil){
                    print("user authenticated")
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                } else {
                    print("there was an error")
                    self.errorLabel.isHidden = false
                }
            }
        } else {
            print("complete the boxes")
            self.errorLabel.isHidden = false
        }
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
