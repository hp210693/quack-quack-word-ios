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

protocol PopUpViewDelegate {
    func dismissView()
}

class BackgroundView: UIView{
    init() {
        super.init(frame: screenSize)
        self.backgroundColor = .black
        self.alpha = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismissView() {
         print("Dismiss BackgroundView")
         self.removeFromSuperview()
    }
}

class PopUpView: UIView, UIGestureRecognizerDelegate {
    
    init() {
        super.init(frame: screenSize)
        self.backgroundColor = .none
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissPopup))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(subView)
        subView.addSubview(quack)
        subView.addSubview(message)
        subView.addSubview(table)
    }
    
    func setupConstraints() {
        subViewConstraint()
        quackConstraint()
        messageConstraint()
        tableConstraint()
    }
    
    func subViewConstraint() {
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        subView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        subView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        let height: CGFloat = 40
        subView.topAnchor.constraint(equalTo: self.topAnchor, constant: height).isActive = true
    }
    
    func quackConstraint() {
        quack.translatesAutoresizingMaskIntoConstraints = false
        quack.widthAnchor.constraint(equalToConstant: 140).isActive = true
        quack.heightAnchor.constraint(equalToConstant: 140).isActive = true
        quack.centerXAnchor.constraint(equalTo: subView.centerXAnchor).isActive = true
        quack.topAnchor.constraint(equalTo: subView.topAnchor, constant: 5).isActive = true
    }
    
    func messageConstraint() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.heightAnchor.constraint(equalToConstant: 45).isActive = true
        message.topAnchor.constraint(equalTo: quack.bottomAnchor, constant: 10).isActive = true
        message.centerXAnchor.constraint(equalTo: subView.centerXAnchor).isActive = true
    }
    
    func tableConstraint() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.centerXAnchor.constraint(equalTo: subView.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 10).isActive = true
        table.heightAnchor.constraint(equalToConstant: 300).isActive = true
        table.widthAnchor.constraint(equalTo: subView.widthAnchor).isActive = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        table.delegate = self
        table.dataSource = self
    }
    
    @objc func dismissPopup() {
        print("Dismiss PopupView")
        self.removeFromSuperview()
        self.delegate?.dismissView()
    }
    
    var delegate: PopUpViewDelegate?
    
    let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    let quack: UIImageView = {
        let view = UIImageView(image: UIImage(named: "quack.png"))
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 70
        view.clipsToBounds = true
        return view
    }()
    
    let message: UILabel = {
        let view = UILabel()
        view.text = "Say together quack quack"
        view.textAlignment = .center
        return view
    }()
    
    let table: UITableView = {
        let view = UITableView()
        return view
    }()
    
    let animals: [String] = ["Cat", "Dog", "Duck", "Bear", "Fish", "Fox","Ass","Bat", "Baboom","Crab","Crane","Humans"]
    let cellReuseIdentifier = "cell"
}

extension PopUpView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = table.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as UITableViewCell
        cell.textLabel?.text = animals[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello: \(animals[indexPath.row])")
    }
}
