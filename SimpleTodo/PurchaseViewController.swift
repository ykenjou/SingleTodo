//
//  PurchaseViewController.swift
//  SimpleTodo
//
//  Created by kenjou yutaka on 2016/08/28.
//  Copyright © 2016年 yutaka kenjo. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseViewController: UIViewController {
    
    @IBOutlet weak var purchaseButton: UIButton!

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        purchaseButton.layer.borderWidth = 1
        purchaseButton.layer.borderColor = UIColor.redColor().CGColor
        purchaseButton.layer.cornerRadius = 10
        purchaseButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        purchaseButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        textView.text = "App Upgrade\nHide Advertisement"
        
        //プロダクトID達
        let productIdentifiers = ["com.kdevelop.SingleTodoList.upgrade"]
        
        //プロダクト情報取得
        XXXProductManager.productsWithProductIdentifiers(productIdentifiers, completion: { (products : [SKProduct]!, error : NSError?) -> Void in
                for product in products {
                    //価格を抽出
                    let priceString = XXXProductManager.priceStringFromProduct(product)
                    /*価格情報を使って表示を更新したり。*/
                    self.purchaseButton.setTitle(priceString, forState: .Normal)
                }
        })
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

}
