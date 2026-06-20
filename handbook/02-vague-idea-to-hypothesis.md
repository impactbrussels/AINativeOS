# 02. From Vague Idea to Testable Hypothesis

> **Thesis.** A demo is not demand. AI makes a prototype free, which is exactly why a prototype proves nothing. Before you build, verify the problem is real, then make the model argue the other side until your idea bleeds.

## The shift

A working prototype used to be a signal. It cost weeks and a team, so the fact that one existed meant someone had decided the bet was worth that cost. The build was slow enough to act as a filter. Reality had time to walk in and say no before you had spent everything.

That filter is gone. You describe a feature and a working version appears the same afternoon, alone, before a single customer has confirmed the problem is real. The cost of building has collapsed. The cost of building the wrong thing has not, and it may have risen, because a slick demo is so persuasive that it talks you out of the very doubt that would have saved you.

The most common autopsy on a dead startup has not changed in forty years. It built something nobody wanted. AI did not cure that disease. It made the early symptoms feel like health, because now you can have the polished artefact without ever having the conversation that tells you whether anyone needs it.

So the question that defines this stage is not "can I build it." You can. The question is whether the problem is real, whether it hurts, and whether the people who have it will move to make it stop. Frame is where you turn the fog in your head into one sentence you can cheaply prove wrong, before an editor is ever open.

## The framework

Four moves carry you from a hunch to a hypothesis sharp enough to test.

1. **Problem-solution fit before code.** A working prototype proves the technology runs. It says nothing about whether anyone wants the thing it does. These are two separate questions, and AI has made the first one trivial precisely so it can distract you from the second. So you verify the problem first. Go and find the pain before you write a line: the workaround held together with tape, the spreadsheet someone maintains by hand, the angry forum thread, the budget line a manager quietly hates. Pain leaves fingerprints. No fingerprints, no pain, and no amount of clean code will conjure it into existence. A survey will not find them for you, because a survey measures politeness rather than pain. People are kind to your idea in a questionnaire and brutal to it with their wallet.

2. **The structured devil's advocate.** Ask a model whether your idea is good and it will find the good in it, fluently, with reasons you had not thought of. That is [sycophancy](../dictionary/05-failure-modes.md#sycophancy): the system optimising for an answer you will like over the answer that is true. For a founder already in love with the idea, that is poison dressed as a tonic. You already carry confirmation bias, and now you have a tireless, articulate partner that manufactures supporting evidence on demand. Together you form a perfect echo chamber. The only safe default is to invert the prompt. You do not ask the model to evaluate the idea. You order it to refute it. The actual move, every time, as a discipline: *give five reasons this fails, ranked by how likely each is to kill me, and the cheapest test for each.* An objection you cannot answer is the cheapest information you will ever buy, and it is far cheaper here than in a due-diligence room with a term sheet on the table.

3. **Hypothesis mining.** The classic method bottlenecks on one head: a smart person stares at a problem, has an insight, writes it down, goes to test it. The insight is limited by what that head already knows. Hypothesis mining inverts the order. You pour data, literature, or observations from nature into a model and ask it to surface the candidate patterns for you, reading more than you ever could and handing back the non-obvious correlations worth a test. You are not asking it to be right. You are asking it to be a wide, fast first pass over a search space too large for one person to scan. The judgement of which candidate earns a real experiment stays yours.

4. **Falsifiability and the bar.** A belief no evidence could disprove is not a hypothesis. It is faith in a lab coat. "Customers will love this" cannot fail, so you will read every outcome as encouraging and learn nothing. A real hypothesis names, in advance, the result that would prove it wrong, and you set the pass/fail number before you run the test. The bar comes before the data, because a bar set after you see the results is not a bar. It is a rationalisation with a ruler. Humans see success in noise when allowed to grade their own homework after the fact, and the bar exists to stop you moving the goalposts. And cheap falsifiability beats any falsifiability: a hypothesis you can only disprove by building and launching the whole product is technically testable and practically useless, since you find out you were wrong after you have spent everything. Design the test so it could prove you wrong for the price of a week and a few conversations.

The four chain in one direction. Confirm the pain is real. Make the model attack the idea. Mine for the sharpest version of the bet. Then commit to a number that lets reality win the argument.

## Why it holds

Three companies turned a vague, intuition-bound question into a structured search a machine could run. The pattern is the lesson. Treat the figures as claims to verify, not facts to repeat.

**Nuritas** reframed peptide discovery. Finding a useful bioactive peptide, a short chain of amino acids that does something good in the body, was a slow slog through the lab: isolate, screen, test, mostly fail, repeat. The search space is astronomical and each wet-lab check is expensive. Nuritas treated the problem as a computational search instead. AI and genomics model the biology and predict which peptides hidden in food are likely to be active, narrowing millions of candidates to the handful worth taking to the bench. The expensive lab became the confirmation step, run only on what the model had already ranked. The cheap part moved before the costly part. That is hypothesis mining applied to molecules instead of markets. *(Discovery-speed figures: see [SOURCES](SOURCES.md), `[claimed in source]`.)*

