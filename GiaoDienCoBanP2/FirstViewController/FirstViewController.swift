//
//  FirstViewController.swift
//  GiaoDienCoBanP2
//
//  Created by Trần Văn Cam on 06/10/2022.
//

import UIKit

class FirstViewController: UIViewController {

    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view;
    } ()
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    } ()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    } ()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.textColor = .white
        textField.backgroundColor = .darkGray
        // add thêm pađding cho textField: leftView(Padding ben trai), rightView (padding ben phai)
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 16, height: 10))
        textField.leftViewMode = .always
        
//        textField.rightView = UIView(frame: .init(x: 0, y: 0, width: 16, height: 10))
//        textField.rightViewMode = .always
        
        // Hiện nút xoá sạch khi người dùng nhập (không có rightView)
        textField.clearButtonMode = .always
        
        
        return textField
    } ()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.textColor = .white
        textField.backgroundColor = .darkGray
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    let bottomTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .purple
        textView.textColor = .white
        return textView
    } ()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Title label"
        label.textAlignment = .center
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        
        // TextView va TextField sẽ có các phương thức kế thừa (Delegate), Label thì không có
        
        passwordTextField.delegate = self // Kế thừa các delegate của TextField
        emailTextField.delegate = self
        bottomTextView.delegate = self // Kế thừa các delegate của
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setupUI()
    }
    
    func setupUI() {
        view.addSubview(containerView)
        
        containerView.frame = view.bounds
        
        containerView.addSubview(greenView)
        greenView.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.size.height / 5)
        
        greenView.addSubview(titleLabel)
        titleLabel.frame = .init(x: 0, y: 0, width: 200, height: 50)
        titleLabel.center = greenView.center
        
        containerView.addSubview(blueView)
        blueView.frame = CGRect(x: 0, y: greenView.frame.maxY, width: greenView.bounds.width, height: greenView.bounds.height)
        
        containerView.addSubview(bottomTextView)
        bottomTextView.frame = .init(x: 0, y: containerView.frame.maxY - greenView.bounds.height, width: containerView.frame.width, height: greenView.bounds.height)
        
        containerView.addSubview(emailTextField)
        emailTextField.frame = .init(x: 32, y: blueView.frame.maxY + 50, width: containerView.bounds.width - 32*2, height: 60)
        
        containerView.addSubview(passwordTextField)
        passwordTextField.frame = .init(x: 0, y: emailTextField.frame.maxY + 16, width: emailTextField.frame.width, height: 60)
        passwordTextField.center.x = emailTextField.center.x
    }
    
}

// Extension: là phần mở rộng cho 1 đối tượng (struct, class, protocol, enum)
// không dùng để khai báo và lưu giá trị (biến hoặc hằng số) được

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // Hàm được gọi khi textField đã được xoá sạch text
        print("TextField did clear all")
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // Hàm này được họi khi nội dung cửa textField có sự thay đổi
        if textField == emailTextField {
            print("Email: \(textField.text ?? "")")
        } else {
            print("Password: \(textField.text ?? "")")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // khi nhấn return
        if textField == emailTextField {
            emailTextField.resignFirstResponder() // Dừng nhập liệu cho emailTextField
            passwordTextField.becomeFirstResponder() // Tiến hành nhập liệu cho passwordTextField
            
        }
        else
        {
            passwordTextField.resignFirstResponder() // Dừng nhập liệu, hạ bàn phím
            
            // dùng khi k xác định được đối tưong đang được nhập
            view.endEditing(true)
            
            
            print("Dang nhap ... ")
        }
        
        return true
    }
}

extension FirstViewController: UITextViewDelegate {
    
    
    func textViewDidChange(_ textView: UITextView) {
        // Gọi khi textView có sự thay đổi
        print(bottomTextView.text)
    }
    
    
}
// cmd + k: để ẩn hiện bàn phím
