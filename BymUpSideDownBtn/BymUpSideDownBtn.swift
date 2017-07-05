//
//  BymUpSideDownBtn.swift
//
//  Created by Bym on 16/10/21.
//  Copyright © 2016年 1yyoubao. All rights reserved.
//
//  下载地址:https://github.com/QDByMiracles/BymUpSideDownBtn.git

import UIKit

class BymUpSideDownBtn: UIButton {
    
    public enum distributing : Int {
        //水平排布 从左往右排开  没有间隙 图片文字
        case h_l_img_Label
        //水平排布 从左往右排开  没有间隙 文字图片
        case h_l_label_Img
        //水平排布 内容整体居中排开  文字-间距-图片
        case h_c_label_margin_img
        //水平排布 内容整体居中排开  图片-间距-文字
        case h_c_img_margin_label
        //垂直排布 居中排开    图片-间距-文字
        case v_c_img_margin_label
        //垂直排布 居中排开    文字-间距-图片
        case v_c_label_margin_img
        //垂直排布 从上往下排开 图片置顶端
        case v_t_img_margin_Label
        //垂直排布 从下往上排开 图片置底端
        case v_b_img_margin_Label
    }
    
    ///图片相对于文字的位置
    var imagePlaces:distributing = .h_c_img_margin_label
    ///文字和按钮的间距
    var margin:CGFloat = 10
    
    class func imageBtn(title:String?,titleColor:UIColor,img:UIImage?,selImg:UIImage?,place:distributing) -> BymUpSideDownBtn {
        let btn = BymUpSideDownBtn.init(type: UIButtonType.custom)
        btn.setTitle(title, for:UIControlState.normal)
        btn.setTitleColor(titleColor, for: UIControlState.normal)
        btn.setImage(img, for: UIControlState.normal)
        btn.setImage(selImg, for: UIControlState.selected)
        btn.imagePlaces = place
        return btn
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        switch  imagePlaces{
        //水平排布 从左往右排开 没有间隙 图片文字
        case .h_l_img_Label:
            imageView?.frame.origin.x  = 0
            titleLabel?.frame.origin.x = imageView!.frame.size.width
        //水平排布 从左往右排开 没有间隙 文字图片
        case .h_l_label_Img:
            titleLabel?.frame.origin.x = 0
            imageView?.frame.origin.x = titleLabel!.frame.size.width
        //水平排布 整体内容居中排开    文字-间距-图片
        case .h_c_label_margin_img:
            let cacheBounds:CGRect = self.bounds
            let totalLength = (imageView?.frame.width)! + (titleLabel?.frame.width)! + margin
            let padding = (cacheBounds.width - totalLength)/2
            titleLabel?.frame.origin.x = padding
            imageView?.frame.origin.x = padding + totalLength - (imageView?.frame.width)!
        //水平排布 整体内容居中排开    文字-间距-图片
        case .h_c_img_margin_label:
            let cacheBounds:CGRect = self.bounds
            let totalLength = (imageView?.frame.width)! + (titleLabel?.frame.width)! + margin
            let padding = (cacheBounds.width - totalLength)/2
            imageView?.frame.origin.x = padding
            titleLabel?.frame.origin.x = padding + totalLength - (titleLabel?.frame.width)!
        //垂直排布 整体内容居中排开    图片-间距-文字
        case .v_c_img_margin_label:
            titleLabel?.sizeToFit()
            //记录修改前的bounce
            let cacheBounds:CGRect = self.bounds
            let totalHeight = (imageView?.frame.height)! + (titleLabel?.frame.height)! + margin
            //偏差
            let offset = cacheBounds.height - totalHeight
            let padding = offset*0.5
            //修改centerX
            titleLabel?.center.x = cacheBounds.width*0.5
            imageView?.center.x = cacheBounds.width*0.5
            //修改Y
            imageView?.frame.origin.y = padding
            titleLabel?.frame.origin.y = cacheBounds.height - padding - (titleLabel?.frame.height)!
        //垂直排布 整体内容居中排开    文字-间距-图片
        case .v_c_label_margin_img:
            titleLabel?.sizeToFit()
            //记录修改前的bounce
            let cacheBounds:CGRect = self.bounds
            let totalHeight = (imageView?.frame.height)! + (titleLabel?.frame.height)! + margin
            
            let offset = cacheBounds.height - totalHeight
            let padding = offset*0.5
            //修改centerX
            titleLabel?.center.x = cacheBounds.width*0.5
            imageView?.center.x = cacheBounds.width*0.5
            //修改centerY
            titleLabel?.frame.origin.y = padding
            imageView?.frame.origin.y = cacheBounds.height - padding - (imageView?.frame.height)!
        //垂直排布 从上往下排开 图片置顶端
        case .v_t_img_margin_Label:
            //记录修改前的center
            let cacheFrame:CGRect = self.frame
            titleLabel?.sizeToFit()
            //修改centerX
            titleLabel?.center.x = cacheFrame.size.width/2
            imageView?.center.x = cacheFrame.size.width/2
            //修改Y
            imageView?.frame.origin.y = 0
            titleLabel?.frame.origin.y = (imageView?.image?.size.height)! + margin
        //垂直排布 从下往上排开 图片置底端
        case .v_b_img_margin_Label:
            //记录修改前的center
            let cacheFrame:CGRect = self.frame
            titleLabel?.sizeToFit()
            //修改centerX
            titleLabel?.center.x = cacheFrame.size.width/2
            imageView?.center.x = cacheFrame.size.width/2

            imageView?.frame.origin.y = cacheFrame.size.height - (imageView?.frame.size.height)!
            titleLabel?.frame.origin.y = (imageView?.frame.origin.y)! - margin - (titleLabel?.frame.size.height)!
        default:
            print("have not complete")
        }

    }
}
