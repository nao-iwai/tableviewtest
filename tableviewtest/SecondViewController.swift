//
//  SecondViewController.swift
//  tableviewtest
//
//  Created by sensei on 2015/08/31.
//  Copyright (c) 2015年 senseiswift. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewControllerから受け取る文字列を入れる変数
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 2. テーブルの行数を追加
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
            // 3. テーブルの2行目に文言を追加
            cell.textLabel?.text = text! + "についてGoogleで調べる"
            return cell
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
            // 4. テーブルの2行目をタップした時にURLを生成してSafariを起動
            var url : NSString = "https://www.google.co.jp/search?q=" + text!
            var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var searchURL : NSURL = NSURL(string: urlStr as String)!
            println(searchURL)
            
            if UIApplication.sharedApplication().canOpenURL(searchURL){
                UIApplication.sharedApplication().openURL(searchURL)
            }
        }
    }
}
