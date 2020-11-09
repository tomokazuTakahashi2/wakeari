//
//  TableViewController.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/02.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit
import SegementSlide

class TableViewController1: UITableViewController, SegementSlideContentScrollViewDelegate {
    
    var itemArray = [items]()
    
    @objc var scrollView: UIScrollView {
        return tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRApi()
        
        //カスタムセル
        let nib = UINib(nibName: "TableViewCell1", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")

    }
//MARK:-楽天API
    private func getRApi(){
        guard let url = URL(string: "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&keyword=%E6%A5%BD%E5%A4%A9&genreId=555086&applicationId=1099650185906175174") else {return}

        let task = URLSession.shared.dataTask(with: url) { (data, response, err)in
            if let err = err {
                print("情報の取得に失敗しました。:", err)
                return
            }
            if let data = data{
                do{
                    let itemModel = try JSONDecoder().decode(ResultList.self, from: data)
                   // print("json: ", itemModel)
                    if let items:[items] = itemModel.Items {
                        for array in items {
                            self.itemArray.append(array)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch(let err){
                     print("情報の取得に失敗しました。:", err)
                }
            }
        }
        task.resume()
    }


// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell1
        cell.setData(itemArray[indexPath.row])

        // セル内のボタンのアクションをソースコードで設定する
        cell.shopUrlButton.addTarget(self, action:#selector(shopNameButton(_:forEvent:)), for: .touchUpInside)

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

 // MARK:-セル内のボタンがタップされた時に呼ばれるメソッド
    @objc func shopNameButton(_ sender: UIButton, forEvent event: UIEvent) {

        // タップされたセルのインデックスを求める
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)

        // 配列からタップされたインデックスのデータを取り出す
        let itemData = itemArray[indexPath!.row]

        //遷移先でwebViewに取得したURLを表示
        let webViewController:UIViewController = WebViewController()

        webViewController.modalTransitionStyle = .crossDissolve

        UserDefaults.standard.set(itemData.Item.shopUrl, forKey: "url")

        self.present(webViewController,animated: true, completion: nil)
    }
}
