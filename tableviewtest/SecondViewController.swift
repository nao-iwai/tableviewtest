//
//  SecondViewController.swift
//  tableviewtest
//
//  Created by sensei on 2015/08/31.
//  Copyright (c) 2015年 senseiswift. All rights reserved.
//

import UIKit

// SLComposeViewControllerを使うためにSocialをimport
import Social

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewControllerから受け取る文字列を入れる変数
    var text: String?
    
    var yomi: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // テーブルの行数を追加
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // セルのテキストを追加
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        if (indexPath.row == 0)
        {
            // 受け取った文字列をセルに表示
            cell.textLabel?.text = text
            return cell
        }
        else if (indexPath.row == 1)
        {
            // テーブルの2行目に文言を追加
            cell.textLabel?.text = "読み方：" + yomi!
            return cell
        }
        else if (indexPath.row == 2)
        {
            // テーブルの3行目に文言を追加
            cell.textLabel?.text = text! + "についてTwitterに投稿"
            return cell
        }
        else if (indexPath.row == 3)
        {

        }
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        if (indexPath.row == 0)
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else if (indexPath.row == 1)
        {
            // テーブルの2行目をタップした時にURLを生成してSafariを起動
            var url : NSString = "https://www.google.co.jp/search?q=" + text!
            var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var searchURL : NSURL = NSURL(string: urlStr as String)!
            println(searchURL)
            
            if UIApplication.sharedApplication().canOpenURL(searchURL){
                UIApplication.sharedApplication().openURL(searchURL)
            }
        }
        else if (indexPath.row == 2)
        {
            // Twitter投稿用SLComposeViewControler生成
            let twVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            // メッセージのセット
            twVC.setInitialText("私は" + text! + "が好きです！")
            // Viewの表示
            self.presentViewController(twVC, animated: true, completion: nil)
        }
    }
}
