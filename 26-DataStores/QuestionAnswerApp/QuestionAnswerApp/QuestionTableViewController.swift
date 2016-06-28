//
//  QuestionTableViewController.swift
//  QuestionAnswerApp
//
//  Created by Taylor Frost on 6/27/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    // Array of questions
    var questionsArray = [Question]()
    
    var currentQuestion: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionData()
        
    }
    
    func questionData() {
        
        let movie = Question()
        movie.questionString = "What is the population of France"
        movie.answerString = "The answer is Paris"
        
        self.questionsArray.append(movie)
        
        let sport = Question(questionString: "What popular sport in the United States generates most money per year?", answerString: "The NFL at an average of 13 billion per year")
        self.questionsArray.append(sport)
        
        let app = Question(questionString: "What app is worth the most?", answerString: "Uber at 51 Billion")
        self.questionsArray.append(app)
   
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsArray.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! QuestionTableViewCell
        
        let q = self.questionsArray[indexPath.row]
        cell.questionLabel?.text = q.questionString
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentQuestion = self.questionsArray[indexPath.row]
        
        self.performSegueWithIdentifier("AnswerSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("prepareForSegue!")
      
        if let x = segue.destinationViewController as? AnswerViewController {
            x.passedQuestion = self.currentQuestion
        }
        
        
        
        
        
        
    }

}
