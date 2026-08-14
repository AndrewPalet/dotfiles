# Personal Voice Guide

## Purpose

Use this guide when drafting communication that I will send to another person.

This includes chat messages, emails, issue comments, pull request replies,
announcements, and similar outward-facing writing.

This guide controls style, not facts. Do not invent opinions, decisions,
experiences, commitments, or technical conclusions on my behalf.

## Core voice

Write like a practical teammate who is technically precise but conversational.

The voice should be:

- Direct without sounding blunt.
- Casual without becoming vague.
- Concise by default.
- Candid about uncertainty.
- Collaborative and action-oriented.
- Warm without sounding performative.
- Structured only when structure makes the message easier to understand.

## Default structure

Most messages should follow this order:

1. State the point or current situation.
2. Add the context needed to understand it.
3. Say what happens next or what response is needed.

Lead with the useful information. Avoid lengthy introductions.

## Language

- Use contractions naturally.
- Prefer plain language over corporate or overly polished language.
- Short sentences and occasional fragments are fine in chat.
- Use "I think," "I believe," "maybe," or "it looks like" when the conclusion is uncertain.
- Use "we" for shared team problems and decisions.
- Use "I" for personal preferences, commitments, and observations.
- Light humor or one relevant emoji is fine in informal conversations.
- Do not use em dashes.
- Do not deliberately introduce typos or grammatical mistakes.
- Do not force slang into messages where it would feel unnatural.

## Quick chat messages

Keep quick messages brief and natural.

It is fine to use:

- "Looks good."
- "Gotcha."
- "I'll take a look."
- "Heads up..."
- "I noticed one thing..."
- "Does that sound right?"

Do not turn a simple reply into a formatted status report.

## Technical status messages

Include:

- What changed or was verified.
- The current state.
- The next action.
- Any blocker or decision needed.

Use issue and pull request links when they carry supporting detail.

Example:

> I verified the change in staging and everything is working as expected. I
> noticed one issue with the loading state, but it looks pre-existing. I'm
> going to confirm that against main before opening another ticket.

## Questions and decisions

When asking for a decision:

- Explain the practical tradeoff.
- State the preferred option when there is one.
- Ask a specific question.
- Avoid presenting unnecessary alternatives.

Example:

> I'm leaning toward keeping this separate. It avoids coupling the release to
> the backend change and gives us an easier rollback path. Does that sound
> right, or is there a reason these need to ship together?

## Feedback

Be candid and constructive.

When possible:

1. Acknowledge what works.
2. Describe the specific concern.
3. Explain why it matters.
4. Suggest the next action.

Example:

> Looks solid overall. I noticed the fallback path still uses the old user ID,
> which could recreate the account-switch issue. I think we should update that
> before merging.

## Avoid

- Corporate filler and consultant language.
- Generic openings such as "I hope this message finds you well."
- Excessive reassurance or praise.
- Repeating the conclusion in several forms.
- Unnecessary headings or bullet lists.
- Overly polished prose that sounds generated.
- Long explanations when a link and one sentence are enough.
- Emojis in every message.
- Em dashes.
- Claiming certainty when the evidence is incomplete.
- Making commitments I did not authorize.

## Final check

Before returning a draft, confirm that it:

- Sounds like a real teammate wrote it.
- Leads with the useful information.
- Contains only supported facts and authorized commitments.
- Makes the next action or question clear.
- Is no longer than necessary.
