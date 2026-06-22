# 04. Customer Discovery That Doesn't Lie

> **Thesis.** Talk is cheap, and AI makes it cheaper. Customers tell you what you want to hear, and a model will tell you the same thing back, smoothed and sourced. Only behaviour and money are evidence. Build discovery to disconfirm, or it will only ever confirm what you already hoped.

## The shift

You did the disciplined thing. You did not build first. You talked to fifteen people in your sector, recorded the calls, kept the transcripts, then fed them to a model and asked what you had learned. Back came a clean summary: strong interest, real pain, several people who said they would definitely use this. You felt validated. You started building.

You were lied to twice. The people you interviewed were being polite, because nobody on a friendly call tells a hopeful founder their idea is weak. The model was being agreeable, because you asked an open question and it found the encouraging shape in the noise. Neither lie was malicious. Both were structural, and together they produce the most dangerous object in early-stage company-building: a discovery process that feels rigorous and confirms precisely what you wanted to hear.

Here is what changed, and why the old way now fails faster. Discovery used to be slow enough that the friction protected you. You had to read every transcript yourself, line by line, and the reading forced you to notice the awkward bits. A model reads all fifteen in seconds and hands you the average. The friction is gone, and with it the accidental rigour that came from doing the work by hand. Speed did not make discovery better. It made the flattering version of discovery effortless, which is worse.

So the discipline has to move. It can no longer live in the slowness, because there is no slowness left. It has to be designed in, on purpose, as the explicit job of the workflow: not to find the reasons you are right, but to hunt the reasons you are wrong. Discovery that asks for permission will always be granted it. Discovery built to disconfirm is the only kind that tells you anything you did not already believe.

## The framework

Four moves separate discovery that lies from discovery that holds.

