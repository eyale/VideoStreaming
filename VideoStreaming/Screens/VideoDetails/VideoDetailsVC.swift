//
//  VideoDetailsVC.swift
//  VideoStreaming
//
//  Created by Anton Honcharov on 6/9/21.
//

import UIKit
import AVKit

class VideoDetailsVC: UIViewController {
  // MARK: - Properties
  var videoURL: String?
  var videoTitleProp = ""
  var videoSubtitleProp = ""

  // MARK: - IBOutlets
  @IBOutlet weak var videoTitle: UILabel!
  @IBOutlet weak var videoDescription: UILabel!
  @IBOutlet weak var videoWrapper: UIView!
}


// MARK: - Life cycle
extension VideoDetailsVC {
  override func viewDidLoad() {
    super.viewDidLoad()

    playVideo()
    setupUI()
  }
}
// MARK: - Set up
extension VideoDetailsVC {
  func setupUI() {
    videoTitle.text = videoTitleProp
    videoDescription.text = videoSubtitleProp
  }
}

// MARK: - Methods
extension VideoDetailsVC {
  private func playVideo() {
    if let videoString = videoURL, let url = URL(string: videoString) {
      let player = AVPlayer(url: url)
      let playerLayer = AVPlayerLayer(player: player)
      playerLayer.frame = CGRect(x: 0,
                                 y: 10,
                                 width: videoWrapper.bounds.size.width,
                                 height: videoWrapper.bounds.size.height / 1.1)

//        playerLayer.frame = self.view.frame
      self.videoWrapper.layer.addSublayer(playerLayer)
      player.play()
      
      //      let playerController = AVPlayerViewController()
      //      playerController.player = player
      //      present(playerController, animated: true) {
      //        player.play()
      //      }
    }
  }
}
// MARK: - IBActions
// MARK: - Navigation
// MARK: - Network Manager calls
// MARK: - Extensions
