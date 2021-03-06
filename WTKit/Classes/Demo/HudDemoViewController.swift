//
//  HudDemoViewController.swift
//  WTKit
//
//  Created by SongWentong on 5/9/16.
//  Copyright © 2016 SongWentong. All rights reserved.
//

import UIKit

class HudDemoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataList:[String]
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder){
        dataList = ["showLoadingView","text"]
        super.init(coder: aDecoder)
    }
    
    deinit{
        
//        WTLog("deinit")
//        self.tableView.removeRefresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.refreshHeader = RefreshHeader.headerWithRefreshing({ 
            WTLog("refresh")
            self.performBlock({ 
                self.tableView.finishRefresh()
                }, afterDelay: 2)
        })
//        self.modalTransitionStyle
//        tableView.separatorInset = UIEdgeInsetsMake(100, 0, 0, 0);
//        tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - UITableViewDataSource
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    /*!
        这里只创建cell对象
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        return cell
    }
    // MARK: - UITableViewDelegate
    
    /*!
        在这里设置数据是为了保持良好的效率
     */
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath){
        cell.textLabel?.text = dataList[indexPath.row];
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        switch indexPath.row {
        case 0:
            self.showLoadingView()
            self.performBlock({
                self.hideLoadingView()
                }, afterDelay: 2)
            break
        case 1:
            self.showHudWithTip("这是一段长文字长文字长文章长文章长文字长文字长文字长文字长文章长文章长文章长文章长文章长文字长文章长文字")
            break
        default:
            break
            
        }
    }
    
    


}
