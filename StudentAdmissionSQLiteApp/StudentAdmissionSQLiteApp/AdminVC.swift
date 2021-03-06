//
//  AdminVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by IshaGhevariya on 15/07/21.
//

import UIKit

class AdminVC: UIViewController {

    let adminToken = UserDefaults.standard.string(forKey: "sesionAdmin")
       let adminName = UserDefaults.standard.string(forKey: "admin")
       
       
       private let add:UIButton = {
           let button = UIButton()
           button.setTitle("Add Student", for: .normal)
           button.addTarget(self, action: #selector(addstud), for: .touchUpInside)
        button.backgroundColor = .black
           button.layer.cornerRadius = 25
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

           return button
       }()
       
       

       
       private let noticeBoard:UIButton = {
           let button = UIButton()
           button.setTitle("Notice", for: .normal)
           button.addTarget(self, action: #selector(note), for: .touchUpInside)
           button.backgroundColor = .black
           button.layer.cornerRadius = 25
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           return button
       }()
       
       @objc private func addstud(){
           let asvc = StudentListVC()
           navigationController?.pushViewController(asvc, animated: true)
       }
       private let logout_btn:UIButton = {
           let button = UIButton()
           button.setTitle("Logout", for: .normal)
           button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
           button.backgroundColor = .black
           button.layer.cornerRadius = 25
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           return button
       }()
       
       @objc private func note(){
           let nt = NoticeVC()
           navigationController?.pushViewController(nt, animated: true)
       }
       
       @objc private func logoutTapped(){
           print("session clear")
           let lv = ViewController()
           navigationController?.pushViewController(lv, animated: true)
           
           
       }
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
    
          print("now into the admin page")
           
           view.addSubview(add)
           view.addSubview(noticeBoard)
           view.addSubview(logout_btn)
           let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "addmission")
           backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
           self.view.insertSubview(backgroundImage, at: 0)
       }
       

       
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           add.frame = CGRect(x: 40, y: 250, width: view.width - 80, height: 60)
           noticeBoard.frame = CGRect(x: 40, y: add.bottom + 10,  width: view.width - 80, height: 60)
           logout_btn.frame = CGRect(x: 40, y: noticeBoard.bottom + 10,  width: view.width - 80, height: 60)
       }
      
   }
