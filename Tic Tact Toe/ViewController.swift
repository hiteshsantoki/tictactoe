//
//  ViewController.swift
//  Tic Tact Toe
//
//  Created by Cronabit 1 on 16/10/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeplayer = 1
    var gamestate = [0 ,0, 0, 0, 0, 0, 0, 0, 0]

    let winningcombinations = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    var gameisactive = true
    
    @IBOutlet var label: UILabel!

    @IBAction func action(_ sender: AnyObject)
    {

        if (gamestate[sender.tag-1] == 0 && gameisactive == true)
        {
            gamestate[sender.tag-1] = activeplayer
            
            if (activeplayer == 1)
            {
                sender.setImage(UIImage(named :"Cross.png"), for: UIControlState())
                activeplayer = 2
            }
            else
            {
                sender.setImage(UIImage(named :"Nought.png"), for: UIControlState())
                activeplayer = 1
            }
        }
        for combination in winningcombinations
        {
            if gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]]
            {
                gameisactive = false;
            
                if gamestate[combination[0]] == 1
                {
                    label.text = "Cross Won"
                }
                else
                {
                    label.text = "nought Won"
                }
                playagainbutton.isHidden = false
                label.isHidden = false
            }
        }
        
        gameisactive = false
        
        for i in gamestate
        {
            if i == 0
            {
                gameisactive = true
                print(i)
                break
            }
        }
        if gameisactive == false
        {
            label.text = "Draw Game"
            label.isHidden = false
            playagainbutton.isHidden = false
        }
    }
    
    @IBOutlet var playagainbutton: UIButton!
    @IBAction func playagain(_ sender: Any)
    {
        gamestate = [0 ,0, 0, 0, 0, 0, 0, 0, 0]
        gameisactive = true
        activeplayer = 1
        
        playagainbutton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }

    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

