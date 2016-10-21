//
//  ViewController.swift
//  testfordtcoretext
//
//  Created by uniqme on 16/1/7.
//  Copyright © 2016年 elprup. All rights reserved.
//

import UIKit
import DTCoreText
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height
class ViewController: UIViewController {
    var cellCache: NSCache<AnyObject, AnyObject>!
    var useStaticRowHeight = false
     var textView: DTAttributedTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    func setupTableView(){
        var tableView = UITableView()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH),style:.grouped);
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DTAttributedTextCell.self, forCellReuseIdentifier: "cells")
               self.view.addSubview(tableView)
       
        if useStaticRowHeight {
         
            tableView.rowHeight = 60
        }
        else {
          
            cellCache = NSCache()
        }

    }
    

   
}
extension ViewController:UITableViewDelegate,UITableViewDataSource,DTAttributedTextContentViewDelegate,DTLazyImageViewDelegate{
    
    func configureCell(_ cell: DTAttributedTextCell, forIndexPath indexPath: IndexPath) {
        
        let html = "<div><p style=\'text-align:center;\'><img src='https://pix5.agoda.net/hotelimages/106/10633/10633_14020610070018261943.jpg'  width='100' height='100' ;  /></p><p  style='next-align:center;color:#999;line-height:1.4em;padding:0 4em;'>2015年10月10日，浙江省湖州市德清边防训练基地，新兵们正在进行队列会操。 2015年10月10日，浙江省湖州市德清边防训练基地，新兵们正在进行队列会操。2015年10月10日，浙江省湖州市德清边防训练基地，新兵们正在进行队列会操。2015年10月10日，浙江省湖州市德清边防训练基地，新兵们正在进行队列会操。<span style='color:#AAA;'>（东方IC/图）</span></p></div>"
        
        cell.setHTMLString(html)
        cell.hasFixedRowHeight = useStaticRowHeight
        
        
        cell.attributedTextContextView.delegate = self
        cell.attributedTextContextView.shouldDrawImages = true
    }
    
    
    func _canReuseCells() -> Bool {
        // reuse does not work for variable height
        if self.responds(to: #selector(UITableViewDelegate.tableView(_:heightForRowAt:))) {
            return false
        }
        // only reuse cells with fixed height
        return true
    }
    
    func tableView(_ tableView: UITableView, preparedCellForIndexPath indexPath: IndexPath) -> DTAttributedTextCell {
    
        var cell: DTAttributedTextCell
            cell = (tableView.dequeueReusableCell(withIdentifier: "cells")! as! DTAttributedTextCell)
        
             cell.hasFixedRowHeight = useStaticRowHeight
       
        self.configureCell(cell, forIndexPath: indexPath)
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 0 {
            if  indexPath.row ==  0 {
                return 80
            }
            if useStaticRowHeight {
                return tableView.rowHeight
            }
            let cell = (self.tableView(tableView, preparedCellForIndexPath: indexPath) )
            return cell.requiredRowHeight(in: tableView)
           
        }else{
           
            return 100
        }
     }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 2
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if  indexPath.row == 0 {
                let cell:UITableViewCell
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell.textLabel?.text = "12312321123"
                return cell
            }else{
                let cell = (self.tableView(tableView, preparedCellForIndexPath: indexPath) )
                cell.isSelected = false
                cell.selectionStyle = .none
                return cell
            }
 
        }else{
            
            let cell2:UITableViewCell
            cell2 = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell2.textLabel?.text = "12312321123"
            return cell2
        }
 }
    
    
    func attributedTextContentView(_ attributedTextContentView: DTAttributedTextContentView, viewFor attachment: DTTextAttachment, frame: CGRect) -> UIView? {
        let imageView = DTLazyImageView(frame: frame)
        imageView.delegate = self
        imageView.image = (attachment as! DTImageTextAttachment).image
        imageView.url = attachment.contentURL
        return imageView
        
    }
    
    
    
    func lazyImageView(_ lazyImageView: DTLazyImageView, didChangeImageSize size: CGSize) {
        //let url = lazyImageView.url
       // let imageSize = size
        let didUpdate = false
        
         if didUpdate {
            // layout might have changed due to image sizes
            textView.relayoutText()
        }
    }
    
    
    
    
    
}

