//
//  ViewController.swift
//  microChat
//
//  Created by 燕雪峰 on 2017/9/25.
//  Copyright © 2017年 k_yan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(FCHomeViewController(), title: "home", img: "tab_bar_study", selectedImg: "tab_bar_study_sel")
        
        addChildViewController(FCMsgViewController(), title: "message", img: "tab_bar_partner", selectedImg: "tab_bar_partner_sel")
     
        addChildViewController(FCDiscoverViewController(), title: "discovery", img: "tab_bar_discover", selectedImg: "tab_bar_discover_sel")
        
//        addChildViewController(FCMeViewController(), title: "me", img: "tab_bar_my", selectedImg: "tab_bar_my_sel")
        
        addChildViewController("FCMeViewController", title: "me", img: "tab_bar_my", selectedImg: "tab_bar_my_sel")
        
        readJson()
        
    }
    
    //方法的重载
    //方法的重载：方法名称相同，但是参数不同（参数类型不同，或者参数个数不同）
    //private 关键字，在当前文件中可以访问，但是其他文件不能访问
    private func addChildViewController(_ childController: UIViewController,title:String,img:String,selectedImg:String) {
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage.init(named: img)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImg)
        let naviVc = UINavigationController.init(rootViewController: childController)
        childController.navigationItem.title = title
        addChildViewController(naviVc)
    }
    
    //根据字符串获取对应的class
    private func addChildViewController(_ childVcName: String,title:String,img:String,selectedImg:String) {
        //0.获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有拿到命名空间")
            return
        }
        
        //1.根据字符串获取对应的class
        guard let childClass = NSClassFromString(nameSpace + "." + childVcName) else {
            print("没有获取到对应的class")
            return
        }
        
        //2.将childClass转成控制器的类型
        guard let childVcType = childClass as? UIViewController.Type else {
            print("没有获取到对应控制器的类型")
            return
        }
        
        //3.创建对应的控制器对象
        let childVc = childVcType.init()
        
        //4.设置自控制器的属性
        childVc.tabBarItem.title = title
        childVc.tabBarItem.image = UIImage.init(named: img)
        childVc.tabBarItem.selectedImage = UIImage.init(named: selectedImg)
        childVc.navigationItem.title = title
        
        //5.包装导航控制器
        let naviVc = UINavigationController.init(rootViewController: childVc)
        addChildViewController(naviVc)
        
        print(naviVc)
    }
    
    //读取json
    func readJson() -> Void {
        //1.获取json文件地址
        guard let jsonPath = Bundle.main.path(forResource: "Language.json", ofType: nil) else{
            print("json 文件不存在")
            return
        }
        
        //2.读取json文件中的内容
        guard let data = NSData.init(contentsOfFile: jsonPath) as Data? else {
            print("data nil")
            return
        }
        
        //3.将data转为数组
        //如果在调用一个方法时，该方法最后又一个throw，说明该方法会抛出异常，如果一个方法会抛出异常，那么需要对该异常进行处理
        /*
         swift中提供三种处理异常的方式
         方式1:try方式 程序员手动捕捉异常
         do {
         let anyObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
         } catch {
         //临时常量error,描述该异常
         print(error)
         }
         
         方式2:try? 方式（常用方式），系统帮助处理异常，如果该方法出现了异常，则该方法返回nil，如果没有异常，则返回对应的对象
         guard let array = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
         print("json to array error")
         return
         }
         
         方式3:try! 方式(不建议，非常危险)，直接告诉系统，该方法没有异常，注意：如果该方法出现异常，那么程序会崩溃
         let array = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
         
         */
        
        
        
        guard let array = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            print("json to array error")
            return
        }
        
        //转数组类型
        guard let dictArr = array as? [[String:AnyObject]] else {
            print("数组类型转化失败")
            return
        }
        
        //4.遍历数组
        for dict in dictArr {
            print(dict)
        }
        
    }
    
}

