//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by Kobbie on 06/11/2022.
//

import UIKit

class FontInfoViewController: UIViewController
{
    var font: UIFont!
    var favorite: Bool = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv"
        + "WwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite
    }
    
    @IBAction func slideFontSize (slider: UISlider)
    {
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(sender: UISwitch)
    {
        let favoritesList = FavoritesList.sharedFavoritesList
        if sender.isOn
        {
            favoritesList.addFavorite(fontName: font.fontName)
        }
        else
        {
            favoritesList.removeFavorite(fontName: font.fontName)
        }
    }
}
