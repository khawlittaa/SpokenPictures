//
//  RecordAudioViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController {
    
    @IBOutlet weak var timeCounterLabel: UILabel!
    @IBOutlet weak var selectedimage: UIImageView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var recordButton: UIButton!
    
    var recordAudioVM = RecordAudioViewModel()
    var editPhotoVm: EditPhotoViewModel?
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    private var timer: Timer?
    private var shapeLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecordingSession()
        BindToViewModel()
        addNavigationBarItem()
        selectedimage.roundImage()
        
    }
    
    func setRecordingSession(){
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        //                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
        
    }
    
    func addNavigationBarItem(){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let continueuttonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(continueTapped))
        self.navigationItem.rightBarButtonItem = continueuttonItem
        
    }
    
    @objc func continueTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    func BindToViewModel(){
        
    }
    
    @objc private func handleTimer(){
        if let _ = timer {
            recordAudioVM.timerDuration = recordAudioVM.timerDuration  - 1
            displayRemainingTime(seconds: recordAudioVM.timerDuration)
            
            if recordAudioVM.timerDuration  == 0 {
                stopRecording()
            }
        }
    }
    
    private  func displayRemainingTime(seconds: Int){
        
        let (m, s) = secondsToMinutesSeconds(seconds: seconds)
        timeCounterLabel.text = "\(m) : \(s)"
    }
    
    private func stopRecording(){
        recordAudioVM.isRecording = false
        
        view.layer.sublayers = view.layer.sublayers?.filter { layer in
            !layer.isKind(of: CAShapeLayer.classForCoder())
        }
        // Mark: Displaying  Loadding screen
        if let _ = timer {
            let pausedTime = shapeLayer.convertTime(CACurrentMediaTime(), from: nil)
            
            shapeLayer.speed = 0.0
            shapeLayer.timeOffset = pausedTime
            
            timer!.invalidate()
            timer = nil
            
            
            let afterTime = DispatchTime.now() + .seconds(4)
            DispatchQueue.main.asyncAfter(deadline: afterTime, execute: {
                
                UIView.animate(withDuration: 0.4) {
                    self.resetRecording()
                    
                }
            })
        }
        
        updateDesignBasedOnRecordingStatus()
    }
    
    private func updateDesignBasedOnRecordingStatus(){
        recordButton.isHidden = recordAudioVM.isRecording
        timeCounterLabel.isHidden = !recordAudioVM.isRecording
    }
    
    private func addSublayer(color:CGColor){
        let center = loaderView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 160, startAngle:(3 * CGFloat.pi) / 2, endAngle:(7 * CGFloat.pi) / 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.lineWidth = 10
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
    }
    
    private func resetRecording(){
        
        recordAudioVM.timerDuration  = 120
        recordAudioVM.isRecording = false
        displayRemainingTime(seconds: recordAudioVM.timerDuration)
        
        view.layer.sublayers = view.layer.sublayers?.filter { layer in
            !layer.isKind(of: CAShapeLayer.classForCoder())
        }
        
        shapeLayer = CAShapeLayer()
        trackLayer = CAShapeLayer()
        
        updateDesignBasedOnRecordingStatus()
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            editPhotoVm?.hasAudio.onNext(true)
            print("recorded with succeess")
        } else {
            editPhotoVm?.hasAudio.onNext(false)
            print("recording failed :(")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
        } catch {
            finishRecording(success: false)
        }
    }
    
    @IBAction func recordButtonPressed(_ sender: Any) {
        timeCounterLabel.isHidden = false
        
        recordAudioVM.isRecording = true
        
        if audioRecorder == nil {
            startRecording()
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
            
            updateDesignBasedOnRecordingStatus()
            
            addSublayer(color: UIColor.accentAccent31Main.cgColor)
            
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            basicAnimation.toValue = 1
            basicAnimation.duration = 120
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            basicAnimation.isRemovedOnCompletion = false
            
            shapeLayer.add(basicAnimation, forKey: "loader")
        } else {
            finishRecording(success: true)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        stopRecording()
        finishRecording(success: true)
    }
    
    @IBAction func redoButtonPressed(_ sender: Any) {
        resetRecording()
    }
}

extension RecordAudioViewController: AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
          print("Error while recording audio \(error!.localizedDescription)")
      }
}
