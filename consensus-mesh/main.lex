domain NodeAlpha {
    scope { domain }
    capability { messaging, send_to:NodeBeta }

    state {
        actual: int
        in_flight: int
        target_val: int
    }

    goal Initialized {
        priority 255
        target target_val == 200000
        strategy { Initialize }
    }

    goal SyncCompleted {
        priority 100
        target actual + in_flight == target_val
        strategy { PushDebt }
    }

    transition Initialize {
        capability { messaging, send_to:NodeBeta }
        slice step {
            target_val = 200000
        }
    }

    transition PushDebt {
        capability { messaging, send_to:NodeBeta }
        slice step {
            in_flight = in_flight + 1000
            send("NodeBeta", "AbsorbDebt")
        }
    }

    transition ClearDebt {
        capability { messaging, send_to:NodeBeta }
        slice step {
            in_flight = in_flight - 1000
            actual = actual + 1000
        }
    }
}

domain NodeBeta {
    scope { domain }
    capability { messaging, send_to:NodeAlpha }

    state {
        actual: int
        in_flight: int
        target_val: int
    }

    goal Initialized {
        priority 255
        target target_val == 200000
        strategy { Initialize }
    }

    goal SyncCompleted {
        priority 100
        target actual + in_flight == target_val
        strategy { PushDebt }
    }

    transition Initialize {
        capability { messaging, send_to:NodeAlpha }
        slice step {
            target_val = 200000
        }
    }

    transition PushDebt {
        capability { messaging, send_to:NodeAlpha }
        slice step {
            in_flight = in_flight + 1000
            send("NodeAlpha", "ClearDebt")
        }
    }

    transition AbsorbDebt {
        capability { messaging, send_to:NodeAlpha }
        slice step {
            in_flight = in_flight - 1000
            actual = actual + 1000
        }
    }
}
