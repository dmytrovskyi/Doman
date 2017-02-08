//
//  ViewController.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/2/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    private var cards = [Card]()
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.isHidden = true
        label.isHidden = true
        
       cards = Utils.loadCards()
    }
    
    
    @IBAction func playSet() {
        playButton.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showCard), userInfo: nil, repeats: true)
    }
    
    var count = 0
    
    @objc private func showCard(){
        
        if cards.count == count {
            timer!.invalidate()
            count = 0
            hideImageShowPlayButton()
            return
        }
        
        print("card size = \(cards.count)")
        print("current count = \(count)")
        
        let card = cards[count]
        
        label.text = card.label
        label.sizeToFit()
        label.isHidden = false
        
        image.image = card.image
        image.isHidden = false
        
        count += 1
    }
    
    private func hideImageShowPlayButton(){
        image.isHidden = true
        label.isHidden = true
        
        playButton.isHidden = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

