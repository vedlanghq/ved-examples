domain Counter {
  state {
    value: int
  }

  goal Stable {
    predicate value == 3
  }

  transition Increment {
    step {
      value = value + 1
    }
  }
}
