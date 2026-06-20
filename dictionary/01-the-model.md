# The Model

This category covers what the model under the hood actually is: the raw engine your AI-native product is built on. Before you reason about context, tools, agents, or business strategy, you need a clear picture of the thing doing the predicting: what it's made of, how it runs, and where its hard edges are. Read this first so the rest of the dictionary makes sense.

### Foundation model

A large neural network trained on a broad sweep of text (and often images, audio, and code) to predict the next token, general enough to be pointed at many tasks without retraining.

Think of it as a graduate hire who has read most of the public internet but knows nothing specific about your company. The "foundation" part is the point: one model becomes the substrate for chat, summarisation, classification, coding, and a hundred things its makers never planned. You don't build a foundation model: training one costs tens of millions of dollars and a cluster of GPUs. You rent one through an API and shape its behaviour with prompts, context, and tools.

For a founder, this is the great leveller. The same Claude, GPT, or Gemini that powers a billion-dollar incumbent is one API key away from you. Your moat is never the base model, everyone has it. Your moat is what you wrap around it: your data, your workflow, your distribution.

_Avoid:_ calling every AI feature a "foundation model." A foundation model is the base engine. Your fine-tuned variant, your prompt, your agent: those are products built on top of it.

_Usage:_
> "We're not training a foundation model. We're picking the best one and winning on the data we feed it."

