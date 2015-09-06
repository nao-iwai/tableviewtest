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
    
    // 選択状態を解除するIndexPathを入れる変数
    var selectedRow: NSIndexPath?
    
    // セクション名
    let sections = ["刀剣男士一覧"]
    
    // 刀剣男士名に変更
    let texts = ["三日月宗近",
        "小狐丸",
        "石切丸",
        "岩融",
        "今剣",
        "にっかり青江",
        "鳴狐",
        "一期一振",
        "鯰尾藤四郎",
        "骨喰藤四郎",
        "平野藤四郎",
        "厚藤四郎",
        "前田藤四郎",
        "秋田藤四郎",
        "博多藤四郎",
        "乱藤四郎",
        "五虎退",
        "薬研藤四郎",
        "鶯丸",
        "明石国行",
        "蛍丸",
        "愛染国俊",
        "蜻蛉切",
        "燭台切光忠",
        "江雪左文字",
        "宗三左文字",
        "小夜左文字",
        "加州清光",
        "大和守安定",
        "歌仙兼定",
        "和泉守兼定",
        "陸奥守吉行",
        "山姥切国広",
        "山伏国広",
        "堀川国広",
        "蜂須賀虎徹",
        "浦島虎徹",
        "長曽祢虎徹",
        "大倶利伽羅",
        "へし切長谷部",
        "獅子王",
        "同田貫正国",
        "鶴丸国永",
        "太郎太刀",
        "次郎太刀",
        "日本号",
        "御手杵"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 画面が表示される時に呼ばれるメソッドを追加
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)

        // selectedRowがセットされていたら選択を解除する
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
    
    // セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }

    // セルのテキストを追加
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
    
    // セクションの名前
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println(texts[indexPath.row])
        
        // SecondViewControllerに渡す文字列をセット
        selectedText = texts[indexPath.row]
        
        // SecondViewControllerへ遷移するSegueを呼び出す
        performSegueWithIdentifier("showSecondView",sender: nil)

        // 選択状態を解除するIndexPathをセット
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