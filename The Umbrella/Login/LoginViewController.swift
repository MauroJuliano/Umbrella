//
//  LoginViewController.swift
//  The Umbrella
//
//  Created by Lestad on 2021-01-03.
//  Copyright © 2021 Lestad. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var viewButton: UIView!
    @IBOutlet var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let back = UIColor(hexString: "#130f26")
        self.view.backgroundColor = back
        cardView.backgroundColor = back
        viewButton.roundCorners(.topLeft, radius: 60)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let uid = Auth.auth().currentUser?.uid {
         // goToFeed()
        }
    }
    @IBAction func registerButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController() as? RegisterViewController {
            present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func loginButton(_ sender: Any) {
        doLogin()
    }
    
    func doLogin(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] user, error in
            if error != nil{
                print("me")
                print(error!.localizedDescription)
                return
            }else{
                self!.goToFeed()
            }
        }
    }
    
    func goToFeed(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController{
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
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
