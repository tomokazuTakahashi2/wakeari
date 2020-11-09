//
//  TableViewController2.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/05.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit
import SegementSlide

class TableViewController2: UITableViewController, SegementSlideContentScrollViewDelegate {
    
    var itemArray = [AmazonItem]()
    
    @objc var scrollView: UIScrollView {
        return tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApi()
        
        //カスタムセル
        let nib = UINib(nibName: "TableViewCell1", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")

    }
//MARK:-アマゾンAPI
    func getApi(){
        let headers = [
            "x-rapidapi-host": "amazon-price.p.rapidapi.com",
            "x-rapidapi-key": "fc645fd19fmsh2010b8c1e2d6054p19e9d8jsn09146a84e82b"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://amazon-price.p.rapidapi.com/azapi-bulkPrice?asins=B0714BNRWC%252CB07TKNPPDL%252CB086CX5XFV&marketplace=US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
        
        
//        guard let url = URL(string: "https://amazon-price.p.rapidapi.com/azapi-bulkPrice?asins=B0714BNRWC%252CB07TKNPPDL%252CB086CX5XFV&marketplace=US") else {return}
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, err)in
//            if let err = err {
//                print("情報の取得に失敗しました。:", err)
//                return
//            }
//            if let data = data{
//                do{
//                    let itemModel = try JSONDecoder().decode(AmazonItem.self, from: data)
//                    print("json: ", itemModel)
////                    if let items:[items] = itemModel.Items {
////                        for array in items {
////                            self.itemArray.append(array)
////                        }
////                    }
////                    DispatchQueue.main.async {
////                        self.tableView.reloadData()
////                    }
//                }catch(let err){
//                     print("情報の取得に失敗しました。:", err)
//                }
//            }
//        }
//
//        task.resume()
    }


//// MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return itemArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        // セルを取得してデータを設定する
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell1
//        cell.setData(itemArray[indexPath.row])
//
//        // セル内のボタンのアクションをソースコードで設定する
//        cell.shopUrlButton.addTarget(self, action:#selector(shopNameButton(_:forEvent:)), for: .touchUpInside)
//
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
// // MARK:-セル内のボタンがタップされた時に呼ばれるメソッド
//    @objc func shopNameButton(_ sender: UIButton, forEvent event: UIEvent) {
//
//        // タップされたセルのインデックスを求める
//        let touch = event.allTouches?.first
//        let point = touch!.location(in: self.tableView)
//        let indexPath = tableView.indexPathForRow(at: point)
//
//        // 配列からタップされたインデックスのデータを取り出す
//        let itemData = itemArray[indexPath!.row]
//
//        //遷移先でwebViewに取得したURLを表示
//        let webViewController:UIViewController = WebViewController()
//
//        webViewController.modalTransitionStyle = .crossDissolve
//
//        UserDefaults.standard.set(itemData.Item.shopUrl, forKey: "url")
//
//        self.present(webViewController,animated: true, completion: nil)
//    }
}
