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
import PixelEditor
import PixelEngine
import TOCropViewController

class EditPhotoViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
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
    var originalImage = UIImage()
    var sourcePostcardVM: PostsCardViewModel?
    var albumItem: AlbumViewModelItem?
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarItem()
        BindToViewModel()
        self.audioProgresssBar.progress = 0.0
//        imge selected by user
        setImageToEdit()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setImageToEdit(){
        albumImage.image = originalImage
    }

    
    func showAudioDuration(){
        let duration =  (Int(audioPlayer.duration))
        
        let (m, s) = secondsToMinutesSeconds(seconds: duration)
        audioDurationLabel.text = "\(m) : \(s)"
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
    
//MARK: set selected image to its original destination
    @objc func addTapped()  {
        self.navigationController?.popViewController(animated: true)
     // show postcard view with edited image + audio here
        let postcardVC = postcard.instantiateViewController(withIdentifier: "PostCardLayoutVC") as! PostCardLayoutViewController
        if let postacdVM = sourcePostcardVM{
            postcardVC.postCardVm = postacdVM
            postcardVC.postCardVm.postCardimage.finalImage = albumImage.image
        }
    }
    
    @objc  func updateAudioProgressView()
    {
        if audioPlayer.isPlaying
        {
            audioProgresssBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    
    func presentCropViewController() {
        let image: UIImage = albumImage.image!
        
        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self
        
        present(cropViewController, animated: true, completion: nil)
    }
    
    func showBrightnessEditor(){
        
        let image: UIImage = albumImage.image!
        
        var options = Options.default
        options.classes.control.rootControl = EditBrightnessRootControl.self
        
        let picker = PixelEditViewController(image: image, options: options)
        picker.delegate = self
        
        navigationController?.pushViewController(picker, animated: true)
    }
    
    func showContrastEditor(){
        
        let image: UIImage = albumImage.image!
        
        var options = Options.default
        options.classes.control.rootControl = EditContrastRootControl.self
        
        
        let picker = PixelEditViewController(image: image, options: options)
        picker.delegate = self
        
        navigationController?.pushViewController(picker, animated: true)
    }
    
    @IBAction func cropButtonPressed(_ sender: Any) {
        presentCropViewController()
    }
    
    @IBAction func contrastButtonPressed(_ sender: Any) {
        showContrastEditor()
    }
    
    @IBAction func brightnessButtonPressed(_ sender: Any) {
        showBrightnessEditor()
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        self.albumImage.image = self.originalImage
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
        let recordVC = editing.instantiateViewController(withIdentifier: "RecordAudioVC") as! RecordAudioViewController
        recordVC.editPhotoVm = self.editPhotoVm
        navigationController?.pushViewController(recordVC, animated: true)
    }
    
    @IBAction func ConfirmDeletePressed(_ sender: Any) {
    }
    
    @IBAction func cancelDeletePressed(_ sender: Any) {
        deleteAudioView.isHidden = true
    }
    
}
// MARK:- TOCropViewControllerDelegate used to crop image
extension EditPhotoViewController: TOCropViewControllerDelegate{
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        // 'image' is the newly cropped version of the original image
        albumImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK:- AVAudioPlayerDelegate used to play audio
extension EditPhotoViewController: AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finished playing audio")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
}


// MARK:- PixelEditViewControllerDelegate used to edit photo
extension EditPhotoViewController : PixelEditViewControllerDelegate {
    
    func pixelEditViewController(_ controller: PixelEditViewController, didEndEditing editingStack: EditingStack) {
        // end editing and back to main view
        self.navigationController?.popToViewController(self, animated: false)
        let image = editingStack.makeRenderer().render(resolution: .full)
        self.albumImage.image = image
    }
    
    func pixelEditViewControllerDidCancelEditing(in controller: PixelEditViewController) {
        self.navigationController?.popToViewController(self, animated: true)
    }
}
