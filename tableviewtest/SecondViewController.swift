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
    
    var height: Int?
    
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
        return 7
    }
    
    // セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションの名前
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return text
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
            cell.textLabel?.text = "身長：" + String(height!) + "cm";
            return cell
        }
        else if (indexPath.row == 3)
        {
            // テーブルの4行目に文言を追加
            cell.textLabel?.text = "Googleで調べる"
            return cell
        }
        else if (indexPath.row == 4)
        {
            // テーブルの5行目に文言を追加
            cell.textLabel?.text = "Pixivで調べる"
            return cell
        }
        else if (indexPath.row == 5)
        {
            // テーブルの6行目に文言を追加
            cell.textLabel?.text = "ニコニコ大百科で調べる"
            return cell
        }
        else if (indexPath.row == 6)
        {
            // テーブルの6行目に文言を追加
            cell.textLabel?.text = "刀剣男士一覧に戻る"
            return cell
        }
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        if (indexPath.row == 0)
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else if (indexPath.row == 3)
        {
            // テーブルの4行目をタップした時にURLを生成してSafariを起動
            var url : NSString = "https://www.google.co.jp/search?q=" + text!
            var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var searchURL : NSURL = NSURL(string: urlStr as String)!
            println(searchURL)
            
            if UIApplication.sharedApplication().canOpenURL(searchURL){
                UIApplication.sharedApplication().openURL(searchURL)
            }
        }
        else if (indexPath.row == 4)
        {
            // テーブルの5行目をタップした時にURLを生成してSafariを起動
            var url : NSString = "http://www.pixiv.net/search.php?s_mode=s_tag_full&word=" + text!
            var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var searchURL : NSURL = NSURL(string: urlStr as String)!
            println(searchURL)
            
            if UIApplication.sharedApplication().canOpenURL(searchURL){
                UIApplication.sharedApplication().openURL(searchURL)
            }
        }
        else if (indexPath.row == 5)
        {
            // テーブルの6行目をタップした時にURLを生成してSafariを起動
            var url : NSString = "http://dic.nicovideo.jp/a/" + text! + "(刀剣乱舞)"
            var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var searchURL : NSURL = NSURL(string: urlStr as String)!
            println(searchURL)
            
            if UIApplication.sharedApplication().canOpenURL(searchURL){
                UIApplication.sharedApplication().openURL(searchURL)
            }
        }
        else if (indexPath.row == 6)
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
