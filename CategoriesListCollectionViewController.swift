//
//  CategoriesListCollectionViewController.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/9/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let cellEdge = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

class CategoriesListCollectionViewController: UICollectionViewController {
    
    var categories: [Category] = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        collectionView?.dataSource = self
        
        categories = CategoryService.getAllCategoriesWithCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? CardCollectionViewController {
            if let cell = sender as? UICollectionViewCell, let indexPath = collectionView?.indexPath(for: cell) {
               //destination.cards = categories[indexPath.row].cards
                //TODO remov it
                destination.numberOfCards = indexPath.row + 1
            }
            
        }
    }
   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        //return categories.count + 1
        return 12
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoriesListCollectionViewCell
        
//        if indexPath.row == categories.count {
//            cell.image.image = #imageLiteral(resourceName: "plusIcon")
//            cell.label.text = "Add category"
//        } else {
//            let category = categories[indexPath.row]
//            
//            cell.image.image = category.image
//            cell.label.text = category.name
//        }
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
