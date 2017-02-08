//
//  AddCardViewController.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/3/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import UIKit
import os.log

class AddCardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lable: UITextField!
    
    @IBAction func save(_ sender: Any) {
        let card = Card(lable.text!, image.image!)
        saveCard(card)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func saveCard(_ card: Card) -> Bool {
        
        var cards = Utils.loadCards()
        cards.append(card)
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(cards, toFile: Settings.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Card successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save card...", log: OSLog.default, type: .error)
        }
        
        return isSuccessfulSave

    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        lable.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        image.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
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
