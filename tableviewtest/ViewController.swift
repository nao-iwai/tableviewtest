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
    var selectedYomi: String?
    
    // 選択状態を解除するIndexPathを入れる変数
    var selectedRow: NSIndexPath?
    
    // セクション名
    let sections = ["刀剣男士一覧"]
    
    // 刀剣男士名に変更
    let texts: [(rare: Int, name: String, yomi :String)] = [
        (5,"三日月宗近","みかづきむねちか"),
        (3,"小狐丸","こぎつねまる"),
        (3,"石切丸","いしきりまる"),
        (3,"岩融","いわとおし"),
        (1,"今剣","いまのつるぎ"),
        (2,"にっかり青江","にっかりあおえ"),
        (2,"鳴狐","なきぎつね"),
        (4,"一期一振","いちごひとふり"),
        (2,"鯰尾藤四郎","なまずおとうしろう"),
        (2,"骨喰藤四郎","ほねばみとうしろう"),
        (1,"平野藤四郎","ひらのとうしろう"),
        (1,"厚藤四郎","あつしとうしろう"),
        (1,"前田藤四郎","まえだとうしろう"),
        (1,"秋田藤四郎","あきたとうしろう"),
        (1,"博多藤四郎","はかたとうしろう"),
        (1,"乱藤四郎","みだれとうしろう"),
        (1,"五虎退","ごこたい"),
        (1,"薬研藤四郎","やげんとうしろう"),
        (4,"鶯丸","うぐいすまる"),
        (3,"明石国行","あかしくにゆき"),
        (4,"蛍丸","ほたるまる"),
        (1,"愛染国俊","あいぞめくにとし"),
        (3,"蜻蛉切","とんぼきり"),
        (3,"燭台切光忠","しょくだいきりみつただ"),
        (4,"江雪左文字","こうせつさもんじ"),
        (2,"宗三左文字","そうざさもんじ"),
        (1,"小夜左文字","さよさもんじ"),
        (2,"加州清光","かしゅうきよみつ"),
        (2,"大和守安定","やまとのかみやすさだ"),
        (2,"歌仙兼定","かせんかねさだ"),
        (3,"和泉守兼定","いずみのかみかねさだ"),
        (2,"陸奥守吉行","むつのかみよしゆき"),
        (2,"山姥切国広","やまんばぎりくにひろ"),
        (3,"山伏国広","やまぶしくにひろ"),
        (2,"堀川国広","ほりかわくにひろ"),
        (2,"蜂須賀虎徹","はちすかこてつ"),
        (2,"浦島虎徹","うらしまこてつ"),
        (2,"長曽祢虎徹","ながそねこてつ"),
        (3,"大倶利伽羅","おおくりから"),
        (2,"へし切長谷部","へしきりはせべ"),
        (3,"獅子王","ししおう"),
        (3,"同田貫正国","どうだぬきまさくに"),
        (4,"鶴丸国永","つるまるくになが"),
        (3,"太郎太刀","たろうたち"),
        (3,"次郎太刀","じろうたち"),
        (4,"日本号","にほんごう"),
        (3,"御手杵","おてぎね")
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
        selectedYomi = texts[indexPath.row].yomi
        
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
            secondVC.yomi = selectedYomi
        }
    }
}