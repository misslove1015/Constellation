//
//  PairViewController.swift
//  Constellation
//
//  Created by miss on 111/12/14.
//  Copyright © 2016年 mukr. All rights reserved.
//



import UIKit

class PairViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var firstTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secondTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pairViewSecond: UIView!
    @IBOutlet weak var pairViewFirst: UIView!
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var secondImageWidth: NSLayoutConstraint!
    
    @IBOutlet weak var firstImageWidth: NSLayoutConstraint!
    @IBOutlet weak var secondPairViewWidth: NSLayoutConstraint!
    @IBOutlet weak var firstPairViewWidth: NSLayoutConstraint!
    @IBOutlet weak var pairButton: UIButton!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondName: UILabel!
    
    var index1:NSInteger! = 0
    var index2:NSInteger! = 0
    var firstShow:Bool = false;
    var secondShow:Bool = false;
    var array:NSArray!
    var pairArray:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "星座配对"
        textView.text = ""
        if SCREEN_WIDTH <= 320{
            firstImageWidth.constant = 40;
            secondImageWidth.constant = 40;
        }
        textView.textContainerInset = UIEdgeInsetsMake(15, 0, 30, 0)
        pairArray = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "pair", ofType: "plist")!)
        self.setBorder(view: pairViewFirst)
        self.setBorder(view: pairViewSecond)
        self.setBorder(view: firstTableView)
        self.setBorder(view: secondTableView)
        self.setBorder(view: pairButton)
        
        firstPairViewWidth.constant = 145*SCREEN_WIDTH/414
        secondPairViewWidth.constant = 145*SCREEN_WIDTH/414
        firstTableViewHeight.constant = 0
        secondTableViewHeight.constant = 0
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        
    }
    
    func setBorder(view:UIView){
        view.layer.borderColor = UIColor.init(white: 1, alpha: 0.5).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PairTableViewCell = tableView.dequeueReusableCell(withIdentifier: "pairCell") as! PairTableViewCell
        let dic:NSDictionary = array.object(at: indexPath.row) as! NSDictionary
        cell.icon.image = UIImage(named:dic.object(forKey: "icon") as! String)
        cell.name.text = dic.object(forKey: "name")as! String?
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.frame = cell.bounds;
        cell.selectedBackgroundView?.backgroundColor = UIColor.init(colorLiteralRed: 195/255.0, green: 0, blue: 185/255.0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dic:NSDictionary = array.object(at: indexPath.row) as! NSDictionary
        if tableView == firstTableView {
            index1 = indexPath.row
            firstTableViewHeight.constant = 0
            firstShow = false
            self.showAnimation()
            firstImage.image = UIImage(named:dic.object(forKey: "icon") as! String)
            firstName.text = dic.object(forKey: "name") as! String?
        }else{
            index2 = indexPath.row
            secondTableViewHeight.constant = 0
            self.showAnimation()
            secondShow = false
            secondImage.image = UIImage(named:dic.object(forKey: "icon") as! String)
            secondName.text = dic.object(forKey: "name") as! String?

        }
    }
    
    @IBAction func pair(_ sender: Any) {
        let array:NSArray = pairArray.object(at: index1) as! NSArray
        textView.text = array.object(at: index2) as! String
        textView.contentOffset = CGPoint(x:0,y:0)
    }
    
    @IBAction func firstPairButton(_ sender: Any) {
        if firstShow{
            firstTableViewHeight.constant = 0
            self.showAnimation()
        }else{
            firstTableViewHeight.constant = SCREEN_HEIGHT-196
            self.showAnimation()
        }
        firstShow = !firstShow
    }
    
    @IBAction func secondPairButton(_ sender: Any) {
       if secondShow{
            secondTableViewHeight.constant = 0
            self.showAnimation()
        }else{
            secondTableViewHeight.constant = SCREEN_HEIGHT-196
            self.showAnimation()
        }
        secondShow = !secondShow
    }
    
    func showAnimation(){
        UIView.animate(withDuration: 0.3, animations: {() ->Void in
            self.view.layoutIfNeeded()
        })
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
