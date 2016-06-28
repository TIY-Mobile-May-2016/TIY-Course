//
//  Question.swift
//  QuestionAnswerApp
//
//  Created by Taylor Frost on 6/27/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import Foundation

class Question : NSObject {
    
    var questionString: String = ""
    var answerString: String = ""
    
    override init() {
        super.init()
        self.answerString = ""
        self.questionString = ""
    }
    
    init(questionString: String, answerString: String) {
        self.questionString = questionString
        self.answerString = answerString
    }
    
}
