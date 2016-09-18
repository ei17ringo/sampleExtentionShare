//
//  ViewController.swift
//  sampleExtentionShare
//
//  Created by Eriko Ichinohe on 2016/09/19.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //ユーザーデフォルトを用意する
        let myDefault =  UserDefaults(suiteName: "group.com.eshare")
        
        //データを読みだして
        var myStr = myDefault?.string(forKey: "myUrl")
        
        //文字列が入ってたら表示する
        if let tmpStr = myStr{
            print(tmpStr)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

