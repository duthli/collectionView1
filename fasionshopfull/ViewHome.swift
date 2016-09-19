//
//  ViewHome.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ViewHome: UIViewController {
    var items:[Item] = []
    override func viewDidLoad() {
        var myDict : NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
        {
        
            myDict = NSDictionary(contentsOfFile: path)
        
        }
        for dict in myDict!.allValues{
        
        items.append(Item(name: dict["name"] as! String, content: dict["content"] as! String, nameImages: dict["images"] as! NSArray as! [String], price: dict["price"] as! String))
        }
    }


    func collectionView(collectionView: UICollectionView,numberOfItemsInSection section : Int)->Int{
        return items.count
    }
    func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath : NSIndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let img = UIImageView(image:UIImage(named: items[indexPath.item].nameImages[0]+".jpg"))
        img.frame = CGRectMake(0, 0, 100, 100)
        img.contentMode = .ScaleAspectFit
        cell.contentView.addSubview(img)
        return cell
    }
}
