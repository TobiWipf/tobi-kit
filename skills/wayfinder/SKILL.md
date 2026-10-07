---
name: wayfinder
description: Find the route to a goal the user can name but does not know how to reach, across as many sessions as it takes. Charts what must be decided in a map at docs/plans/<topic>.md, resolves one piece per session, and hands a clear route to scope. Plans, never builds. User-invoked only, for /wayfinder, "I want to do X and do not know how", "help me figure out how to get there". For an approach the user already has, use `grill`.
disable-model-invocation: true
---

# Wayfinder

The user knows where they want to end up and not how to get there. Your job is to find the route, not to charge at the destination. The output is a map whose every piece is decided, handed to `scope`. Never code. The pull to start building is the sign the map is done.

Invoking this skill suspends Autonomy. The user makes every decision. The map is the only file you write.

Already have an approach to test? That is `grill`, not this. Say so and stop.

## The map

`docs/plans/<topic>.md`, committed per the repo's git workflow (`ship`).

```markdown
# <topic>

## Destination
<what done looks like, one or two lines>

## Decided
- <decision>. <the deciding reason>.

## Next pieces
- <a question you can state precisely now>. <what it depends on>.

## Not yet specified
- <something you can tell is coming but cannot phrase sharply yet>.

## Out of scope
- <what was ruled out>. <why>.
```

Each decision lives in Decided once. A piece is a question, never "build X". A piece that reads as a build step is mis-written, rewrite it as the decision it waits on.

**Piece or fog?** Can you state the question precisely now, even if you cannot answer it yet? Then it is a piece. Otherwise it stays in Not yet specified. Do not slice fog into pieces early. It is coarser than a piece and may become several pieces, or none, once the route reaches it.

Out of scope never comes back unless the user redraws the destination.

## Chart

The first session. Charting is the whole session's work.

1. Name the destination with the user. It fixes the scope every piece is measured against.
2. Survey breadth-first. Fan out across the whole space, not deep on one thread, and sort what you find into pieces, fog, and out of scope.
3. No fog at all, and the whole route fits one session? There is no map to keep. Say so, and hand to `grill` or `scope`.
4. Write the map, commit it, and stop.

## Work the map

`/wayfinder docs/plans/<topic>.md`. One piece per session.

1. Read the map. Never re-ask anything in Decided.
2. Take the piece the user names, or the first in Next pieces whose dependencies are decided.
3. Resolve it the cheapest way that settles it.
   - A fact. Look it up with `how`, `why`, or a subagent. Never ask the user for it.
   - A question talk cannot settle. The Prototype playbook, then ask again in one line.
   - A question talk can settle. Rounds in `grill`'s format, with a recommended answer each.
   - Blocked on hands-on work only the user can do (an account, access, a data export). Give them a checklist and stop.
4. Record it. One line in Decided. Turn any fog the answer made sharp into new pieces and remove it from Not yet specified. Move anything now beyond the destination to Out of scope. A decision that turns out wrong is changed in place with the reason, not designed around.
5. Commit the map and stop.

## Done

Next pieces and Not yet specified are both empty. The route is clear. Hand the map to `scope`, whose predicate and constraints the decisions fill. The map is deleted in the commit that ships the work it planned.

**Reply:** after charting, the destination and the first pieces. After a session, the decision made and what it unlocked.
