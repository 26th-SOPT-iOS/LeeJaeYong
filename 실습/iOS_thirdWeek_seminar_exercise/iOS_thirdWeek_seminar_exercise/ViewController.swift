//
//  ViewController.swift
//  iOS_thirdWeek_seminar_exercise
//
//  Created by 이재용 on 2020/05/09.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    private var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicList()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func setMusicList() {
        let music1 = Music(coverName: "album_iu", musicTitle: "삐삐", singer: "아이유")
        let music2 = Music(coverName: "album_vibe", musicTitle: "가을 타나봐", singer: "바이브")
        let music3 = Music(coverName: "album_yangdail", musicTitle: "고백", singer: "양다일")
        let music4 = Music(coverName: "album_im", musicTitle: "하루도 그대를 사랑하지 않은 적이 없었다", singer: "임창정")
        let music5 = Music(coverName: "album_smtm7", musicTitle: "Save (Feat. 팔로알토)", singer: "루피(Loopy)")
        let music6 = Music(coverName: "album_ziont", musicTitle: "멋지게 인사하는 법 (Feat. 슬기)", singer: "Zion.T")
        let music7 = Music(coverName: "album_bts", musicTitle: "IDOL", singer: "방탄소년단")
        let music8 = Music(coverName: "album_loco", musicTitle: "시간이 들겠지 (Feat. Colde)", singer: "로꼬")
        let music9 = Music(coverName: "album_paul", musicTitle: "모든 날, 모든 순간", singer: "폴킴")
        let music10 = Music(coverName: "album_shaun", musicTitle: "Way Back Home", singer: "숀(SHAUN)")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicList.count
    }
    
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicList[row].musicTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        albumImageView.image = musicList[row].albumImg
        titleLabel.text = musicList[row].musicTitle
        singerLabel.text = musicList[row].singer
    }
}

