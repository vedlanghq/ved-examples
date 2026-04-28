domain Deployment {
  state {
    configured: bool
    running: bool
  }

  goal Healthy {
    predicate configured == true && running == true
  }

  transition Configure {
    step {
      configured = true
    }
  }

  transition Start {
    step {
      running = true
    }
  }
}
