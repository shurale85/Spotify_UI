//
//  MenuBar.swift
//  Spotify
//
//  Created by NewUSER on 30.01.2022.
//

import Foundation
import UIKit

protocol MenuBarDelegate: AnyObject {
    func  didSelectItemAt(index: Int)
}

class MenuBar: UIView {
    
    let playlistButton: UIButton!
    let artistButton: UIButton!
    let albumButton: UIButton!
    var buttons: [UIButton]!
    
    weak var menuBarDelegate: MenuBarDelegate?
    
    override init(frame: CGRect) {
                
        playlistButton = makeButton(withText: "Playlists")
        artistButton = makeButton(withText: "Artists")
        albumButton = makeButton(withText: "Album")
        buttons = [playlistButton, artistButton, albumButton]
        
        super .init(frame: .zero)
        
        playlistButton.addTarget(self, action: #selector(playlistButtonTapped), for: .primaryActionTriggered)
        artistButton.addTarget(self, action: #selector(artistButtonTapped), for: .primaryActionTriggered)
        albumButton.addTarget(self, action: #selector(albumButtonTapped), for: .primaryActionTriggered)
        setAlpha(for: playlistButton)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        addSubview(playlistButton)
        addSubview(artistButton)
        addSubview(albumButton)
        
        NSLayoutConstraint.activate([
            playlistButton.topAnchor.constraint(equalTo: topAnchor),
            playlistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            artistButton.topAnchor.constraint(equalTo: topAnchor),
            artistButton.leadingAnchor.constraint(equalTo: playlistButton.trailingAnchor, constant: 36),
            
            albumButton.topAnchor.constraint(equalTo: topAnchor),
            albumButton.leadingAnchor.constraint(equalTo: artistButton.trailingAnchor, constant: 36)
        ])
    }
}

extension MenuBar {
    @objc func playlistButtonTapped() {
        menuBarDelegate?.didSelectItemAt(index: 0)
    }
    
    @objc func artistButtonTapped() {
        menuBarDelegate?.didSelectItemAt(index: 1)
    }
    
    @objc func albumButtonTapped() {
        menuBarDelegate?.didSelectItemAt(index: 2)
    }
}

extension MenuBar {
    func selectItem(at index: Int) {
        animateIndicator(to: index)
    }
    
    private func animateIndicator(to index: Int) {
        var button: UIButton
        switch index {
        case 0:
            button = playlistButton
        case 1:
            button = artistButton
        case 2:
            button = albumButton
        default:
            button = playlistButton
        }
        
        setAlpha(for: button)
        
        UIView.animate(withDuration: 0.3){
            self.layoutIfNeeded()
        }
    }
    
    private func setAlpha(for button: UIButton){
        playlistButton.alpha = 0.5
        artistButton.alpha = 0.5
        albumButton.alpha = 0.5
        
        button.alpha = 1
    }
}


func makeButton(withText text: String) -> UIButton {
    let btn = UIButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle(text, for:     .normal)
    btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    btn.titleLabel?.adjustsFontSizeToFitWidth = true
    
    return btn
}
