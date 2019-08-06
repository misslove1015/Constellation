//
//  ViewController.swift
//  Constellation
//
//  Created by miss on 16/12/14.
//  Copyright © 2016年 mukr. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var pairButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pairViewBottomSpace: NSLayoutConstraint!

    var array:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        if SCREEN_WIDTH == 375 {
            pairViewBottomSpace.constant = 10
        }
        
        array = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "twelve", ofType: "plist")!)
        self.setCollection()
        self.setPairButton()
    }

    func setCollection(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:(SCREEN_WIDTH-80)/3,height:(SCREEN_WIDTH-80)/3+15)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        if SCREEN_WIDTH <= 320 {
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            flowLayout.minimumLineSpacing = 10
            flowLayout.minimumInteritemSpacing = 10
        }
        collectionView.collectionViewLayout = flowLayout;
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setPairButton(){
        pairButton.layer.borderColor = UIColor.init(white: 1, alpha: 0.5).cgColor
        pairButton.layer.borderWidth = 1
        pairButton.layer.cornerRadius = 5
        pairButton.layer.masksToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let dic:NSDictionary = array.object(at: indexPath.row) as! NSDictionary
        cell.image.image = UIImage(named:dic.object(forKey: "icon") as! String)
        cell.name.text = dic.object(forKey: "name") as! String?
        cell.date.text = dic.object(forKey: "date") as! String?
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.frame = cell.bounds;
        cell.selectedBackgroundView?.backgroundColor = UIColor(red: 195/255.0, green: 0, blue: 185/255.0, alpha: 1)
        cell.layer.borderColor = UIColor.init(white: 1, alpha: 0.5).cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell;
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detail:DetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
         let dic:NSDictionary = array.object(at: indexPath.row) as! NSDictionary
        detail.title = dic.object(forKey: "name") as? String
        detail.index = indexPath.row
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    @IBAction func pair(_ sender: Any) {
        let pair:PairViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pair") as! PairViewController
        pair.array = array
        self.navigationController?.pushViewController(pair, animated: true)
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

