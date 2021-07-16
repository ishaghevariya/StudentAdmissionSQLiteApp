//
//  LoginVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by IshaGhevariya on 16/07/21.
//

import UIKit

class LoginVC: UIViewController {
    private let myImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "addmission")
            return imageView
        }()
        
        
        
        
        private let username_txt: UITextField = {
            let usr = UITextField()
       
            usr.textAlignment = .center
            usr.autocapitalizationType = .none
            usr.autocorrectionType = .no
            usr.font = UIFont(name: "", size: 20.0)
            usr.backgroundColor = .white
            usr.attributedPlaceholder = NSAttributedString(string: "USERNAME", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
            usr.layer.cornerRadius = 20
            
            return usr
            
        } ()
        
        

        
        private let password_txt: UITextField = {
            let psw = UITextField()
            psw.textAlignment = .center
            psw.autocorrectionType = .no
            psw.font = UIFont(name: "", size: 20.0)
            psw.isSecureTextEntry = true
            psw.backgroundColor = .white
            psw.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
            psw.layer.cornerRadius = 20
            return psw
            
            
            
        } ()
        
        
        
        private let login : UIButton = {
            let con = UIButton()

            con.setTitle("Login", for: .normal)
            con.addTarget(self, action: #selector(logginTapped), for: .touchUpInside)
            con.setTitleColor(.white, for: .normal)
            con.layer.cornerRadius = 25
            con.backgroundColor = .black
            return con
            
        } ()
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(myImageView)
            view.addSubview(username_txt)
            view.addSubview(password_txt)
            view.addSubview(login)
            view.backgroundColor = .white
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            self.view.backgroundColor = .white
            
            myImageView.frame = CGRect(x: 140, y:view.safeAreaInsets.top + 240, width: 100, height: 100)
            username_txt.frame = CGRect(x: 30, y: myImageView.bottom + 40 , width: view.width - 60, height: 40)
            password_txt.frame = CGRect(x: 30, y: username_txt.bottom + 5, width: view.width - 60, height: 40)
            login.frame = CGRect(x: 30, y: password_txt.bottom + 20, width: view.width - 60, height: 40)
        }
        

        @objc func logginTapped(){
            
            if username_txt.text == "admin" && password_txt.text == "admin"{
                
                UserDefaults.standard.setValue("adminsession", forKey: "sesionAdmin")
                UserDefaults.standard.setValue(username_txt.text, forKey: "admin")
                
                self.dismiss(animated: true)
            } else if username_txt.text == "student" && password_txt.text == "student"{
                
                UserDefaults.standard.setValue("studentsession", forKey: "sesionStudent")
                UserDefaults.standard.setValue(username_txt.text, forKey: "student")
                
                self.dismiss(animated: true)
            }
            
            
            else {
                
                let alert = UIAlertController(title: "Oops!", message: "Please Enter Valid Username And Password, Please Try Again..", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel))
                DispatchQueue.main.async {
                    self.present(alert,animated: true,completion: nil)
                }
                
            }
        }

    }
