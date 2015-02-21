//
//  MapSelectorController.swift
//  Platformer
//
//  Created by Simas Abramovas on 2/21/15.
//  Copyright (c) 2015 Simas Abramovas. All rights reserved.
//

import Foundation
import UIKit

class MapSelectorController: UIViewController {
    
    @IBOutlet var mapPreview: UIImageView!
    // Every map selection (should be an array or indexed buttons)
    @IBOutlet var map1: UIButton!
    @IBOutlet var map2: UIButton!
    @IBOutlet var map3: UIButton!
    @IBOutlet var map4: UIButton!
    @IBOutlet var map5: UIButton!
    
    
    
    @IBAction func mapSelected(sender: AnyObject) {
        var data : NSData?
        
        // Fetch url from button
        var urlStr : String?
        let rand = Int(arc4random_uniform(2)) // fetch data from button instead
        
        switch rand {
        case 0:
            urlStr = "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png"
        case 1:
            urlStr = "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png"
        case 2:
            urlStr = "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png"
        default:
            urlStr = "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png"
        }
        
        if let urlString = urlStr {
            if let url = NSURL(string: urlString) {
                data = NSData(contentsOfURL: url)
                if data == nil {
                    println("Error couldn't fetch img \(urlString)")
                    return;
                }
            } else {
                println("Error invalid url \(urlString)")
            }
        }
        
        mapPreview.contentMode = UIViewContentMode.ScaleAspectFit
        mapPreview.image = UIImage(data: data!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set button backgrounds (should use assets)
        map1.addSubview(fetchImageInView("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            container: map1)!)
        map2.addSubview(fetchImageInView("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            container: map1)!)
        map3.addSubview(fetchImageInView("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            container: map1)!)
        map4.addSubview(fetchImageInView("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            container: map1)!)
        map5.addSubview(fetchImageInView("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            container: map1)!)
        
    }
    
    func fetchImageInView(url : String, container : UIView) -> UIImageView? {
        if let myUrl = NSURL(string: url) {
            if let data = NSData(contentsOfURL: myUrl) {
                let image = UIImage(data: data)
                var bgImage = UIImageView(image: image)
                bgImage.contentMode = UIViewContentMode.ScaleAspectFit
                bgImage.frame = CGRect(x: 0, y: 0, width: map1.frame.size.width, height: map1.frame.size.height)
                
                return bgImage;
            } else {
                println("Error couldn't fetch img \(url)")
            }
        } else {
            println("Error invalid url \(url)")
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}