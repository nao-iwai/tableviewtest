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
    let texts: [(rare: Int, name: String)] = [
        (5,"三日月宗近"),
        (3,"小狐丸"),
        (3,"石切丸"),
        (3,"岩融"),
        (1,"今剣"),
        (2,"にっかり青江"),
        (2,"鳴狐"),
        (4,"一期一振"),
        (2,"鯰尾藤四郎"),
        (2,"骨喰藤四郎"),
        (1,"平野藤四郎"),
        (1,"厚藤四郎"),
        (1,"前田藤四郎"),
        (1,"秋田藤四郎"),
        (1,"博多藤四郎"),
        (1,"乱藤四郎"),
        (1,"五虎退"),
        (1,"薬研藤四郎"),
        (4,"鶯丸"),
        (3,"明石国行"),
        (4,"蛍丸"),
        (1,"愛染国俊"),
        (3,"蜻蛉切"),
        (3,"燭台切光忠"),
        (4,"江雪左文字"),
        (2,"宗三左文字"),
        (1,"小夜左文字"),
        (2,"加州清光"),
        (2,"大和守安定"),
        (2,"歌仙兼定"),
        (3,"和泉守兼定"),
        (2,"陸奥守吉行"),
        (2,"山姥切国広"),
        (3,"山伏国広"),
        (2,"堀川国広"),
        (2,"蜂須賀虎徹"),
        (2,"浦島虎徹"),
        (2,"長曽祢虎徹"),
        (3,"大倶利伽羅"),
        (2,"へし切長谷部"),
        (3,"獅子王"),
        (3,"同田貫正国"),
        (4,"鶴丸国永"),
        (3,"太郎太刀"),
        (3,"次郎太刀"),
        (4,"日本号"),
        (3,"御手杵")
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
        
        cell.textLabel?.text = texts[indexPath.row].name
        
        switch (texts[indexPath.row].rare)
        {
        case 1:
            cell.backgroundColor = UIColor.whiteColor();
            break
        case 2:
            cell.backgroundColor = UIColor.blueColor();
            break
        case 3:
            cell.backgroundColor = UIColor.greenColor();
            break
        case 4:
            cell.backgroundColor = UIColor.orangeColor();
            break
        case 5:
            cell.backgroundColor = UIColor.magentaColor();
            break
        default:
            break
        }
        
        return cell
    }
    
    // セクションの名前
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println(texts[indexPath.row])
        
        // SecondViewControllerに渡す文字列をセット
        selectedText = texts[indexPath.row].name
        
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