**Foodpairing** did the same to flavour. For most of culinary history, what goes with what was a question of intuition: a trained palate decided that strawberry pairs with basil. The knowledge was real and locked inside individual experts, impossible to search. Foodpairing reframed it as a data problem. Profile each ingredient by its aroma molecules, then hypothesise that ingredients sharing key aroma compounds pair well. A faith ("trust the chef") became a falsifiable claim you can run against a database and argue with. Whether the aroma-sharing rule holds in every case is itself contested and tested [claimed in source], and that contest is the point. The intuition became a hypothesis that could lose.

**Beewise** found its wedge in nature. A beekeeper running thousands of hives faces a brutal detection problem: by the time trouble is visible to a human walking the rows, a failing queen, the early creep of collapse, it is often too late. The signal sits earlier in the hive's own data, in temperature, sound, weight, and movement, but no human can watch thousands of hives that closely. Beewise pointed models at that stream, learning the patterns that precede a problem so the system can flag it and, in some cases, physically act. The testable claim, that specific patterns in hive data predict colony trouble early enough to intervene, was mined from observations drawn straight from nature. The company reports meaningful reductions in colony loss and gains in honey yield versus conventional beekeeping [claimed in source]. The percentages matter far less than the move: nature was already broadcasting the answer, and the hypothesis was a bet that a model could hear it.

| Company | Vague question | Reframed as | The move |
| --- | --- | --- | --- |
| Nuritas | "Which peptides do something useful?" | A computational search over candidates | Mine first, validate the shortlist in the lab |
| Foodpairing | "What flavours work together?" | Shared aroma compounds predict pairings | Turn chef's intuition into a falsifiable rule |
| Beewise | "Which hives are in trouble?" | Patterns in hive data predict collapse | Mine the signal nature already emits |

## In hard mode

In food, health, and deeptech the hypothesis is often scientific, not commercial, and that changes where the cheap test lives. Your bet is not only "someone will pay." It is "this biology behaves the way I think it does," and confirming that the slow way can cost a year and a lab's budget.

Turning the biology or chemistry into a searchable space is how you test the vague idea cheaply before that lab spends months. Nuritas did not start by synthesising a peptide. It started by reframing a luck-and-intuition problem as a search a model could scan, so the wet lab only ever ran on pre-ranked candidates. The wider trove your sector sits on, the more this pays: decades of papers, sensor logs, trial data, the structure of nature itself, all underused because no human had the bandwidth to read it. The slower and more expensive your sector's feedback, the more you have to front-load the truth, because reality will not rescue you fast enough to matter. A consumer app learns it backed the wrong problem in a week. A novel-food ingredient or a clinical tool can take a year to learn the same lesson, and the cost of learning it late is measured in dossiers, not screenshots.

One caution that does not retrofit. A mined correlation is a place to point an experiment, never a finding to act on, and the model will [hallucinate](../dictionary/05-failure-modes.md#hallucination) a clean pattern as confidently as it states a true one. Every candidate goes straight to the devil's advocate and then to a real test. In hard mode, "the model said so" is not a result. It is a hypothesis wearing a result's clothes.

## What it means for you

1. **Find the pain before you open an editor.** Go and locate the workaround, the angry thread, the budget line someone resents. If you cannot find a fingerprint of the problem outside your own head, you have not earned the right to build yet.

2. **Make the model refute you, not reassure you.** Hand it your idea with the adversarial brief: *five reasons this fails, ranked by how likely each is to kill me, and the cheapest test for each.* Run it again as a regulator, again as a competitor. Each persona finds a different class of flaw.

3. **Write the hypothesis as a sentence that can lose.** Force it into shape: *I believe [specific, measurable claim about who has the problem and what they will do]; I will know I am wrong if [specific result, with a number, by a date].* No number and no date means you have a hope, not a hypothesis.

4. **Set the bar before you run the test.** Commit to the pass/fail line in writing first. A useful proxy for "people would genuinely miss this" is [the 40% rule](../dictionary/07-ai-native-business.md#the-40-rule-sean-ellis-test), the Sean Ellis test: at least 40 per cent of users say they would be very disappointed without it. Pick your threshold, then let reality grade the homework.

5. **Design the test to be cheap.** Thirty interviews. A fake landing page that measures clicks on "buy." A concierge version where you do the work by hand for five customers before automating anything. The best founders are not the ones with the best ideas. They are the ones who find out fastest, and cheapest, which of their ideas are wrong.

Hold one thread for later. Under every test you design sits a quieter question: would this still be worth doing if you took the AI out of it? That is [the Remove-the-AI test](../dictionary/07-ai-native-business.md#the-remove-the-ai-test), and you are not building the [data flywheel](../dictionary/07-ai-native-business.md#data-flywheel) yet. But the hypothesis you frame here should already hint at why the intelligence has to be load-bearing rather than bolted on. We come back for it.

## The test

Take your idea and have a model give you the five strongest reasons it is wrong, ranked by how likely each is to kill it. Find the one objection you cannot answer. If that objection makes your stomach drop and you have no cheap test that settles it, you do not have a hypothesis yet. You have a hope, and you just learned it for free instead of in month nine. Write the hypothesis, the objection you could not refute, and the cheap test on one page, then keep it. → Run `frame-the-hypothesis` (Stage: Frame).

---

*Chapter 02 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [01. The AI-Native Founder in Hard-Mode Sectors](01-ai-native-founder.md) · Next: [03. Mapping Markets, Competitors & EU Terrain](03-mapping-markets-eu-terrain.md).*
