//
//  ViewController.swift
//  textToSpeech
//
//  Created by R96 on 17/06/23.
//

import UIKit
import AVFoundation


class ViewController: UIViewController{
   
    @IBOutlet weak var pg: UISlider!
    
    
    @IBOutlet weak var aToZCollectionView: UICollectionView!
    
    let synth = AVSpeechSynthesizer()
    
    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var alphabetVoice = ["A For Apple","B For Ball","C Foe Cat","D For Dog","E For Elephant","F For Fish","G for Got","H For Horse","I For Icecream","J For Jug","K For Kite","L For Lione","M For Monkey","N For Nest","O For Orenge","P For Parrot","Q For Qune","R For Ret","S For Sun","T For Teger","U For Umbrella","V For Van","W For Watch","X","Y For Yak","Z For Zibra"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pg.isHidden = true
        pg.value = 1
    }
    
    @IBAction func volumeButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.pg.isHidden.toggle()
        }
    }
    
}


extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = aToZCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! aToZCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 3
        
        cell.alphabetLable.text = alphabet[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let string = alphabetVoice[indexPath.row]
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        utterance.rate = 0.50
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = pg.value
        print(pg.value)
        synth.speak(utterance)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
}
