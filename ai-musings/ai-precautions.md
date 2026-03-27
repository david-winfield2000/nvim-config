# Things I've noticed about LLMs

## Table of contents

- [It tries to fix a symptom of the problem vs the underlying issue](#it-tries-to-fix-a-symptom-of-the-problem-vs-the-underlying-issue)
- [Hallucinations](#hallucinations)
- [Spec-driven development](#spec-driven-development)
- [Using an LLM becomes a crutch](#using-an-llm-becomes-a-crutch)
- [Metrics: evaluating a developer's performance based on their usage of LLMs](#metrics-evaluating-a-developers-performance-based-on-their-usage-of-llms)
- [Design decisions and edge cases - easier when you write the code](#design-decisions-and-edge-cases-easier-when-you-write-the-code)
- [Code ownership](#code-ownership)
- [Overengineered features](#overengineered-features)
- [No quality filter on code](#no-quality-filter-on-code)
- [Code makes sense within the context of the problem. But not in the context of the system](#code-makes-sense-within-the-context-of-the-problem-but-not-in-the-context-of-the-system)
- [Originality](#originality)
- [Outdated information](#outdated-information)
- [Unnecessary rabbit holes](#unnecessary-rabbit-holes)
- [LLM loops](#llm-loops)
- [Levelling up](#levelling-up)
- [Overly verbose](#overly-verbose)
- [Rolling the dice](#rolling-the-dice)
- [Unintended side effects](#unintended-side-effects)

## It tries to fix a symptom of the problem vs the underlying issue

I started getting a warning when running my unit tests. Mentioned it to my LLM. It recommended: turning off the warning message.

Huh? But that warning is clearly a symptom of something that could be a deeper issue

It didn't have a solution for the real issue at hand

This was an example of something that was a bit more obvious what the issue is

But I've experienced the same thing when building out new features. I need some specific functionality. It completes exactly what I asked it to do, but in a hacky way.

## Hallucinations

It's just straight up wrong a lot of the time. It's easy to find issues with what it recommends when you already have strong knowledge on the subject.

But when you don't know much about a topic, it's hard to figure out what it gets wrong.

And LLMs often speak with so much confidence that you assume it's right.

It's easy to fact check for simple things that are easily googleable

But it's hard to tell what it gets wrong when you get into more niche topics

This is especially true for software development, where there are many moving parts, often spanning an entire codebase with related functionalities scattered about many files

## Spec-driven development

There's a real balancing act between writing specs vs writing code.

If you need to go into such a high level of detail when defining technical requirements, it gets to a point where you might as well have just written the code yourself

If you provide too little detail in your spec document? You're rolling the dice to see if the LLM can read your mind

But if you provide enough detail to get it 100% right? Just write the code yourself! Some languages and frameworks make this process incredibly simple

## Using an LLM becomes a crutch

I've experienced this often when trying to use an LLM to automate something I've never done before that I intended to be a one-off script 

But eventually, as you use something more and more, and start doing more complicated things with the tool, you have NO idea how to think for yourself

So you have to use the LLM for every task, no matter how trivial

If you just sit down to learn how to use the tool yourself, not only would you decrease your reliance on an LLM to work with that tool, but you'd be able to spot issues in the future if you decide to keep using LLMs 

## Metrics: evaluating a developer's performance based on their usage of LLMs

Generally most people would agree that the number of google searches a software engineer makes is a poor way to measure their performance

Similarly, shouldn't number of queries to LLMs be a silly metric?

Why does it matter?

Especially when there are plenty of other ways to increase your productivity 

## Design decisions and edge cases - easier when you write the code

With production software, there are always edge cases

Sometimes, until you sit down to write the code yourself, you won't consider a specific edge case

When you transfer the code writing reponsibility to an LLM, the code almost always looks correct

But you've missed the opportunity to consider the real implications of the code: what cases can it handle and what cases it can't

## Code ownership

"A computer can never be held accountable, therefore a computer must never make a management decision."
- IBM Training Manual, 1979

When we delegate too much of the code writing responsibility to a machine, we lose the ability to take ownership of it

Let's say you're a tech lead for a significant revenue-generating product

Leadership asks you "is this ready for production?"

If you don't know entirely what changes are in the code, how can you responsibly answer "yes" to this question?

"I reviewed all the changes the AI made as they were being made, it looked good"

Yes, it made sense with the context of the individual problems the LLM was trying to solve, but it's possible that each of these individual solutions don't blend well together

This could be a disaster

And when you try to dig into the code to review all the changes, you discover that you no longer have any idea what's in the code

Refactoring will be a nightmare

When you let an LLM take the wheel, you lose your ability to take ownership of the code that has been written

## Overengineered features

When LLMs write code, the features are often overengineered.

You ask for a simple bash script, and suddenly it gives you a bash script with multiple different CLI args, 5 different ways of doing things, handling different file types, etc.

It tries to do too much! Why does it try so hard to be helpful? It's actually not helpful!

And that might be fine for one-off scripts

But it's a nightmare to maintain when you are trying to support a full codebase

## No quality filter on code

There is a lot of bad code out there

Models don't have a convenient way for you to filter the quality to ensure that only high quality code is written

And even if this was a feature, quality is a relative term

A lot of the meaning of the code comes from how it solves a particular problem, but also how it pairs with the rest of the codebase

Perhaps the code that the LLM writes makes sense, in some cases. But if it doesn't fit the coding style or the principles that your team follows when writing code, it gets a bit messy

## Code makes sense within the context of the problem. But not in the context of the system

When you use an LLM to generate code for a new feature, the new code might make sense within the context of the problem you were trying to solve

You might say, "It even made unit tests and those are passing!"

Sure, but does this code make sense in the context of the rest of the system?

As an owner of a fine dining experience, would you ever want to add a dish to your menu that doesn't pair well with the rest of what you have to offer?

You wouldn't.

It doesn't make sense to add a French food to your Chinese menu.

So why would you do the same thing with your code?

LLMs can't really determine what fits and what doesn't. That's for SWEs to figure out

## Originality

Several studies out there that claim that LLMs are highly capable of building complex systems from scratch.

Except they're not really building those systems from scratch.. They're cheating. They have the answers to the test

There was an experiment where a team got a network of multiple LLM agents to try to build a C compiler from scratch, using Rust

What ended up happening? All the rust code generated VERY CLOSELY resembled the very real C compiler code that the LLM was trained on

And guess what happened? The compiler didn't even work

It couldn't even do any of the things it set out to do!

LLMs just repurpose existing code

Developers do the same, but we have critical thinking abilities that LLMs do not. No matter how much they try to frame it like they do.

The "Thinking deeper" functionality that a lot of LLMs claim to support is a load of bullshit.

## Outdated information

Very often, LLMs will make suggestions based on older data

For example, I was working on setting up my NeoVim config. The LLM I was working with made recommendations that did not account for the fact that NeoVim's newer API has different options than before

The LLM was unaware of what those options were

Even after I provided the LLM context from the official documentation, it still wasn't able to help me

I had to use my critical thinking skills to figure out how to write the code myself because the LLM wasn't able to help me whatsoever

## Unnecessary rabbit holes

I spent a couple days trying to upgrade and simplify the caching system for one of my applications

I got everything working locally, it looked great, AI generated all the code

It was kind of awesome. Took a LOT of back and forth to get it to get things right (at a certain point I wished I'd just written the code myself)

But eventually I got it working

I deployed the code

It didn't work.

The approach we used, with the package that we were using to implement, simply does not work with the infrastructure that my project was using

When I started building the feature, and figured out that this was the tool I wanted to use to implement these changes, I asked the LLM if it would work with our infrastructure

It confidently said yes.

I guess it didn't have enough context to give me an accurate answer.

So I wasted days working on this, because it confidently told me that it would work for our system.

## LLM loops

When going back and forth with an LLM, as you start pointing out things that it gets wrong,

Weirdly it starts to get even more things wrong

And it forgets what you asked it before

It gets to a point where you need to scrap the whole conversation and start from scratch just to escape the loop of poorly executed requests

## Levelling up

There is real value in being able to read through documentation to understand the tools that you're working with

By outsourcing this skill to LLMs, you lose out on building this extremely valuable skill

Especially for internal tools. It's not always safe or recommended to pass important company information to an LLM as part of its context so you can ask a question

There will definitely be times where using an LLM and providing it with sensitive data is not allowed

So you'll have to read through the docs yourself, and figure out what to do without the assistance of AI

Or perhaps a tool you work with recently had an update that the LLM is not aware of

The LLMs don't have this context yet! You can use context7 MCP or something similar, but there's no guarantee it won't just fall back on what the LLM already knows about that tool, even if that data is out of date

## Overly verbose

The code that LLMs tend to write is overly verbose, and in many cases, hard to understand

Every line of code is a liability

With every feature I create, I want to introduce as little risk as possible

Conciseness matters

LLMs will write 20 lines of code to do something that you could have just done with 4.

And another observation is that if you provide directions on what the LLM should do, it has a preference to add additional lines of code instead of refactoring and simplifying what already exists

## Rolling the dice

Every query to an LLM is a gamble

It might read your mind, read your codebase, and match your coding style exactly.

Or you might waste your time with it, waste keystrokes, time, tokens, and need to yap with it some more to get it to write the code correctly

Querying an LLM feels like playing a slot machine

## Unintended side effects

Often times when you ask an LLM to do something, it will try its best to complete the task at hand

But the code it writes frequenty ships with unintended side effects

You ask it to do one thing, and now it's also adding another supporting feature that you may not necessarily want

And when the LLM is working with multiple files, it becomes more challenging to figure out what exactly changed

## Limited context windows

As the size of your codebase increases, LLMs are less likely to be able to hold context about the state of your project

So the suggestions an LLM makes will be less and less relevant to your project
