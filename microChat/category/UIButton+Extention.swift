//
//  UIButton+Extention.swift
//  microChat
//
//  Created by yxf on 2017/9/26.
//  Copyright © 2017年 k_yan. All rights reserved.
//

import UIKit

extension UIButton {
    //swift中的类方法是以class开头的方法，类似于OC中的'+'方法
    class func createBtn(img:String,bgImg:String) -> UIButton{
        let btn = UIButton()
        btn.setImage(UIImage.init(named: img), for: .normal)
        btn.setImage(UIImage.init(named: img + "_highlighted"), for: .selected)
        btn.setBackgroundImage(UIImage.init(named: bgImg), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: bgImg + "_highlighted"), for: .selected)
        return btn
    }
    
    //构造函数,系统会自动返回
    //便利构造函数：使用 convenience 修饰的构造函数叫做便利构造函数
    //  便利构造函数通常用在对系统的类进行构造函数的扩充时使用
    /*
     便利构造函数的特点：
     1.便利构造函数通常都是写在extension里面
     2.便利构造函数init前面需要加载 convenience
     3.在便利构造函数中需要明确的调用self.init()
     */
    convenience init(img:String,bgImg:String) {
        self.init()
        self.setImage(UIImage.init(named: img), for: .normal)
        self.setImage(UIImage.init(named: img + "_highlighted"), for: .selected)
        self.setBackgroundImage(UIImage.init(named: bgImg), for: .normal)
        self.setBackgroundImage(UIImage.init(named: bgImg + "_highlighted"), for: .selected)
    }
    
}
