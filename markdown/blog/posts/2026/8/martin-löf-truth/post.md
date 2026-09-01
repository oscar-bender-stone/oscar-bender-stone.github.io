---
title: Martin-Löf's Conception of Truth
date: 2026-08-31
bibliography: refs.bib
---

Hello all! Last week became more hectic than I expected. For the next month, I
aim to post at least once a week, hopefully more. Now I will jump right into
today's topic.

[In my previous post](./blog/posts/2026/8/hello-blog/index.html), I mentioned I
would dive into Martin-Löf's work on type theory. Here's where I want to start:
_Truth of a proposition, evidence of a judgement, validity of a proof_
[@MartinLf1987Truth].

In short, this paper describes Martin-Löf's conception of truth, on a
philosophical basis. My biggest takeaway is this: the notion of proof comes
_prior_ to truth. Or, another way to put it: the things we know to be true have
a proof. This reverses a long-standing point of view, namely that truth is more
fundamental. I won't delve into the history of that view, but roughly:
Martin-Löf invokes Kant as a means to _over-turn_ Aristotle. (Which, in some
sense, restores some ideas from Plato, who Aristotle had over-turned.)

Besides being philosophically interesting, there is an important _computational
lens_ to this tenet. Repeatedly, Martin-Löf mentions how several logical
interpretations, originating from Heyting, Kolmogorov, and many more, are
actually the same. This is hinting at a deeper realization: _the Curry-Howard
correspondence._ The way that we _define_ proofs themselves has a computational
meaning. Specifically, the "direct" proofs of propositions, i.e., collections of
introduction rules, are computationally _values_. And the "indirect proofs" are
those that can be written in terms of a direct proof, i.e, programs that can be
reduced to values. In other words, proof normalization _is_ execution! This is
why many major type theories today focus on having all programs terminate, to
develop a reasonable notion of proof.

As a part of Curry-Howard, I want to highlight something else: the notion of
_validity_ is fundamental to the notion of proof. Martin-Löf phrases this well:

> we do engage in discussions as to whether a proof is correct or not, and, once
> we do that, we have already taken the notion of correctness or truth or
> reality for granted.
> <cite>[@MartinLf1987Truth, p. 420]</cite>

In other words, models are secondary to proofs. While they can be useful to
study certain properties, the notion of validity come first. Some model
theorists may counter, arguing that certain theories are _precisely defined_
from models. I would still say that proof comes first: these models _themselves_
are described in some sort of theory. I find this more useful as a construction,
to develop theories based on certain desired properties or behaviors of models.
But, no matter what, there is _always_ an underlying notion of validity, hidden
or not.

That is all for this post; thank you for reading! Next time, I will outline
another paper from Martin-Löf and analyze the type judgements therein.
