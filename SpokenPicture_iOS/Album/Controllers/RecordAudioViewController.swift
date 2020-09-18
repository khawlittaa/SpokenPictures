//
//  RecordAudioViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class RecordAudioViewController: UIViewController {
    
    @IBOutlet weak var timeCounterLabel: UILabel!
    @IBOutlet weak var selectedimage: UIImageView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var recordButton: UIButton!
    
    var recordAudioVM = RecordAudioViewModel()
    
    private var timer: Timer?
//    private var counter : Int = 30
    private var shapeLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BindToViewModel()
        selectedimage.roundImage()
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
        let circularPath = UIBezierPath(arcCenter: center, radius: 160, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
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
    }
    
    @IBAction func recordButtonPressed(_ sender: Any) {
        timeCounterLabel.isHidden = false
        
        recordAudioVM.isRecording = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        
        updateDesignBasedOnRecordingStatus()
        
        addSublayer(color: UIColor.accentAccent31Main.cgColor)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 120
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "loader")
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        stopRecording()
    }
    
    @IBAction func redoButtonPressed(_ sender: Any) {
        
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
}
