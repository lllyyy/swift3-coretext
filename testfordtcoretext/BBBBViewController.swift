//
//  BBBBViewController.swift
//  testfordtcoretext
//
//  Created by 卢杨 on 16/3月/3.
//  Copyright © 2016年 elprup. All rights reserved.
//

import UIKit
import DTCoreText

class BBBBViewController: UIViewController,DTAttributedTextContentViewDelegate, DTLazyImageViewDelegate{
    var textView: DTAttributedTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        textView = DTAttributedTextView(frame: frame)
        // we draw images and links via subviews provided by delegate methods
        textView.shouldDrawImages = false
        textView.shouldDrawLinks = false
        textView.textDelegate = self
        // delegate for custom sub views
        // gesture for testing cursor positions
        //	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        //	[_textView addGestureRecognizer:tap];
        // set an inset. Since the bottom is below a toolbar inset by 44px
        textView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 44, 0)
        textView.contentInset = UIEdgeInsetsMake(10, 10, 54, 10)
        textView.autoresizingMask = .flexibleWidth
        self.view.addSubview(textView)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var bounds = self.view.bounds
        self.textView.frame = bounds
        // Display string
        self.textView.shouldDrawLinks = false
        // we draw them in DTLinkButton
        self.textView.attributedString = self._attributedString(forSnippetUsingiOS6Attributes: false)
        //[self _segmentedControlChanged:nil];
      //  self.navigation!.setToolbarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // now the bar is up so we can autoresize again
        self.textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func _attributedString(forSnippetUsingiOS6Attributes useiOS6Attributes: Bool) -> NSAttributedString {
        let path = Bundle.main.path(forResource: "test2", ofType: "html")!
       // let html = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
 
        let html2 = "<div style font-size:16px;color:#515151;line-height:19px;\"><br style=\"line-height:10px;\"><br><img src='http://images.infzm.com/medias/2015/1030/96152.jpeg@660x440' width='300' height='200'/><p>商城佣金收入是指最美妈咪为了更好的答谢医生为首诊孕妈妈们在孕期和宝宝未来0-3岁提供持续性的健康服务的一种奖励方式。</p><br style=\"line-height:10px;\"><p> 凡是首诊患者在最美妈咪母婴商城购买平台设定佣金的商品，医生均可获得对应的佣金收入。</p><p>佣金商品的设定统一由最美妈咪母婴商城全权负责，包括设定的标准和规则等。</p><p>对于首诊患者购买及对应的佣金设定的相关数据，首诊医生有知情权，具体可咨询最美妈咪母婴商城运营部，客服电话：400-220-4562</p><p>佣金商品的设定统一由最美妈咪母婴商城全权负责，包括设定的标准和规则等。</p><p>对于首诊患者购买及对应的佣金设定的相关数据，首诊医生有知情权，具体可咨询最美妈咪母婴商城运营部，客服电话：400-220-4562</p><p>佣金商品的设定统一由最美妈咪母婴商城全权负责，包括设定的标准和规则等。</p><p>对于首诊患者购买及对应的佣金设定的相关数据，首诊医生有知情权，具体可咨询最美妈咪母婴商城运营部，客服电话：400-220-4562</p><p>佣金商品的设定统一由最美妈咪母婴商城全权负责，包括设定的标准和规则等。</p><p>对于首诊患者购买及对应的佣金设定的相关数据，首诊医生有知情权，具体可咨询最美妈咪母婴商城运营部，客服电话：400-220-4562</p><p>佣金商品的设定统一由最美妈咪母婴商城全权负责，包括设定的标准和规则等。</p><p>对于首诊患者购买及对应的佣金设定的相关数据，首诊医生有知情权，具体可咨询最美妈咪母婴商城运营部，客服电话：400-220-4562</p></div>"
       
        
         let data = html2.data(using: String.Encoding.utf8)!
       
 
        let options = [
            NSTextSizeMultiplierDocumentOption : Int(1.0),
           // DTMaxImageSize : maxImageSizes,
            DTDefaultFontFamily : "Times New Roman",
            DTDefaultLinkColor : "purple",
            DTDefaultLinkHighlightColor : "red"
           // DTWillFlushBlockCallBack : callBackBlock
        ] as [String : Any]
        
          
        //options[NSBaseURLDocumentOption] = URL(fileURLWithPath: readmePath)
        let string = NSAttributedString(htmlData: data, options: options, documentAttributes: nil)
        print(">>>>>>>>  \(string)")
        return string!
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !self.responds(to: #selector(getter: self.topLayoutGuide)) {
            return
        }
        // this also compiles with iOS 6 SDK, but will work with later SDKs too
//        var topInset: CGFloat = CFloat(self.init(forKeyPath: "topLayoutGuide.length"))
//        var bottomInset: CGFloat = CFloat(self.init(forKeyPath: "bottomLayoutGuide.length"))
        let outerInsets = UIEdgeInsetsMake(10, 0, 10, 0)
        var innerInsets = outerInsets
        innerInsets.left += 10
        innerInsets.right += 10
        innerInsets.top += 10
        innerInsets.bottom += 10
        let innerScrollOffset = CGPoint(x: -innerInsets.left, y: -innerInsets.top)
        let outerScrollOffset = CGPoint(x: -outerInsets.left, y: -outerInsets.top)
        self.textView.contentInset = innerInsets
        self.textView.contentOffset = innerScrollOffset
        self.textView.scrollIndicatorInsets = outerInsets
        //self.needsAdjustInsetsOnLayout = false
    }
    

    
    
     func attributedTextContentView(_ attributedTextContentView: DTAttributedTextContentView, viewFor attachment: DTTextAttachment, frame: CGRect) -> UIView? {
        let imageView = DTLazyImageView(frame: frame)
        imageView.delegate = self
        // sets the image if there is one
        imageView.image = (attachment as! DTImageTextAttachment).image
        imageView.url = attachment.contentURL

       return imageView
    
  }

    
    
    func lazyImageView(_ lazyImageView: DTLazyImageView, didChangeImageSize size: CGSize) {
        var url = lazyImageView.url
        var imageSize = size
        //var pred = NSPredicate(format: "%@", url as! CVarArg)
        var didUpdate = false
        
        
        //        for  oneAttachment: DTTextAttachment in  self.textView.attributedTextContentView.layouter.  {
        //            if oneAttachment.originalSize.equalTo(CGSizeZero) {
        //                             oneAttachment.originalSize = imageSize
        //                              didUpdate = true
        //                        }
        //        }
        //update all attachments that match this URL (possibly multiple images with same size)
        //        for oneAttachment: DTTextAttachment in textView.attributedTextContentView.layoutFrame.textAttachments(with: pred) {
        //            // update attachments that have no original size, that also sets the display size
        //            if CGSizeEqualToSize(oneAttachment.originalSize, CGSizeZero) {
        //                oneAttachment.originalSize = imageSize
        //                didUpdate = true
        //            }
        //        }
        if didUpdate {
            // layout might have changed due to image sizes
            textView.relayoutText()
        }
    }
    
}