1. **Confirmation bias, supercharged.** You arrived with confirmation bias already, because you are attached to your idea being right and your attention bends toward the evidence that says so. Now bolt a fluent, tireless, agreeable assistant onto that bend. Ask a model whether your interviews support your idea, and it will support your idea, with structure and quotes and a confidence that reads like proof. That is [sycophancy](../dictionary/05-failure-modes.md#sycophancy), and the fault is in your prompt, not the machine. The fix is to design discovery to seek disconfirming evidence on purpose: never ask the model to find support, order it to find the quotes that undercut you, the hesitations you skated past, the moment someone went quiet when you said the price.

2. **Extraction over sentiment.** Most AI summaries are mood readings. You ask what people thought and you get "generally positive, some concerns," which is the least useful layer a transcript holds and the one the model confabulates best. Make it extract instead: pull every concrete claim, tag each with who said it, and forbid it from smoothing away the outliers. Put supporting and opposing evidence side by side, in two columns, so the balance is visible rather than narrated. The centre of mass is noise. The signal sits in the edge case, the one person who described a workaround so painful they would pay to kill it, and a summary that averages that voice into "mixed feedback" has destroyed the only data worth having.

3. **Observation over stated preference.** People lie about what they want and tell the truth with their wallets and their calendars. What someone says in an interview is cheap, shaped by politeness and the wish to seem forward-thinking. What someone already does, the tool they pay for, the workaround they maintain, the hours they burn on the manual version, is revealed and expensive and real. Weight behaviour above words, always, and train the workflow to do the same. The line that matters is not "I'd love something like this." It is "right now I export it to a spreadsheet every Friday and it takes two hours." One is sentiment. The other is a customer describing the exact pain you can charge to remove.

4. **The five-reasons-they-won't-pay move.** You need one default you run against every batch of transcripts, the way a pilot runs the checklist whether or not the plane feels fine. This is it: feed the model the raw transcripts and instruct it, based only on what these people actually said, to give you the five most likely reasons they will not pay, ranked by probability, each backed by an exact quote. Not "what are the risks." Five specific, ranked, transcript-grounded reasons your customers keep their money in their pocket. Then take the top one and design the cheapest test that proves whether it is true. The move is small enough to run every time, which is its whole power, because heavy discipline gets skipped exactly when the interviews went well and you are itching to build.

## Why it holds

Three companies, three sectors, one posture: run discovery and validation as a search for truth, not approval. Read them for the pattern. Every figure is tagged `[claimed in source]` and traced in [SOURCES.md](SOURCES.md); weigh the mechanism, not the digits.

**Digital Green** works with smallholder farmers, where the people whose pain you must understand are remote, numerous, and easy to misread from a capital city. Rather than guess, it built what it describes as a trusted data-exchange approach, a "Farm Stack" that surfaces specific supply-chain inefficiencies in how smallholders get inputs, advice, and market access, then targets those concrete bottlenecks instead of an imagined average farmer [claimed in source]. The mechanism worth stealing is the loop. Live engagement with farmers feeds real-world feedback straight back into the knowledge base, so the system's grasp of the problem keeps getting more accurate as more farmers use it. When your customer is hard to reach and easy to romanticise, build the channel that turns their actual behaviour into your source of truth.

**Recursion** operates in drug discovery, where the answer about whether you are right arrives not in weeks but in years, and the gap between a promising signal and a thing that works in patients can swallow a decade. Founder Chris Gibson has framed company-building in this domain as a long voyage, on the order of fifteen years, and has emphasised a people-first culture as the thing that makes the distance survivable [claimed in source]. (Gibson stepped down as chief executive in late 2025; treat him here as the founder who set the temperament, not the current CEO.) The lesson for discovery is one of nerve. When the real answer is years away, you are tempted to substitute early enthusiasm for genuine validation, because the truth is simply too far off to wait for. Refuse to mistake motion for proof. Treat discovery as a long game and let the slow, real signals arrive on their own schedule rather than manufacturing fast, fake ones to feel better in the meantime.

**Glass Health** builds AI diagnostic support for clinicians, a setting where "the users liked it" is not just insufficient, it is dangerous. A clinician can find a tool pleasant and still be quietly led toward a worse decision. Glass Health validates its system against clinical guidelines, with the explicit aim of having the AI elevate clinician performance rather than merely automate a task or flatter a workflow [claimed in source]. The discovery lesson generalises far past medicine. Wherever being liked and being useful can diverge, measure against an external standard of correctness, not user sentiment. Stated preference is exactly the signal that can hide harm. Performance against a real benchmark is the signal that cannot.

| Signal | What it looks like | Counts as evidence? |
| --- | --- | --- |
| Stated enthusiasm | "Great idea," "I'd 100% use this," a survey checkbox, a like | No. Costs the customer nothing. |
| Revealed behaviour | Pays for an alternative, maintains a costly workaround, assigns staff hours | Yes. Behaviour with a price tag. |
| The model's mood read | "Generally positive, strong interest from two" | No. The layer it confabulates best. |
| A quote you can locate | An exact line, in the transcript, naming the pain | Yes, once you can point to the words. |

## In hard mode

In food and health, a polite "I'd use that" is not a prescription and not a purchase order. It is the most expensive signal to trust, because the sectors where enthusiasm is cheapest to give are the sectors where being wrong hurts a person.

So validate against guidelines and observed behaviour, not stated enthusiasm. A clinician enjoying your interface tells you nothing about whether your tool moves a real decision toward the correct one; only a benchmark, the clinical guideline, the validated outcome, tells you that. A formulator nodding along in a workshop tells you nothing about whether your ingredient survives the regulator's file; only the dossier and the safety threshold tell you that. The polite answer and the safe answer are different answers, and in these sectors you are paid to know which one you have.

The outlier carries extra weight here, too. The single hospital that already solved this internally, the one regulator's offhand comment that reframes your whole compliance path, the lone formulator who explains why the obvious approach fails: these sparse, high-value voices are precisely what a centre-seeking summary erases, and in hard mode the erased voice is often the entire story. Make the model surface the dissenters by name and keep them out of the average, because the dissenter who already tried your approach and dropped it has handed you a year of saved time, if you are willing to hear it.

The temptation is sharper in these sectors because the real answer is slow and expensive, exactly Recursion's problem at clinical scale. When validation takes years and costs millions, fast fake proof is seductive. Build discovery that holds its nerve, measures against the external bar, and waits.

## What it means for you

1. **Aim the model at your failure, never your success.** Cast it as a sceptical investor reading the same transcripts, or a rival hunting for why this market is a trap. Forbid encouragement. Ask, every single time, where the evidence says you are wrong. Same intelligence, pointed at the thing you are avoiding.

2. **Make it cite the line or discard the claim.** An adversary can [hallucinate](../dictionary/05-failure-modes.md#hallucination) a damning fact as readily as a flatterer invents a flattering one. If the model says someone said something, demand the exact words in the transcript. No quote, no objection. This is the same posture the Dictionary calls a [critic/judge pairing](../dictionary/04-agentic-patterns.md#critic-judge-pairing): separate the part that wants the idea to win, which is you, from the part whose only job is to find the flaw.

3. **Sort every statement into said-versus-did.** One bucket for what people said they would do, one for what they already do and already pay for today. The second bucket is demand. Then push deeper: where does this already cost them money? A contractor running a workaround, a competing tool grudgingly subscribed to, a headcount assigned to the problem. Those are the fingerprints of funded pain.

4. **Count only signals with a price tag.** A demand signal is something the customer did that cost them time, money, attention, or a switch away from an incumbent. They paid for an early version. They introduced you to whoever controls the budget. They got annoyed when your prototype was down. Refuse to let a thumbs-up sit in the same column as a payment.

5. **Run the five-reasons move before you let yourself feel good.** Every round, before the celebration, not after. Then take reason number one and design the cheapest test that settles it this week. The destination of all this discipline is the [40% rule](../dictionary/07-ai-native-business.md#the-40-rule-sean-ellis-test): real fit shows up as people who would be genuinely disappointed to lose something they already use. Stated enthusiasm cannot get you there. Only behaviour can, and the same habit later becomes the [data flywheel](../dictionary/07-ai-native-business.md#data-flywheel) once real usage starts feeding real signal back into the product.

## The test

Take your last round of interviews. Can you name three people whose actual behaviour, what they already do and already pay for, is strong evidence of funded demand? If you can only name people who said nice things, you have collected approval, not evidence, and you are about to build on it. Run [`customer-discovery-that-doesnt-lie`](../skills/customer-discovery-that-doesnt-lie/SKILL.md) to pull funded demand out of the transcripts, and [`frame-the-hypothesis`](../skills/frame-the-hypothesis/SKILL.md) to lock the falsifiable bet, then dispatch the [`devils-advocate`](../agents/devils-advocate.md) agent to tear the findings apart. Stage: **Frame**.

---

*Chapter 04 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [03. Mapping Markets, Competitors & EU Terrain](03-mapping-markets-eu-terrain.md) · Next: [05. Architect Before You Touch Code](05-architecting-before-code.md).*
