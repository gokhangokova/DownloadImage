//
//  ViewController.swift
//  DownloadImage
//
//  Created by Gokhan Gokova on 1.11.2018.
//  Copyright © 2018 Gokhan Gokova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageURL = URL(string: "https://uygulamaincele.com/wp-content/uploads/2018/10/golf-battle-apk.jpg") else { return }
        
        let request = URLRequest(url: imageURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            if err != nil {
                
            } else {
                
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
        task.resume()
    }
}

