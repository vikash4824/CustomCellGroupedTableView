//
//  SecontPage.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 19/03/21.
//

import UIKit
import AVKit
import AVFoundation

class SecontPage: UIViewController {
    @IBOutlet weak var PosterImgView: UIImageView!
    @IBOutlet weak var TrailerThumbImgView: UIImageView!
    @IBOutlet weak var TitleLB: UILabel!
    @IBOutlet weak var ActorLB: UILabel!
    @IBOutlet weak var DirectorLB: UILabel!
    var videoUrl = ""
    var audioUrl = ""
    var poster = ""
    var actor = ""
    var director = ""
    var moviename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUp()
        let url = URL(string: videoUrl)
        // Do any additional setup after loading the view.
        self.getThumb(url: url!) { (thumbImage) in
            self.PosterImgView.image = thumbImage
        }

    }
    func SetUp()
    {
        self.PosterImgView.imageDisplay(url: poster)
        self.ActorLB.text = actor
        self.TitleLB.text = title
        self.DirectorLB.text = director
        
    }
    
    @IBAction func AudioBT(_ sender: Any) {
    let url = URL(string: videoUrl)!
    let player = AVPlayer(url: url as URL)
    let videoPlayerView = AVPlayerViewController()
        videoPlayerView.player = player
        videoPlayerView.player?.play()
        self.present(videoPlayerView, animated: true)
    }
    
    @IBAction func TrailerBT(_ sender: Any) {
        let url = URL(string: audioUrl)!
        let player = AVPlayer(url: url as URL)
        let AudioPlayerView = AVPlayerViewController()
            AudioPlayerView.player = player
            AudioPlayerView.player?.play()
            self.present(AudioPlayerView, animated: true)
    }
    func getThumb(url: URL, complation: @escaping ((_ image: UIImage)->Void)){
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let avAssetImageGenator = AVAssetImageGenerator(asset: asset)
            avAssetImageGenator.appliesPreferredTrackTransform = true
            
            let thumbNail = CMTimeMake(value: 7, timescale: 1)
            do{
                let cgThumbImage = try avAssetImageGenator.copyCGImage(at: thumbNail, actualTime: nil)
                let thumbImage = UIImage(cgImage: cgThumbImage)
                
                DispatchQueue.main.async {
                    complation(thumbImage)
                }
                
            } catch {
                print(error.localizedDescription)
                
            }
                
                
               
            
                
            }
    }
}
