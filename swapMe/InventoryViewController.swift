//
//  InventoryViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/15/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class InventoryViewController: RootViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    
    @IBOutlet var hamburgerButton: UIBarButtonItem!
    @IBOutlet var collectionView: UICollectionView?
    
    var items = ["potspans", "record player", "ring1", "skirt", "skirt2", "Speakers", "Speakers2", "sunglasses", "Textbooks", "watch", "watch2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.revealViewController() != nil
        {
            hamburgerButton.target = self.revealViewController()
            hamburgerButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        if (indexPath.row % 4 == 0)
        {
            cell.backgroundColor = UIColor.redColor()
        }
        else
        {
            cell.backgroundColor = UIColor.yellowColor()
        }
        cell.imageView.image = UIImage(named: items[indexPath.row])
        return cell
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Parse login
        super.loginSetup()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CollectionViewCell: UICollectionViewCell
{
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    var textLabel: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = .Redraw
        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 0, y: 32, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
    }
}


