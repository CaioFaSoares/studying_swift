func newScoreBoard() -> [String: Int] {
  var scoreBoard = Dictionary<String, Int>()
  return scoreBoard
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
  scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
  scores[name] = nil
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
  scores[name] = 0
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
  scores[name]? += delta
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
  let sortedPlayers = scores.sorted(by:{ $0.0 < $1.0 })
  return sortedPlayers
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
  func sortByScore(
    _ player1: (String, Int),
    _ player2: (String, Int)
  ) -> Bool {
    let p1 = player1.1
    let p2 = player2.1
    return p1 > p2
  }

  let sortedPlayers = scores.sorted(by: sortByScore)
  return sortedPlayers
}
