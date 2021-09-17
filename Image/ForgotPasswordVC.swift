//
//  ForgotPasswordVC.swift
//  Image
//
//  Created by Nguyen Hoang Viet on 17/09/2021.
//

import UIKit
import Firebase
import Toast_Swift

class ForgotPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBOutlet weak var txtTaiKhoan: UITextField!
    
    @IBAction func OnTapForgotPs(_ sender: Any) {
        view.endEditing(true)
        if( txtTaiKhoan.text == "")
        {
            self.view.makeToast("Mời bạn điền đầy đủ thông tin")
        }
        else
        {
            Auth.auth().sendPasswordReset(withEmail: txtTaiKhoan.text!) { erros in
                if erros != nil
                {
                    self.view.makeToast(erros!.localizedDescription)
                }
                else
                {
                    self.view.makeToast("Send verication")
                }
            }
        }

    }
    

}
