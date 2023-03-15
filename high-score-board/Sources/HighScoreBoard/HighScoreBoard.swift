func newScoreBoard() -> [String: Int] {
  // Even though I init scoreBoard as a Dictionary, the values inside of it can still change.
  // Adding let to it only says that I can change what the keys:values types will be in the future.
  let scoreBoard = Dictionary<String, Int>()
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
  // What I'm doing here is say that the rule should be that, if the name of the first pair is alphabetically before the second key, it should return true.
  // Sorted by basically takes a function that returns a bool and from that it decides if something goes before or after something.
  // I need to study the sorted syntax!
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
    return p1 > p2 // if the score of the first player is larger than the score of the second player, return true. therefore, when swift compares and try to sort, it'll put the ones that return true before.
  }

  let sortedPlayers = scores.sorted(by: sortByScore)
  return sortedPlayers
}
