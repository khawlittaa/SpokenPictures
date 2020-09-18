//
//  EditPhotoViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import RxSwift
import AVFoundation

class EditPhotoViewController: UIViewController {
    
    @IBOutlet weak var audioDurationLabel: UILabel!
    @IBOutlet weak var audioProgresssBar: UIProgressView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var deleteAudioButton: UIButton!
    @IBOutlet weak var playAudioButton: UIButton!
    @IBOutlet weak var recordAudioButton: UIButton!
    @IBOutlet weak var playAudioView: UIView!
    @IBOutlet weak var deleteAudioView: UIView!
    
    let editPhotoVm = EditPhotoViewModel()
    let disposeBag = DisposeBag()
    
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarItem()
        BindToViewModel()
        self.audioProgresssBar.progress = 0.0
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        //        audioPlayer.stop()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func showAudioDuration(){
        let duration =  (Int(audioPlayer.duration))
        
        let (m, s) = secondsToMinutesSeconds(seconds: duration)
        audioDurationLabel.text = "\(m) : \(s)"
    }
    
    func getFileURL() -> URL {
        let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        return path as URL
    }
    
    func preparePlayer() {
        var error: NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: getFileURL() as URL)
        } catch let error1 as NSError {
            error = error1
            audioPlayer = nil
        }
        
        if let err = error {
            print("AVAudioPlayer error: \(err.localizedDescription)")
        } else {
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 10.0
        }
    }
    
    func BindToViewModel(){
        self.editPhotoVm.hasAudio
            .bind(to: recordAudioButton.rx.isHidden)
            .disposed(by: self.disposeBag)
        
        self.editPhotoVm.hasAudio
            .map{$0 ? false : true}
            .bind(to: playAudioView.rx.isHidden)
            .disposed(by: self.disposeBag)
        
    }
    
    func addNavigationBarItem(){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let continueuttonItem = UIBarButtonItem(title: "Add to album", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = continueuttonItem
        
    }
    
    
    @objc func addTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc  func updateAudioProgressView()
    {
        if audioPlayer.isPlaying
        {
            // Update progress
            audioProgresssBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    @IBAction func playButtonPressed(_ sender: Any) {
        preparePlayer()
        audioPlayer.play()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
        audioProgresssBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
        showAudioDuration()
        print("duration is \(Int(audioPlayer.duration))")
    }
    
    
    @IBAction func deleteAudioPressed(_ sender: Any) {
        deleteAudioView.isHidden = false
    }
    
    @IBAction func recordAudioPressed(_ sender: Any) {
        let recordVC = album.instantiateViewController(withIdentifier: "RecordAudioVC") as! RecordAudioViewController
        recordVC.editPhotoVm = self.editPhotoVm
        navigationController?.pushViewController(recordVC, animated: true)
    }
    
    @IBAction func ConfirmDeletePressed(_ sender: Any) {
    }
    
    @IBAction func cancelDeletePressed(_ sender: Any) {
        deleteAudioView.isHidden = true
    }
    
}


extension EditPhotoViewController: AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finished playing audio")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
}
