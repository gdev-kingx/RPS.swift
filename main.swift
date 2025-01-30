import Foundation

// Enum to represent the choices in the game
enum RPSChoice: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"

    static func randomChoice() -> RPSChoice {
        let choices: [RPSChoice] = [.rock, .paper, .scissors]
        return choices.randomElement()!
    }

    func beats(_ other: RPSChoice) -> Bool {
        switch (self, other) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
}

// Function to play a round of Rock, Paper, Scissors
func playRound(playerChoice: RPSChoice) -> String {
    let computerChoice = RPSChoice.randomChoice()
    print("Computer chose: \(computerChoice.rawValue)")

    if playerChoice == computerChoice {
        return "It's a tie!"
    } else if playerChoice.beats(computerChoice) {
        return "You win!"
    } else {
        return "You lose!"
    }
}

// Function to start the game and loop until the user decides to stop
func startGame() {
    var playerScore = 0
    var computerScore = 0
    var roundsPlayed = 0
    var playAgain = true

    while playAgain {
        roundsPlayed += 1
        print("\nRound \(roundsPlayed)")

        print("Enter your choice (rock, paper, or scissors): ", terminator: "")
        if let input = readLine()?.lowercased() {
            guard let playerChoice = RPSChoice(rawValue: input.capitalized) else {
                print("Invalid choice. Please enter rock, paper, or scissors.")
                continue
            }

            let result = playRound(playerChoice: playerChoice)
            print(result)

            // Update scores
            if result == "You win!" {
                playerScore += 1
            } else if result == "You lose!" {
                computerScore += 1
            }

            // Display current scores
            print("Current Score - You: \(playerScore), Computer: \(computerScore)")

            // Ask if the user wants to play again
            print("\nDo you want to play again? (y/n): ", terminator: "")
            if let playInput = readLine()?.lowercased() {
                playAgain = (playInput == "y")
            } else {
                playAgain = false
            }
        }
    }
    // Final score when the game ends
    print("\nGame Over!")
    print("Final Score - You: \(playerScore), Computer: \(computerScore)")
}

// Start the game
startGame()
