//
//  SecondViewController.swift
//  GCD
//
//  Created by Артём Коротков on 20.08.2022.
//


import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activity.stopAnimating()
            activity.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFill
        fetchImage()
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://thumbs.dreamstime.com/b/leaf-hd-shots-glorious-pic-best-smartphone-wallpaper-120270449.jpg")
        activity.isHidden = false
        activity.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
       
    }
}


