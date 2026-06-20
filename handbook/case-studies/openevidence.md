# Case Study: OpenEvidence

*Why "purpose-built for a regulated answer" beats "general-purpose chat," and why trust, not the model, is the moat.*

**Sector:** health · **AI-native pattern:** verification-deficit closed + trust moat

## What they do

OpenEvidence is a clinical decision-support tool, often described as "ChatGPT for doctors." A physician types a real clinical question ("first-line treatment for a 62-year-old with X and contraindication Y"), and the system returns a direct, structured answer with the medical literature it stands on: citations, study types, the line of reasoning. It is built for one job, answering clinical questions against published evidence, not for open-ended conversation.

The product reportedly reaches a large share of US physicians and carries a valuation in the billions [claimed in source]. Treat those digits as illustrative of a pattern, not a benchmark; what matters is the shape of the bet, not the headline number.

The difference from a general chatbot is not the tone of the output. It is what sits behind the answer. A consumer model will happily produce a fluent, plausible-sounding treatment recommendation with invented citations. In a clinic, "plausible-sounding" is the failure mode that gets someone hurt. OpenEvidence is engineered so the answer is *anchored* to retrievable, named sources, and the doctor can check the work before acting on it.

## The AI-native lesson

Apply the Remove-the-AI test directly. Take the grounded retrieval and the medical reasoning out of OpenEvidence, and what's left is a search box over a literature database: PubMed with nicer fonts. The thing physicians actually pay for is the layer that reads the question, pulls the *right* evidence, reasons across it, and hands back something a busy clinician can trust in thirty seconds. That layer breaks the product if you remove it. By the OS's definition, that makes it AI-native, not an AI feature bolted onto a search engine.

Here is the part founders in regulated domains keep missing: the moat is not the language model. Anyone can call the same foundation model. The moat is **trust earned by closing the verification deficit**: the gap between an answer that sounds right and an answer you can stand behind. General models are optimised to be fluent; in medicine, fluency without grounding is a liability. OpenEvidence's whole architecture is a bet that the scarce, defensible thing is a precise, sourced, checkable answer. That is RAG used as a trust mechanism, not a feature: retrieval is what lets a clinician verify rather than believe.

What compounds with use is the trust substrate itself. Every answer a physician can verify and act on safely deepens the product's standing, and standing, in a domain where a wrong answer ends careers, is the highest switching cost there is. A doctor who has learned that the citations are real and the reasoning holds up does not casually try the generic chatbot next week. The moat is built one verified, sourced answer at a time, and it is far harder for a deep-pocketed generalist to copy than any model weight.

## What a founder should copy

- **Pick a job, not a surface.** "Answer clinical questions against the literature" beats "AI for healthcare." Narrow scope is what lets you guarantee a trustworthy answer.
- **Make the answer checkable.** In a regulated field, ground every output in retrievable, named sources so the human can verify before acting. Verifiability *is* the product, not a nice-to-have.
- **Treat trust as the moat, not the model.** Your competitor can rent the same model tomorrow. They cannot rent the years of verified, safe answers that made experts rely on you.
- **Beat the generalist on precision, not breadth.** A general chatbot wins on range; you win by being right, sourced, and safe in one domain that punishes being wrong.
- **Engineer against plausible-but-wrong.** The enemy in sensitive domains is the confident hallucination. Design retrieval and review so a fluent fabrication can't reach the user unflagged.

## Read next

- Handbook: [The AI-Native Founder in Hard-Mode Sectors](../01-ai-native-founder.md)
- Handbook: [Evaluation and Safety](../08-evaluation-and-safety.md)
- Dictionary: [RAG (retrieval-augmented generation)](../../dictionary/02-context-and-sessions.md#rag-retrieval-augmented-generation), [Verification deficit](../../dictionary/05-failure-modes.md#verification-deficit), [The six-pillar trust substrate](../../dictionary/06-evaluation-and-safety.md#the-six-pillar-trust-substrate), [AI-native vs wrapper](../../dictionary/07-ai-native-business.md#ai-native-vs-wrapper)

---
*Case study in the [AI-Native OS Handbook](../README.md). Figures tagged `[claimed in source]` are unverified: see [SOURCES.md](../SOURCES.md). CC-BY-4.0.*
