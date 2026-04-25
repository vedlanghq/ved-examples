domain Accounts {
    scope { domain }
    capability { messaging, send_to:Accounts }

    state {
        balance_a: int
        balance_b: int
        processed: int
    }

    goal TargetTransfers {
        priority 100
        target processed == 4
        strategy { SendTx }
    }

    invariant TotalBalance {
        balance_a + balance_b == 0
    }

    transition Boot {
        capability { messaging, send_to:Accounts }
        slice step {
            balance_a = 0
            balance_b = 0
        }
    }

    transition SendTx {
        capability { messaging, send_to:Accounts }
        slice step {
            balance_a = balance_a - 100
            balance_b = balance_b + 100
            processed = processed + 1
        }
    }
}
