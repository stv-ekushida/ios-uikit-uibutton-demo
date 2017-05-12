//
//  ViewController.swift
//  ios-uikit-uibutton-demo
//
//  Created by k_motoyama on 2017/02/27.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTitleColor()
        getCurrentTitle()
        setupImage()
    }
    
    // 現在表示されているタイトルを取得する
    private func getCurrentTitle(){
        print(button.currentTitle!)
    }
    
    // ボタンのタイトルを設定する
    private func setupTitle(){
        button.setTitle("ボタン", for: .normal)
    }
    
    // ボタンのタイトルの色を設定する
    private func setupTitleColor(){
        button.setTitleColor(UIColor.red, for: .normal)
    }
    
    // ボタンのタイトルの影を設定する
    private func setupTitleShadowColor(){
        button.setTitleShadowColor(UIColor.gray, for: .normal)
        button.titleLabel!.shadowOffset = CGSize(width: 3, height: 3)

    }
    
    // ボタンに表示する画像を設定する
    private func setupImage(){
        let image = UIImage(named:"apple.png")
        button.setImage(image, for: .normal)
        button.sizeToFit()
        button.center = self.view.center
    }

    /// ボタンを押下すると、プルプルする
    ///
    /// - Parameter sender: ボタン
    @IBAction func didTapButton(_ sender: UIButton) {

        let bounds = sender.bounds

        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut, animations: {

            sender.bounds = CGRect(x: bounds.origin.x - 20,
                                   y: bounds.origin.y,
                                   width: bounds.size.width + 60,
                                   height: bounds.size.height)
        }) { (success:Bool) in
            if success {

                UIView.animate(withDuration: 0.5, animations: {
                    sender.bounds = bounds
                })

            }
        }

    }
}

