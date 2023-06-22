//
//  ViewController2.swift
//  textToSpeech
//
//  Created by R96 on 19/06/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var choiseCollectionView: UICollectionView!
    
    var img1 = [UIImage(named: "1"),UIImage(named: "2")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension ViewController2 : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = choiseCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChoiseCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 3
        cell.img.image = img1[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let n = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            
            navigationController?.pushViewController(n, animated: true)
        }
        else {
            let n = storyboard?.instantiateViewController(identifier: "ViewController3") as! ViewController3
            
            navigationController?.pushViewController(n, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: choiseCollectionView.frame.width/2, height: 200)
    }
}
