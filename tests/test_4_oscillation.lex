domain TestNode {
    scope { domain }
    capability { messaging, send_to:TestNode }

    state {
        flag: int
    }

    goal Stable {
        priority 100
        target flag == 2
        strategy { Flip }
    }

    transition Boot {
        capability { messaging, send_to:TestNode }
        slice step {
            flag = 0
        }
    }

    transition Flip {
        capability { messaging, send_to:TestNode }
        slice step {
            flag = flag + 1
        }
    }
}
