domain NamespaceTask {
  scope Namespace

  state {
    status: string
  }

  goal Completed {
    predicate status == "done"
  }

  transition Execute {
    step {
      emit RunScopedAction()
    }
  }
}
