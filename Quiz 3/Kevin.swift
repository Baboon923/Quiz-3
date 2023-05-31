import SwiftUI

struct Question {
    var text: String
    var answers: [String]
    var correctAnswer: Int
}

let questions = [
        Question(text: "What is the capital of France?", answers: ["London", "Paris", "Rome", "Berlin"], correctAnswer: 1),
        Question(text: "What is the largest planet in our solar system?", answers: ["Earth", "Mars", "Jupiter", "Saturn"], correctAnswer: 2),
        Question(text: "What is the symbol for potassium?", answers: ["Po", "K", "Pt", "Cu"], correctAnswer: 1),
        Question(text: "THINK FAST", answers: ["Wait wha-", "WTF", "Yes am speed", "YJ HELP MEEE"], correctAnswer: 2),
        Question(text: "Deal?", answers: ["Deal", "SEAL", "No", "Cupid anyone?"], correctAnswer: 1),
        Question(text: "FASTER", answers: ["FASTER", "FASTER", "FASTER", "FASTERER"], correctAnswer: 3),
        Question(text: "QUESTION NUMBER???", answers: ["7", "5", "9", "69420"], correctAnswer: 0),
        Question(text: "_____ SWIFT", answers: ["YJ", "YOU", "TAYLOR", "ACCELERATOR"], correctAnswer: 2),
        Question(text: "SHLOK IS COMING", answers: ["AAAAAAAA", "HIDE", "DIVE", "OH ####"], correctAnswer: 0)
]

struct ContentView: View {
    let timeLimitPerQuestion = 1 // in seconds
    
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var timeRemaining = 0
    @State private var timer: Timer?
    @State private var showTitleScreen = true
    @State private var selectedAnswers: [Int] = []
    
    var body: some View {
        Group {
            if showTitleScreen {
                VStack {
                    Text("Quiz App")
                        .font(.largeTitle)
                        .padding()
                    Button("Start Quiz") {
                        self.startQuiz()
                    }
                    .padding()
                }
            } else {
                VStack {
                    if currentQuestion < questions.count {
                        Text(questions[currentQuestion].text)
                            .font(.title)
                            .padding()
                        
                        ForEach(0..<questions[currentQuestion].answers.count) { index in
                            Button(action: {
                                self.submitAnswer(index)
                            }) {
                                Text(questions[currentQuestion].answers[index])
                                    .font(.headline)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .foregroundColor(.white)
                                    .foregroundColor(.white)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                        
                        Text("Time Remaining: \(timeRemaining)")
                            .font(.title)
                            .padding()
                            .onAppear(perform: {
                                self.startTimer()
                            })
                    } else {
                        QuizSummaryView(score: score, totalQuestions: questions.count, selectedAnswers: selectedAnswers)
                            .padding()
                        Button("Play Again") {
                            self.restartQuiz()
                            self.startQuiz() // Start the quiz again
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    func startTimer() {
        timeRemaining = timeLimitPerQuestion
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.submitAnswer(-1) // Time's up, submit a wrong answer for the unanswered questions
            }
        }
    }
    
    func submitAnswer(_ selectedAnswer: Int) {
        timer?.invalidate()
        
        if currentQuestion < questions.count {
            let question = questions[currentQuestion]
            if selectedAnswer == question.correctAnswer {
                score += 1
            }
            selectedAnswers.append(selectedAnswer)
            currentQuestion += 1
            if currentQuestion < questions.count {
                startTimer() // Start the timer for the next question
            }
        }
    }
    
    func startQuiz() {
        showTitleScreen = false
        startTimer()
    }
    
    func restartQuiz() {
        currentQuestion = 0
        score = 0
        selectedAnswers = []
        showTitleScreen = true
    }
}

struct QuizSummaryView: View {
    let score: Int
    let totalQuestions: Int
    let selectedAnswers: [Int]
    
    var body: some View {
        VStack {
            Text("Quiz Summary")
                .font(.largeTitle)
                .padding()
            Text("Score: \(score)/\(totalQuestions)")
                .font(.title)
                .padding()
            
            ForEach(0..<totalQuestions) { index in
                HStack {
                    Text("Question \(index+1):")
                        .font(.headline)
                        .padding()
                    Spacer()
                    if selectedAnswers[index] == -1 {
                        Text("Not answered")
                            .foregroundColor(.red)
                            .padding()
                    } else if selectedAnswers[index] == questions[index].correctAnswer {
                        Text("Correct")
                            .foregroundColor(.green)
                            .padding()
                    } else {
                        Text("Wrong")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
