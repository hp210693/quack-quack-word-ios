//  MIT License
//
//  Copyright (c) 2021 Hung Phan
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(welcome)
        view.addSubview(input)
        view.addSubview(logo)
        view.addSubview(login)
    }
    
    func setupConstraints() {
        inputConstraint()
        welcomeConstraint()
        logoConstraint()
        loginConstraint()
    }

    func inputConstraint() {
        input.translatesAutoresizingMaskIntoConstraints = false
        input.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        input.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        input.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        input.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 25).isActive = true
        input.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func welcomeConstraint() {
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcome.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        welcome.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        welcome.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        welcome.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func logoConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.bottomAnchor.constraint(equalTo: welcome.topAnchor, constant: -25).isActive = true
        logo.widthAnchor.constraint(equalToConstant: screenSize.width - 120).isActive = true
        logo.heightAnchor.constraint(equalToConstant: screenSize.width - 120).isActive = true
    }
    
    func loginConstraint() {
        login.translatesAutoresizingMaskIntoConstraints = false
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        login.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        login.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        login.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 25).isActive = true
        login.heightAnchor.constraint(equalToConstant: 45).isActive = true
        login.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
    }
    
    @objc func loginClick(){
        print("login click")
        let background = BackgroundView()
        view.addSubview(background)
        let popup = PopUpView()
        view.addSubview(popup)
    }
    
    let input: UITextField = {
        let view = UITextField()
        view.placeholder = " Input something"
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 5.0
        view.textAlignment = .justified
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.borderColor = .none
        return view
    }()
    
    let welcome: UILabel = {
        let view = UILabel()
        view.text = "Quack Quack Word"
        view.textAlignment = .center
        return view
    }()
    
    let logo: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo.png"))
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 150
        view.clipsToBounds = true
        return view
    }()
    
    let login: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = .none
        return view
    }()
}

