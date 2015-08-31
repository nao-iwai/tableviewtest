//
//  ViewController.swift
//  tableviewtest
//
//  Created by sensei on 2015/08/30.
//  Copyright (c) 2015年 senseiswift. All rights reserved.
//

import UIKit

// 3. UITableViewDataSourceとUITableViewDelegateを追加する
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 2. StoryBoardとつなぐ
    @IBOutlet weak var tableView: UITableView!
    
    var selectedText: String?
    
    // 5. テーブルに表示するテキスト
    let texts = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. delegateとdataSourceを設定
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 6. 必要なtableViewメソッド
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    // 6. 必要なtableViewメソッド
    // セルのテキストを追加
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
    
    // 7. セルがタップされた時
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println(texts[indexPath.row])
        
        selectedText = texts[indexPath.row]
        
        // SecondViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("showSecondView",sender: nil)

    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destinationViewController as? SecondViewController)!

            // SecondViewController のtextに選択された文字列を設定する
            secondVC.text = selectedText
        }
    }
    
}