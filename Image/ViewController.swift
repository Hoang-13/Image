//
//  ViewController.swift
//  Image
//
//  Created by Nguyen Hoang Viet on 17/09/2021.
//

import UIKit
import Firebase
import Toast_Swift
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtTaiKhoan: UITextField!
    @IBOutlet weak var txtMatKhau: UITextField!
    
    @IBAction func OnTapForgotPassword(_ sender: Any) {
        let vc = ForgotPasswordVC(nibName: "ForgotPasswordVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnTapDangNhap(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtTaiKhoan.text!, password: txtMatKhau.text!) { audata1, error in
            if error != nil
            {
                self.view.makeToast(error!.localizedDescription)
            }
            else
            {
                let vc = IndexPageVC(nibName: "IndexPageVC", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    
    }
    
    @IBAction func OnTapDangKi(_ sender: Any) {
//        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
//         navigationController?.pushViewController(vc, animated: true)
        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

