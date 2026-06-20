# Context & Sessions

This category is how memory actually works in practice, and it is the single biggest source of confusion for new AI-native founders. The model itself remembers nothing; everything it "knows" in a conversation is text someone re-sent it a moment ago. Get this layer right and your product feels like it has a mind. Get it wrong and it feels like a goldfish.

### Context window

The maximum amount of text, measured in tokens, that a model can read at once when generating its next response.

Think of it as the model's desk, not its memory. Everything it can "see" right now, your system prompt, the conversation so far, files you pasted, tool results, has to fit on that desk simultaneously. When the desk fills up, something has to come off it. The window is a hard ceiling, not a soft preference.

The surprising part: a bigger window is not strictly better. Performance degrades as you cram a window full, and you pay for every token on the desk on every single turn. A 200K window stuffed to 190K is slow, expensive, and often less accurate than the same task run lean. Founders who treat the window as free storage build products that get dumber and pricier as conversations grow.

_Avoid:_ confusing the context window with the model's training knowledge. The window is short-term working memory for this request; training knowledge is baked in and fixed at the [knowledge cutoff](01-the-model.md#knowledge-cutoff).

_Usage:_
> "We're blowing the context window by turn ten: every message re-sends the whole PDF. We need to summarise it once and drop the raw text."

Related: [token](01-the-model.md#token), [attention-budget](#attention-budget), [compaction](#compaction), [stateless](#stateless)

### Session

A single continuous conversation between a user and the model, from the first message to the last, sharing one accumulating context.

A session is the unit your users experience as "the chat." It has a beginning, it grows turn by turn, and it ends, either when the user walks away or when you deliberately reset it. Inside one session, the model appears to remember what was said earlier, because the full history is re-sent each turn. Across sessions, by default, it remembers nothing.

For a founder, the session is the boundary you design around. Long sessions feel coherent but get expensive and eventually rot. Short sessions stay sharp but lose continuity. Most of your "memory architecture" work is really session-boundary work: deciding when a new session starts, what carries over, and what gets thrown away.

_Avoid:_ assuming sessions persist on their own. Unless you store and re-inject history yourself, closing the tab ends the session and erases everything. Persistence is a feature you build, not a default you get.

_Usage:_
> "Each support ticket is its own session. Don't bleed context from the last customer into this one."

Related: [turn](#turn), [stateless](#stateless), [memory-system](#memory-system), [clearing](#clearing)

### Turn

One round of the conversation: a user (or tool) input, plus the model's single response to it.

Turns are the heartbeat of a session. Each turn, the harness assembles the full context, system prompt, every prior turn, any new tool results, sends it to the model, and gets one reply back. Then it waits for the next input and does the whole thing again. The model does not "continue thinking" between turns; it starts cold each time and reconstructs its understanding from the text it's handed.

This matters because cost and latency scale with how much you send per turn, and you send everything every turn. A conversation that's cheap at turn two can be painful at turn fifty, even if each new message is short, because the model is re-reading the entire history each time. Turns are where your token bill quietly compounds.

_Avoid:_ picturing a turn as the model "remembering" the last turn. It re-reads the last turn from the transcript you resend. Nothing carries over inside the model itself.

_Usage:_
> "The agent took six turns to book the flight. Three of those were just re-reading tool output we should've trimmed."

Related: [session](#session), [stateless](#stateless), [inference](01-the-model.md#inference), [context-window](#context-window)

### Stateless

The property that the model holds no memory between calls: every request is processed from scratch, with no knowledge of any previous request.

This is the foundational fact of the whole category, and the one founders trip over hardest. The model is a function: text in, text out. It does not "wake up" still knowing your last conversation. The only reason a chat feels continuous is that the harness, your application code or the API client, re-sends the entire history with every call. Take that history away and the model is a blank slate, every time.

Internalise this and a lot stops being mysterious. "Why did it forget what I told it?" Because you didn't send it back. "Why is turn fifty so slow?" Because you're re-sending fifty turns. "How do I give it long-term memory?" You can't make the model remember; you build a [memory system](#memory-system) that decides what to put back on the desk. The intelligence is stateless; the statefulness is yours to engineer.

_Avoid:_ the word "remembers." The model never remembers. The harness re-supplies. Say "we re-send" instead of "it recalls" and your team's mental model snaps into place.

_Usage:_
> "It's stateless: if the user's name needs to survive across sessions, we store it and inject it into the system prompt ourselves."

Related: [session](#session), [turn](#turn), [memory-system](#memory-system), [harness](03-tools-and-environment.md#harness)

### System prompt

The standing set of instructions placed at the very top of the context, ahead of the conversation, that defines who the model is and how it should behave.

If the conversation is what the model is doing, the system prompt is the job description it never gets to put down. It sets role, tone, rules, output format, and guardrails, and because it sits at the top of the context and is re-sent every turn, it shapes every single response. It's the most leveraged text in your whole product: a good system prompt is the difference between a generic chatbot and something that sounds like your company.

The tension: every word you spend on instructions is a word off the desk and a token on the bill, forever, every turn. Vague, bloated system prompts ("be helpful, be accurate, be kind") waste budget and dilute the rules that matter. Tight, specific ones earn their place. Treat the system prompt like product copy you ship a million times a day, because you do.

_Avoid:_ dumping reference data into the system prompt because it "needs to always be there." Static rules belong here; lookup-able facts belong in [RAG](#rag-retrieval-augmented-generation). Cramming a knowledge base into the system prompt is expensive and crowds out your actual instructions.

_Usage:_
> "Stop adding edge-case rules to the system prompt. It's 3,000 tokens of 'don't do this' and the model's losing the thread."

Related: [context-window](#context-window), [attention-budget](#attention-budget), [prompt-injection](05-failure-modes.md#prompt-injection), [agent](03-tools-and-environment.md#agent)

### Attention budget

The finite capacity of the model to actually use what's in its context, distinct from, and smaller than, the raw size of the window.

Just because text fits on the desk doesn't mean the model is reading it carefully. Attention is a budget the model spends across everything in the window, and it spends unevenly: things at the start and end tend to get more of it, things buried in the middle get less. Fill the window with low-value text and you don't just pay tokens, you starve the high-value text of attention. This is why a lean 20K-token context often beats a sloppy 150K-token one.

For a founder, this reframes context engineering as a budgeting problem, not a storage problem. The question is never "will it fit?" It's "is every token in here earning its attention?" Every irrelevant tool result, every stale message, every redundant instruction is a tax on the things you actually want the model to focus on. Curate ruthlessly.

_Avoid:_ treating the context window as the real limit. The window is the desk size; the attention budget is how much the model can hold in its head at once. The second runs out first.

_Usage:_
> "We're nowhere near the window limit, but accuracy's dropping. We're spending the attention budget on chat history nobody needs."

Related: [context-window](#context-window), [context-rot](05-failure-modes.md#context-rot), [compaction](#compaction), [system-prompt](#system-prompt)

### Compaction

The practice of replacing a long stretch of context with a shorter summary that preserves the essential information.

When a session gets long, you don't have to choose between keeping everything (expensive, rotting) and keeping nothing (amnesia). Compaction is the middle path: take twenty turns of back-and-forth and condense them into a tight paragraph of "here's what we established," then continue from there. The model keeps the gist and drops the transcript. It's the difference between handing someone the full meeting recording versus the minutes.

This is one of the most useful moves in your toolkit, and increasingly the harness does it for you automatically as a window fills. But automatic compaction is lossy and dumb: it can summarise away the one detail that mattered. For anything important, decide deliberately what survives the squeeze: the decisions, the constraints, the user's goal. Compaction done well is the main reason a long-running agent stays coherent instead of collapsing.

_Avoid:_ confusing compaction with [clearing](#clearing). Compaction keeps a distilled version of the past; clearing throws the past away entirely. Reaching for "clear" when you meant "compact" loses information you needed.

_Usage:_
> "Before the agent hits the window, compact the research phase into a findings summary. We don't need the raw search results anymore."

Related: [clearing](#clearing), [context-window](#context-window), [attention-budget](#attention-budget), [context-rot](05-failure-modes.md#context-rot)

### Clearing

Deliberately wiping the conversation context to start fresh, keeping only what you choose to carry forward.

Clearing is the reset button. Where compaction distils the past, clearing discards it: you decide the slate is best wiped clean and begin again, often re-seeding just the system prompt and a sentence of essential state. It's the right move when the old context is no longer relevant, when it's accumulated junk and contradictions, or when the model has talked itself into a corner and you want it to stop defending its earlier mistakes.

Founders underuse this. There's a pull toward continuity, "but it'll forget!", that keeps sessions running long past their useful life, dragging stale context and degraded attention into every new request. Often the cleanest fix to a model that's gone off the rails isn't a cleverer prompt; it's a clearing. A fresh, focused context beats a long, polluted one almost every time.

_Avoid:_ thinking clearing means losing everything permanently. You clear the working context, not your stored data. What needs to persist lives in your [memory system](#memory-system) and gets re-injected; what was just noise stays gone.

_Usage:_
> "It keeps apologising and re-making the same wrong assumption. Clear the context and restate the task clean."

Related: [compaction](#compaction), [session](#session), [stateless](#stateless), [context-rot](05-failure-modes.md#context-rot)

### RAG (retrieval-augmented generation)

A pattern where you fetch relevant information from an external store at query time and place it into the context, so the model answers from data it was never trained on.

The model's training knowledge is frozen at its cutoff and knows nothing about your private docs, your customers, or yesterday. RAG fixes both gaps without retraining anything. When a question comes in, you search a knowledge base for the few passages that matter, paste them into the context, and ask the model to answer using them. It's an open-book exam: the model is smart, and you hand it exactly the right page right before it answers.

For founders this is the workhorse pattern for any product that needs to reason over proprietary or fresh information: support bots, internal search, document Q&A. The whole game is retrieval quality. Fetch the wrong passages and the model confidently answers from garbage; fetch the right ones and it looks like an expert. RAG doesn't make the model smarter, it makes it informed about your world.

_Avoid:_ thinking RAG "teaches" the model your data. Nothing is learned or stored in the model. You're temporarily putting documents on the desk for one answer, then taking them away. It's retrieval, not training.

_Usage:_
> "The bot's hallucinating policy details. Wire up RAG against the actual handbook so it quotes real text instead of guessing."

Related: [embedding](#embedding), [vector-search](#vector-search), [hallucination](05-failure-modes.md#hallucination), [knowledge-cutoff](01-the-model.md#knowledge-cutoff)

### Embedding

A list of numbers that represents the meaning of a piece of text, positioned so that similar meanings sit close together in mathematical space.

An embedding turns "what does this mean?" into "where does this point?" Each chunk of text becomes a coordinate, and the trick is that texts about similar things land near each other: "cancel my subscription" and "how do I end my plan" end up as near neighbors even though they share no words. This is how machines compare meaning instead of just matching characters. Keyword search finds the word "refund"; embeddings find the customer who wrote "I want my money back."

For a founder, embeddings are the quiet engine under RAG, semantic search, recommendations, and deduplication. You embed your documents once and store the coordinates. Then any incoming question gets embedded too, and you find the documents whose coordinates sit closest. The quality of that "closeness," which embedding model you use, quietly determines how good your whole retrieval layer feels.

_Avoid:_ treating an embedding as a summary or a compressed copy you can read back. It's a coordinate, not text. You can measure distance between embeddings, but you can't decode one back into the original sentence.

_Usage:_
> "Embed every support article on ingest, then a new ticket just finds its three nearest neighbors automatically."

Related: [vector-search](#vector-search), [rag-retrieval-augmented-generation](#rag-retrieval-augmented-generation), [token](01-the-model.md#token), [memory-system](#memory-system)

### Vector search

Finding the stored items whose embeddings sit closest to a query's embedding: retrieval by meaning instead of by keyword.

If embeddings turn text into coordinates, vector search is the act of asking "what's nearest to this point?" You embed the incoming query, then sweep your store for the handful of vectors closest to it, and return those items. It's the matching half of the retrieval system: embeddings give things a location, vector search finds the neighbors. This is what lets a user ask in their own words and get back the right document even when none of their words appear in it.

Founders should know this is rarely a from-scratch build: vector databases handle the indexing and fast nearest-neighbor lookup at scale. Your job is the design around it: how you chunk documents before embedding, how many neighbors you pull back, and whether you blend it with old-fashioned keyword search for the cases where exact terms matter. Pure vector search is great at meaning and bad at precise identifiers; the strongest systems use both.

_Avoid:_ assuming vector search returns "the correct answer." It returns the nearest neighbors by meaning, which is only as good as your embeddings and chunking. Near is not the same as right.

_Usage:_
> "Vector search keeps pulling vaguely related docs instead of the exact one. Let's add a keyword filter on the product code."

Related: [embedding](#embedding), [rag-retrieval-augmented-generation](#rag-retrieval-augmented-generation), [memory-system](#memory-system), [attention-budget](#attention-budget)

### Memory system

The architecture you build around a stateless model to decide what information persists across turns and sessions, and to put the right pieces back into context when needed.

Because the model itself remembers nothing, "memory" in an AI-native product is entirely your invention. A memory system is the layer that watches a conversation, decides what's worth keeping ("user prefers metric units," "the project deadline is March"), stores it somewhere durable, and re-injects the relevant bits into context on future requests. The model supplies the intelligence; the memory system supplies the continuity. Together they feel like a thing that knows you.

This is where a lot of product magic and product disappointment lives. A good memory system makes your assistant feel like it grew up with the user. A bad one either forgets the obvious or, worse, drags every old detail into every new context until attention rots. The hard questions are all editorial: what to remember, what to forget, when to surface it. Don't store everything, store what changes the next answer.

_Avoid:_ thinking a longer context window removes the need for a memory system. The window is per-session and finite; a memory system is what lets information survive across sessions and stay selective. Bigger windows don't make memory free.

_Usage:_
> "Our memory system should remember the user's tone preference forever, but it shouldn't be re-loading their entire chat history into every new session."

Related: [stateless](#stateless), [session](#session), [embedding](#embedding), [data-flywheel](07-ai-native-business.md#data-flywheel)

### Prompt caching

A mechanism that stores the processed form of a repeated chunk of context, like your system prompt, so the model doesn't have to re-read it from scratch on every request.

Remember that the model re-processes the entire context every turn, and that the system prompt and other boilerplate sit at the top, unchanged, request after request. Prompt caching notices this waste. The first time the model processes that stable prefix, the result is saved; on later requests with the same prefix, the model reuses the saved work instead of redoing it. Same desk, but it doesn't re-read the first ten pages every time.

For a founder this is straightforwardly money and speed. A long system prompt or a big reference document that appears on every call is exactly what caching is for: it can cut latency and cost on those tokens substantially. The catch is that caching only helps the stable prefix: anything before your first change has to be identical across requests. Structure your context so the unchanging parts come first and the volatile parts come last, and you get the discount; shuffle them and you don't.

_Avoid:_ expecting caching to discount the whole conversation. It only covers the unchanged prefix up to the first difference. Put a timestamp at the top of your prompt and you've broken the cache for everything below it.

_Usage:_
> "Move the user's message to the end and keep the system prompt byte-identical, then prompt caching kicks in and our per-call cost drops."

Related: [system-prompt](#system-prompt), [token](01-the-model.md#token), [inference](01-the-model.md#inference), [context-window](#context-window)

*Part of [The Dictionary of AI-Native](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
