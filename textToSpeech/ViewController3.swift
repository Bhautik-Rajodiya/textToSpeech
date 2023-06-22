//
//  ViewController3.swift
//  textToSpeech
//
//  Created by R96 on 19/06/23.
//

import UIKit
import AVFoundation

class ViewController3: UIViewController {

    @IBOutlet weak var digitCollectionView: UICollectionView!
    let synth = AVSpeechSynthesizer()
    var digit = ["1","2","3","4","5","6","7","8","9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension ViewController3 : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return digit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = digitCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DigitCollectionViewCell
        cell.digitLable1.text = digit[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 3
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let string = digit[indexPath.row]
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "gu-US")
        
        utterance.rate = 0.50
//        utterance.pitchMultiplier = 0.8
//        utterance.postUtteranceDelay = 0.2
//        utterance.volume = 0.8
        
        synth.speak(utterance)
    }
    
}
