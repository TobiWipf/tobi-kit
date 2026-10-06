# Prove It Works

Verify every task output by checking the real thing directly. Do not infer from proxies, self-reports, or "it compiles."

**Why:** Unverified work has unknown correctness. Indirect verification (file mtimes, output freshness, agent self-reports, cached screenshots) feels cheaper than direct observation. Acting on a wrong inference costs far more than checking the source. A writeup that sounds right reads as convincing whether or not it is true.

## How sure are you

Every claim sits somewhere on this ladder. Get it as far down as is cheap, and say where it stopped.

1. You said so. Worthless on its own.
2. You pointed at the line. A real `file:line`, or the library's own source.
3. You showed the bad case cannot happen. You walked the failure step by step and it does not reach.
4. You ran it. A script or test that calls the real code and fails loud if you are wrong.
5. You reproduced it in the running app, on the surface where the user meets it.

Step 4 is the bar for "works". A claim stuck at 3 or below is unproven. Say so out loud, never round up.

## The standard

- The real thing, not a proxy. Read the actual value, not a cached or derived one. The artifact, not a delegate's summary. Agents report what they intended, not always what happened.
- When a check passes too easily, suspect the observation before the system.
- A deterministic script beats a one-time eyeball. A reviewer can rerun it instead of trusting your word.
- Keep the evidence visible for the human. Commit it only when the trail has to be auditable later, like a big port or migration.

The `verify` skill is the procedure. `blast-radius` applies the ladder to the one fact a change is safe because of.
