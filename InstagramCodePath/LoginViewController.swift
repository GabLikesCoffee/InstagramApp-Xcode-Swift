//
//  LoginViewController.swift
//  InstagramCodePath
//
//  Created by Gabby Santiago on 10/6/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSIgnIn(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            if (user != nil){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Could not sign in! \(error?.localizedDescription ?? "error came up nil")")
            }
            
        }
        
    }
    
    @IBAction func onSIgnUp(_ sender: Any) {
        
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if(success){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Could not sign up! \(error?.localizedDescription ?? "error came up nil")")
            }
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
