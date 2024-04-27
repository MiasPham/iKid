//
//  DadJokeViewController.swift
//  iKid
//
//  Created by Mia Pham on 4/24/24.
//

import UIKit

class DadJokeViewController: UIViewController {

    var jokeView : DisplayJokeViewController!
    var questionView : DisplayJokeViewController!
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jokeView = instantiate(id: "display_joke")
        questionView = instantiate(id: "display_question")
        switchViewController(nil, to: questionView)
    }
    
    @IBAction func switchViews(_ sender: UIButton) {
        btn = sender
        UIView.animate(withDuration: 0.4, animations: { [self] in
            if self.questionView != nil &&
                self.questionView.view.superview != nil {
                UIView.transition(with: view, duration: 0.4, options: [
                    .curveEaseInOut, .transitionFlipFromRight
                ], animations: {
                    self.jokeView.view.frame = self.view.frame
                })
                self.jokeView.displayJoke(joke: "It got toad.")
                sender.setTitle("Back", for: .normal)
                switchViewController(questionView, to: jokeView)
            } else {
                UIView.transition(with: view, duration: 0.4, options: [
                    .curveEaseInOut, .transitionFlipFromLeft
                ], animations: {
                    self.questionView.view.frame = self.view.frame
                })
                sender.setTitle("Next", for: .normal)
                switchViewController(jokeView, to: questionView)
            }
        })
    }
    // {{## END switch-with-animation ##}}
    
    // {{## BEGIN switchViewController ##}}
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController) {
        // Remove the old....
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }

        // ... swap in the new
        self.addChild(to)
        self.view.insertSubview(to.view, at: 0)
        to.didMove(toParent: self)
    }
    // {{## END switchViewController ##}}
    
    // {{## BEGIN builders ##}}
    // This is a "helper method" to instantiate from a storyboard
    // and deal automatically with the downcasting
    func instantiate<T>(id: String) -> T! {
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.jokeView != nil &&
            self.jokeView.view.superview != nil {
            switchViewController(jokeView, to: questionView)
        }
        
        if (btn != nil) {
            btn.setTitle("Next", for: .normal)
        }
        
        questionView.displayJoke(joke: "What happened to the frog that parked illegally?")

    }

}
