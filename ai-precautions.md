# Things I've noticed about LLMs

## It tries to fix a symptom of the problem vs the underlying issue

I started getting a warning when running my unit tests. Brought it up my LLM. It recommended: turning off the warning message.

Huh? But that warning is clearly a symptom of something that could be a deeper issue

It didn't have a solution for the real issue at hand

This was an example of something that was a bit more obvious what the issue is

But I've experienced the same thing when building out new features. I need **this** functionality. It completes exactly what I asked it to do, but in a hacky way.

## Hallucinations

It's just straight up wrong half the time. And it's easy to find issues with what it recommends doing when you already have some baseline knowledge on the subject.

But when you don't know much on the topic, it's hard to figure out what it's doing right vs wrong.

And it speaks with so much confidence that you *assume* it's right.

It's easy to fact check for simple things that are easily googleable

But it's hard to tell what it messes up when you get into more niche topics

This is especially true for software development, where there are many moving parts, often spanning an entire codebase with related functionalities scattered about many files

## Spec driven development

There's a real balancing act between writing specs vs writing code.

If you need to go into such a high level of detail when defining technical requirements, it gets to a point where you might as well have just written the code yourself

Provide too little detail? You're rolling the dice to see if it can read your mind

Provide enough detail to get it 100% right? Just write the code yourself! Some frameworks make this process incredibly simple

APS uses Python for our API code, that's a very syntax light way to implement many of our backend focused solutions

## It becomes a crutch

Using it to automate something you've never done before that you intended to be a one-off script or something similar

But eventually, as you use something more and more, and start doing more complicated things with the tool, you have NO idea how to think for yourself

So you use the LLM for every little thing

When if you just sat down to learn how to use the tool yourself, not only would you decrease your reliance on the tool, but you'd be able to spot issues in the future if you decide to keep using LLMs 

## Metrics: lines of code vs number of queries. Both bad metrics

Generally most people would agree that the number of lines of code that a software engineer writes is a poor way to measure their performance

Similarly, shouldn't number of queries to LLMs be a silly metric?

Why does it matter?

It would be like tracking the number of times that I google something to measure my performance

## Design decisions - easier when you write the code

With production software, there are **always** edge cases

Sometimes, until you sit down to write the code yourself, you won't consider an edge case

When you transfer the code writing reponsibility to an LLM, the code always looks correct

But you've missed the opportunity to consider the real implications of the code: what cases can it handle and what cases it can't

## Code ownership

"A computer can never be held accountable, therefore a computer must never make a management decision."
- IBM Training Manual, 1979

When we delegate too much of the code writing responsibility to a machine, we lose the ability to take ownership of it

Say you're a tech lead for a significant revenue-generating product

Leadership asks "is this ready for production? if it ends in catastrophe, it's your ass"

If you don't know entirely what changes are in the code, how can you responsibly answer "yes" to this question?

"I reviewed all the changes the AI made as they were being made, it looked good"

Yes, it made sense with the context of the individual problems the LLM was trying to solve, but it's possible that each of these individual solutions don't blend well together

This could be a disaster

And when you try to dig into the code to review all the changes, you discover that you no longer have any idea what's in the code

Refactoring will be a nightmare

## Overengineered features

## Lots of bad code out there, no quality filter with models

There is a lot of bad code out there

Models don't have a convenient way for you to filter the quality to ensure that only high quality code is written

And even if this was a feature, quality is a relative term

A lot of the meaning of the code comes from how it solves a particular problem, but also how it pairs with the rest of the codebase

## Code makes sense within the context of the problem. But not in the context of the system

When you generate code for a new feature, it might make sense within the context of the problem you were trying to solve

"It even made unit tests and those are passing!"

Sure, but does this code make sense in the context of the rest of the system?

As an owner of a fine dining experience, would you ever want to add a dish to your menu that doesn't piar well with the rest of what you have to offer?

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

"Thinking deeper" is a load of bogus.

## Outdated information

Very often, working with an LLM and it will make suggestions based on older data

Was working on setting up my NeoVim config. It made recommendations that did not account for the fact that NeoVim's newer api has different options than before

The LLM was unable of what those options were

Even after I provided it context from the official documentation, it still wasn't able to help me

I had to use my critical thinking skills to figure out how to write the code myself because the LLM wasn't able to help me whatsoever

And the LLM was insistent that it was correct.

It was confidently wrong.

## Going down unnecessary rabbit holes

Spent a couple days trying to upgrade the caching system for one of my applications

Got everything working locally, it looked great, AI generated all the code

It was kind of awesome. Took a LOT of back and forth to get it to get things right (at a certain point I wished I'd just written the code myself)

But eventually I got it working

I merge to a deployed environment

It doesn't work.

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

By outsourcing this to LLMs (which is unreliable, because they're not always up to date, hallucinate, etc.), you lose out on building this extremely valuable skill

Especially for internal tools. It's not always safe or recommended to pass important company information to an LLM as part of its context so you can ask a question

There will definitely be times where this is not allowed

So you'll have to read through the docs yourself, and figure out what to do without the assistance of AI

Or perhaps a tool you work with recently had an update that you should start using.

The LLMs don't have this context yet! You can use context7 MCP or something similar, but there's no guarantee it won't just fall back on what the LLM already knows about that tool, even if that data is out of date

## Overly verbose

The code that LLMs tend to write is overly verbose, and in many cases, hard to understand

Every line of code is a liability

With every feature I create, I want to introduce as little risk as possible

Conciseness matters

LLMs will write 20 lines of code to do something that you could have just done with 4.

But it's hard to get the LLM to get it right

## Rolling the dice

Every query to an LLM is a gamble

It might read your mind, read your codebase, and match your coding style exactly.

Or you might waste your time with it, have wasted keystrokes, time, tokens, and need to yap with it some more to get it to write the code correctly, or just write the code yourself

## Unintended side effects

Often times when you ask an LLM to do something, it will try its best to do it

But the code it writes frequenty ships with unintended side effects

You ask it to do one thing, and now it's also adding another supporting feature that you may not necessarily want

And when you barely understand the underlying thing to begin with, it's hard to figure out what exactly it added

