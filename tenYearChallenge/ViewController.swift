//
//  ViewController.swift
//  tenYearChallenge
//
//  Created by 林家宇 on 2020/7/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showImage: UIImageView!
    @IBOutlet var showSwitch: UISwitch!
    @IBOutlet var showDatepicker: UIDatePicker!
    @IBOutlet var showStepper: UIStepper!
    @IBOutlet var showSlider: UISlider!
    
    @IBOutlet var showSliderVal: UILabel!
    @IBOutlet var showDateVal: UILabel!
    
    var timer:Timer?
    var timeCount:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func sliderDo(_ sender: UISlider) {
        let selectNum = Int(sender.value)
        changeImage(imgNum:selectNum)
        changeSliderShowVal(sliderNum:selectNum)
        changeDatepicker(yearNum: selectNum)
        changeDatepickerShowVal(yearNum:selectNum)
        changeStepper(val: selectNum)
    }
    
    @IBAction func datepickerDo(_ sender: UIDatePicker) {
        let nowSelDate = sender.date
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateStr = dateFormatter.string(from: nowSelDate)
         dateFormatter.dateFormat = "yy"
        let year = Int(dateFormatter.string(from: nowSelDate))  ?? 0
//        showDateVal.text = dateStr
        changeImage(imgNum:year)
        changeSlider(sliderNum:year)
        changeSliderShowVal(sliderNum:year)
//        changeDatepicker(yearNum: year)
        changeDatepickerShowVal(yearNum:year)
        changeStepper(val: year)
        
    }
    
    @IBAction func stepperDo(_ sender: UIStepper) {
        let num = Int(sender.value)
        changeImage(imgNum:num)
        changeSlider(sliderNum:num)
        changeSliderShowVal(sliderNum:num)
        changeDatepicker(yearNum: num)
        changeDatepickerShowVal(yearNum:num)
//        changeStepper(val: num)
    }
    
    @IBAction func switchDo(_ sender: UISwitch) {
        
        if sender.isOn{
//            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in timeCount = self.timeFunc(timeCount:timeCount)
//                    })
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        }else{
            timer?.invalidate()
        }
    }
    func changeImage(imgNum:Int){
        let image = UIImage(named: "album"+String(imgNum))
        showImage.image = image
    }
    func changeSliderShowVal(sliderNum:Int){
        showSliderVal.text = "\(sliderNum)"
    }
    func changeDatepickerShowVal(yearNum:Int){
        let dateStr = "20"+String(format: "%02d", yearNum)+"-01-01"
        showDateVal.text = "\(dateStr)"
    }
    func changeDatepicker(yearNum:Int){
        let dateStr = "20"+String(format: "%02d", yearNum)+"-01-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateStr)
        showDatepicker.date = date!
        
    }
    func changeSlider(sliderNum:Int){
        showSlider.value = Float(sliderNum)
    }
    func changeStepper(val:Int){
        showStepper.value = Double(val)
    }
    @objc func timeFunc(){
        print("\(timeCount)")
        let sliderVal = Int(showSlider.value)
        if sliderVal==40{
            timeCount = 0
        }else if sliderVal != timeCount{
            timeCount = sliderVal+1
        }
        changeImage(imgNum:timeCount)
        changeSlider(sliderNum:timeCount)
        changeSliderShowVal(sliderNum:timeCount)
        changeDatepicker(yearNum: timeCount)
        changeDatepickerShowVal(yearNum:timeCount)
        changeStepper(val: timeCount)
//        var returnTimeCount:Int
        if timeCount >= 40 {
            timeCount = 0
        }else{
            timeCount += 1
        }
//        return returnTimeCount
        print("last:\(timeCount)")
    }

}

