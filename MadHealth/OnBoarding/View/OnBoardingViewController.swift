//
//  OnBoardingViewController.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 18.11.22.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var pageCounter: UIPageControl!
    
    @IBOutlet weak var skipButton: UIButton!
    
    var currentPage : Int = 0{
        didSet{
            if currentPage == slides.count - 1{
                //skipButton.setTitle("Закончить обучение", for: .normal)
                skipButton.titleLabel?.text = "Закончить обучение"
            }
            else {
                skipButton.titleLabel?.text = "Пропустить обучение"
            }
        }
    }
    
    var slides : [OnBoardingSlideProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnBoardingSlide(image: UIImage(named: "hand")!, title: "Заголовок 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat"),
            OnBoardingSlide(image: UIImage(named: "hand")!, title: "Заголовок 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat"),
            OnBoardingSlide(image: UIImage(named: "wheelchair")!, title: "Заголовок 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat")
        ]
        pageCounter.numberOfPages = slides.count
    }
    
    @IBAction func skipOnBoarding(_ sender: Any) {
        UserDefaultsManager.storage.setBool(value: true, data: .onBoardingIsShowed)
        let alert = UIAlertController(title: "Skip?", message: "Are you shure?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.show(alert, sender: nil)
    }
}

extension OnBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setupCell(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        pageCounter.currentPage = currentPage
    }
}


