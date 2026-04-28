domain ExternalTask {
  state {
    completed: bool
    retries: int
  }

  goal Finished {
    predicate completed == true
  }

  transition Attempt {
    step {
      emit PerformTask()
    }
  }

  transition FailureObserved {
    step {
      retries = retries + 1
    }
  }

  transition SuccessObserved {
    step {
      completed = true
    }
  }
}
