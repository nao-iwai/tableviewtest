//
//  ViewController.swift
//  tableviewtest
//
//  Created by sensei on 2015/08/30.
//  Copyright (c) 2015年 senseiswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // SecondViewに渡す文字列
    var selectedText: String?
    
    // 2. 選択状態を解除するIndexPathを入れる変数
    var selectedRow: NSIndexPath?
    
    // テーブルに表示するテキスト
    let texts = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 4. 画面が表示される時に呼ばれるメソッドを追加
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)

        // 5. selectedRowがセットされていたら選択を解除する
        if (selectedRow != nil)
        {
            tableView?.deselectRowAtIndexPath(selectedRow!, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    // セルのテキストを追加
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println(texts[indexPath.row])
        
        // SecondViewControllerに渡す文字列をセット
        selectedText = texts[indexPath.row]
        
        // SecondViewControllerへ遷移するSegueを呼び出す
        performSegueWithIdentifier("showSecondView",sender: nil)

        // 3. 選択状態を解除するIndexPathをセット
        selectedRow = indexPath
    }
    
    // Segueで遷移時の処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destinationViewController as? SecondViewController)!

            // SecondViewControllerのtextに選択した文字列を設定する
            secondVC.text = selectedText
        }
    }
}