Related: [parameters-weights](#parameters-weights), [training](#training), [model-provider](#model-provider), [ai-native-vs-wrapper](07-ai-native-business.md#ai-native-vs-wrapper)

### Parameters (weights)

The numbers learned during training, billions of them, that encode everything the model "knows," adjusted slightly with every example until the network predicts well.

Picture millions of tiny dials. Training is the process of nudging each dial until the whole machine produces sensible next tokens. Once frozen, those dial settings are the model. A "70B model" has 70 billion of these dials; a frontier model has far more. More parameters generally means more capability and more cost to run: bigger is smarter but slower and pricier, which is exactly the trade-off you'll feel in your bill.

What matters for you: parameter count is a rough proxy for capability, not a guarantee. A smaller, better-trained model often beats a bloated one. Treat "number of parameters" the way you'd treat "number of employees": bigger can mean more capable or just more expensive.

_Avoid:_ confusing parameters with the model's memory of your conversation. Weights are fixed at training time; they don't update as you chat. What you said five minutes ago lives in the context window, not the weights.

_Usage:_
> "The small model has a tenth of the parameters but handles our classification task fine. No reason to pay for the big one."

Related: [foundation-model](#foundation-model), [training](#training), [fine-tuning](#fine-tuning), [context-window](02-context-and-sessions.md#context-window)

### Token

The unit a model actually reads and writes: a chunk of text, usually part of a word, that the model treats as a single atom.

Models don't see letters or words; they see tokens. As a rule of thumb, one token is about 0.75 of an English word, or roughly four characters, so "tokenisation" might split into "token" + "isation." Common words are often one token; rare words, code, and other languages fragment into many. Everything is priced and limited in tokens: your input costs tokens, the model's output costs tokens, and the context window is measured in tokens.

This is the currency of your AI business. Your gross margin is a function of tokens in and tokens out. A bloated system prompt you send on every request is a tax you pay forever. Founders who win on cost are often just the ones who counted their tokens early.

_Avoid:_ estimating cost or context limits in words or characters. Always convert to tokens, and remember that non-English text, JSON, and code are far more token-hungry than plain English prose.

_Usage:_
> "Our prompt ballooned to 4,000 tokens per call. At our volume that's the whole margin. We need to trim it."

Related: [tokenizer](#tokenizer), [inference](#inference), [context-window](02-context-and-sessions.md#context-window), [prompt-caching](02-context-and-sessions.md#prompt-caching)

### Tokenizer

The component that chops raw text into tokens before the model sees it, and stitches tokens back into text on the way out.

Each model family ships its own tokenizer with its own vocabulary, learned to represent common patterns efficiently. This is why the same sentence can cost a different number of tokens on different providers, and why token counts you measured for one model don't transfer to another. The tokenizer also explains some classic model failures: ask a model to count the letters in "strawberry" and it may stumble, because it never saw individual letters. It saw a handful of tokens.

For your work, the tokenizer is mostly invisible until it bites. Use the provider's official token counter rather than guessing, especially when you're packing a context window to its limit or pricing a high-volume feature.

_Avoid:_ assuming tokenisation is the same across providers, or that one word equals one token. Neither holds, and silently assuming so is how you blow a context limit in production.

_Usage:_
> "Run it through the tokenizer before we ship. I want the real token count, not a word estimate."

Related: [token](#token), [foundation-model](#foundation-model), [context-window](02-context-and-sessions.md#context-window)

### Inference

The act of running a trained model to get an answer: feeding in tokens and generating new ones, one at a time.

Training builds the model; inference is using it. Every time your product calls the API, you're paying for inference: the GPU work of pushing your tokens through those billions of frozen weights to predict what comes next. Crucially, the model generates output one token at a time, each new token conditioned on everything before it, which is why long answers take longer and why output tokens often cost more than input tokens.

This is your variable cost and the line item that scales with usage. A feature that's cheap at 100 users can be ruinous at 100,000 if each interaction triggers heavy inference. Designing for fewer, smaller, cached calls is not a micro-optimisation: it's the difference between a healthy unit economics and a furnace burning cash.

_Avoid:_ conflating inference with training. Training happens once, at enormous cost, by the provider. Inference happens on every single request, at your expense.

_Usage:_
> "Each report fires twelve inference calls. We can collapse that to three and the page still feels instant."

Related: [training](#training), [token](#token), [latency-and-throughput](#latency-and-throughput), [prompt-caching](02-context-and-sessions.md#prompt-caching)

### Training

The expensive, one-time process of feeding a model enormous amounts of data and adjusting its weights until it reliably predicts the next token.

This is where a foundation model is born. Over weeks or months on a giant GPU cluster, the model sees trillions of tokens and slowly tunes its billions of parameters. The result is frozen and shipped. There's usually a second phase, fine-tuning and reinforcement from human feedback, that turns a raw next-token predictor into something helpful and safe to talk to. Together they cost a fortune and require data and infrastructure only a handful of labs possess.

The takeaway for founders is liberating: you almost never train. The base model's knowledge is fixed at training time, which is why it knows nothing about your business or anything after its knowledge cutoff. You add freshness and specificity through context and retrieval, not by retraining.

_Avoid:_ saying you'll "train the model on our data" when you mean you'll put your data in the prompt or retrieve it at query time. Real training rewrites weights; that's rarely what you want or can afford.

_Usage:_
> "We're not training anything. We feed the model our docs at query time and it answers from those."

Related: [foundation-model](#foundation-model), [parameters-weights](#parameters-weights), [fine-tuning](#fine-tuning), [knowledge-cutoff](#knowledge-cutoff), [rag](02-context-and-sessions.md#rag-retrieval-augmented-generation)

### Fine-tuning

Taking an already-trained model and nudging its weights with a smaller, focused dataset so it gets better at a narrow task, tone, or format.

If training is the four-year degree, fine-tuning is the two-week onboarding for a specific job. You start from a capable base model and show it a few hundred or few thousand examples of exactly the behaviour you want: your house style, a strict output schema, a domain's quirks. It's vastly cheaper than training from scratch, but it still produces a new set of weights you have to host, version, and maintain.

Here's the founder's discipline: fine-tuning is rarely your first move. Most problems that look like "the model needs to learn our stuff" are solved faster and cheaper with a better prompt or by retrieving the right context at query time. Reach for fine-tuning when you need consistent format or tone at scale, or to make a small cheap model punch above its weight, not as a substitute for giving the model the facts it needs.

_Avoid:_ fine-tuning to teach the model new facts. It's good at learning behaviour and style, unreliable at memorising knowledge. For facts, use retrieval.

_Usage:_
> "Prompting got us 90% there. We'll fine-tune only to lock the JSON format so it never breaks."

Related: [training](#training), [parameters-weights](#parameters-weights), [rag](02-context-and-sessions.md#rag-retrieval-augmented-generation), [eval](06-evaluation-and-safety.md#eval)

### Knowledge cutoff

The date after which the model has seen no training data: its knowledge of the world simply stops there.

Because the weights are frozen at training time, the model is a snapshot of the internet up to a certain month. Ask about an event, a library version, or a price that landed after the cutoff and the model has no idea, though it may confidently improvise an answer rather than admit the gap. The cutoff is usually several months to a year behind today's date, since training and safety testing take time.

For anything where freshness matters, news, current prices, your latest docs, recent API changes, you cannot rely on the model's memory. You feed it the current information at query time through retrieval or tools. Treat the cutoff as a hard wall: the model knows the past it was trained on and nothing newer unless you hand it over.

_Avoid:_ assuming a recent-feeling answer is current. The model can sound up to date while being a year stale, and it won't warn you.

_Usage:_
> "That framework shipped after the model's cutoff, so it's guessing. Pipe in the real docs before it answers."

Related: [training](#training), [model-provider](#model-provider), [rag](02-context-and-sessions.md#rag-retrieval-augmented-generation), [hallucination](05-failure-modes.md#hallucination)

### Temperature

A dial from roughly 0 to 1 (sometimes higher) that controls how much randomness the model uses when choosing each next token.

At low temperature, the model almost always picks its single most likely next token: answers come out focused, deterministic, and repeatable. Crank it up and the model samples more freely from less likely options, producing more varied, creative, sometimes surprising output. It's the difference between a careful accountant and a brainstorming partner who'll throw out wild ideas.

Match the dial to the job. For extraction, classification, code, or anything where you want the same input to give the same output, run cold, near 0. For naming, copywriting, or ideation where sameness is boring, warm it up. A common production mistake is leaving a default mid-range temperature on a task that demanded precision, then blaming the model for being flaky.

_Avoid:_ thinking low temperature makes the model "more accurate" or stops it from making things up. It makes output more deterministic, not more truthful: a hallucination at temperature 0 is just a consistent hallucination.

_Usage:_
> "The data extractor was returning different fields each run. We'd left temperature at default. Dropped it to 0 and it's stable."

Related: [inference](#inference), [token](#token), [hallucination](05-failure-modes.md#hallucination)

### Model provider

The company that trains, hosts, and serves a foundation model through an API: Anthropic (Claude), OpenAI (GPT), Google (Gemini), and others.

You don't run frontier models yourself; you call a provider's endpoint, send tokens, and pay per token. The provider handles the GPUs, the scaling, the safety guardrails, and the steady stream of model upgrades. Each offers a lineup, small and cheap up to large and capable, plus its own pricing, rate limits, context sizes, and quirks. They are genuinely interchangeable for many tasks and stubbornly different for others.

For a founder, the provider is a dependency to manage like any vendor. Don't weld your whole product to one model's exact behaviour: a prompt tuned to one provider's idiosyncrasies can break on the next version or on a competitor. Keep an abstraction layer so you can switch, route easy work to a cheaper model and hard work to a stronger one, and avoid being held hostage by one supplier's price or availability.

_Avoid:_ treating the provider as a permanent, unchangeable part of your stack. Models update, deprecate, and reprice constantly: design to swap.

_Usage:_
> "Let's route the bulk classification to the cheap provider and keep the premium model for the final draft."

Related: [foundation-model](#foundation-model), [inference](#inference), [knowledge-cutoff](#knowledge-cutoff), [ai-native-vs-wrapper](07-ai-native-business.md#ai-native-vs-wrapper)

### Latency and throughput

Two different speed measures: latency is how long one request takes to answer; throughput is how many requests (or tokens) the system can serve at once.

A user staring at a loading spinner feels latency. Your finance team staring at the bill cares about throughput. They trade off against each other and against cost: the biggest, smartest model is usually the slowest per request, while smaller models and techniques like streaming, caching, and batching buy you speed and volume. Streaming is the cheapest perceived-latency win: show tokens as they generate and a slow answer feels fast because the user sees progress immediately.

Decide what your product actually needs. A live chat assistant lives or dies on first-token latency; an overnight batch job that processes ten thousand documents cares only about throughput and cost. Pick the model and the plumbing to match: over-paying for low latency on a background job, or shipping a sluggish model into a real-time chat, are both classic and avoidable mistakes.

_Avoid:_ using "latency" and "throughput" interchangeably, or optimising one when the user feels the other. A high-throughput batch system can still feel slow to an individual user, and vice versa.

_Usage:_
> "First-token latency is what the user feels. Turn on streaming and the same model feels twice as fast."

Related: [inference](#inference), [token](#token), [model-provider](#model-provider), [prompt-caching](02-context-and-sessions.md#prompt-caching)

*Part of [The Dictionary of AI-Native](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
