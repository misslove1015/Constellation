//
//  DetailViewController.swift
//  Constellation
//
//  Created by miss on 16/12/14.
//  Copyright © 2016年 mukr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var index:NSInteger = 0
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "constellation", ofType: "plist")
        let array:NSArray! = NSArray.init(contentsOfFile: path!)
        textView.text = array.object(at: index) as? String
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
        textView.contentOffset = CGPoint(x:0,y:0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
