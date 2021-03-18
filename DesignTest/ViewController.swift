//
//  ViewController.swift
//  SnapKit
//
//  Created by Илья on 18/03/2021.
//  Copyright © 2021 Stdio. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialie()
    }
    
    private func initialie() {
        //Color Literal
        view.backgroundColor = #colorLiteral(red: 0.8151275385, green: 0.8477837883, blue: 0.9620751739, alpha: 1)
        //view.backgroundColor = UIColor(hex: "#FAFAFAFA")
        let label = UILabel()
        label.text = "🤡 Welcome to the club, buddy"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        label.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(50)
            maker.top.equalToSuperview().inset(150)
        }
        
        let extraLabel = UILabel()
        extraLabel.text = "Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extr a text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text "
        extraLabel.numberOfLines = 0
        view.addSubview(extraLabel)
        extraLabel.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(50)
            maker.top.equalTo(label).inset(50)
        }
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hex: "#5476ABFF")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.setTitle("Get your username ->", for: .normal )
        view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(250)
            maker.bottom.equalToSuperview().inset(50)
            maker.height.equalTo(60)
        }
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    @objc private func onClick() {
        let messageVC = UIAlertController(title: "Message Title", message: "Succes" , preferredStyle: .actionSheet)
        present(messageVC, animated: true) {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
                            messageVC.dismiss(animated: true, completion: nil)})}
    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
