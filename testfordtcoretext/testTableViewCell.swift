//
//  testTableViewCell.swift
//  testfordtcoretext
//
//  Created by 卢杨 on 16/3月/3.
//  Copyright © 2016年 elprup. All rights reserved.
//

import UIKit
import DTCoreText
class testTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
       
      
    }
    
    
    func setUI() {
        
        addSubview(iconImage)
        addSubview(nameLable)
        addSubview(timeLable)
        addSubview(mesButton)
        addSubview(zanButton)
        addSubview(playLable)
    
        
        
    }
    
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "Oliver")
        iconImage.layer.cornerRadius = 40/2
        return iconImage
        
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.text = "小花"
        nameLable.font = UIFont.systemFont(ofSize: 14)
        return nameLable
    }()

    lazy var timeLable: UILabel = {
        let timeLable = UILabel()
        timeLable.text = "10分钟前"
        timeLable.font = UIFont.systemFont(ofSize: 14)
        return timeLable
    }()
    
    lazy var mesButton: UIButton = {
        let mesButton = UIButton()
        mesButton.setTitle("回复", for: .normal)
        mesButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return mesButton
    }()
    lazy var zanButton: UIButton = {
        let zanButton = UIButton()
        zanButton.setTitle("点赞", for: .normal)
        zanButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
         return zanButton
    }()
    
    
    lazy var playLable: UILabel = {
        let playLable = UILabel()
        playLable.text = "10分钟前"
        playLable.font = UIFont.systemFont(ofSize: 14)
        return playLable
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
}
