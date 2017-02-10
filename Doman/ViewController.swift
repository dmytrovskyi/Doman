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
        showCard()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showCard), userInfo: nil, repeats: true)
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
        
        image.image = UIImage(contentsOfFile: Settings.DocumentsDirectory.appendingPathComponent(card.label + Settings.imageFormat).path)
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
    
    @IBAction func switchToSettings(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
    }
}

