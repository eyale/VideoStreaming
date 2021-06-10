//
//  VideoCellVC.swift
//  VideoStreaming
//
//  Created by Anton Honcharov on 6/4/21.
//

import UIKit

class VideoCell: UITableViewCell {
  // MARK: - Properties
  static let cellID = "VideoCell"
  // MARK: - IBOutlets
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var subtitle: UILabel!
  @IBOutlet weak var cover: UIImageView!
}

// MARK: - Life cycle
extension VideoCell {
  override class func awakeFromNib() {}
}
// MARK: - Set up
extension VideoCell {
  func configure(with data: VideoItem) {
    title.text = data.title
    subtitle.text = data.subtitle
    cover.downloaded(from: data.image)
  }
}
// MARK: - IBActions
// MARK: - Navigation
// MARK: - Network Manager calls
// MARK: - Extensions
