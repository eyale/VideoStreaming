//
//  ViewController.swift
//  VideoStreaming
//
//  Created by Anton Honcharov on 6/4/21.
//

import UIKit


struct VideoItem {
  var title: String
  var subtitle: String
  var image: String
  var videoURL: String

  init(title: String, subtitle: String, image: String, videoURL: String) {
    self.title = title
    self.subtitle = subtitle
    self.image = image
    self.videoURL = videoURL
  }
}

class VideoFeedVC: UIViewController {
  // MARK: - Properties

  var list = [VideoItem]()

  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
}

// MARK: - Life cycle
extension VideoFeedVC {
  override func viewDidLoad() {
    super.viewDidLoad()

    setupTableView()
  }
}
// MARK: - Set up
extension VideoFeedVC {
  func setupTableView() {
    self.tableView.delegate = self
    self.tableView.dataSource = self

    let inset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    self.tableView.contentInset = inset
    self.list.append(contentsOf: K.mockDataForVideoFeed)
  }
}
// MARK: - IBActions
// MARK: - Navigation
// MARK: - Network Manager calls
// MARK: - Extensions
extension VideoFeedVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    list.count
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let vc = VideoDetailsVC.loadFromStoryboard()

    vc.title = list[indexPath.row].title
    vc.videoURL = list[indexPath.row].videoURL
    vc.videoTitleProp = list[indexPath.row].title
    vc.videoSubtitleProp = list[indexPath.row].subtitle
    self.navigationController?.pushViewController(vc, animated: true)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 120 }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.cellID) as! VideoCell
    let item = list[indexPath.row]
    cell.configure(with: item)

    return cell
  }
}

