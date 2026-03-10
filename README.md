# What This Repo Is

This is my attempt at learning how to use NeoVim

## Goals

1. Find new ways to be productive without use of AI
2. Write clean and maintainable code 
3. Make fewer mistakes, and learn
4. Learn how to use Linux, and generally learn how my system works

## Motivations

AI is getting shoved into literally every tool available

As someone who's exclusively used VSCode, it was very easy to switch over to Cursor

But as I've started using AI tools more and more, I've noticed that adopting it into your workflow comes with some consequences

The biggest is accountability. 

"A computer can never be held accountable, therefore a computer must never make a management decision."  - IBM

The more removed we get from the code writing process, the less aware we are of the system that we're making.

It's easy to review PRs and AI generated code that makes sense at the time that you review it. But as time goes on, when you get a chance to revisit and refactor the code, you'll notice that a lot of the code is straight up garbage. It's not maintainable, it's hard to debug, and you know what ends up happening? AI becomes a crutch. The only way for you to get yourself out of the situation, is to roll the dice and keep asking an LLM to make sense of it, and fix the mistakes. This is just not maintainable. 

## Personal Experience with LLMs

When prompting an LLM to generate code, I've found myself in the following situations:

1. I didn't provide enough context explaining the problem to the LLM. It writes bad code that doesn't really solve the problem.
2. I provided some context, and it gets some things right. But a lot of the code has to be rewritten to "make it right". I end up spending so much time prompting it, asking it to fix certain things, that eventually I might as well have just sat down to write the code myself.
3. I provided so much context, and went into such an insane amount of detail that the LLM is able to get the code exactly correct. Awesome! But there comes a point when you've had to describe what you want in so much detail, that you might as well have just sat down and written the code yourself.
4. Similar to above, it seems like it nails the implementation by working off of your highly detailed specs. But edge cases come up naturally, especially with production grade software. It's not until you're writing the code that you start to think of what the edge cases might be. So even if the LLM gets the implementation correct, the implementation is wrong. It's extremely difficult to find and debug logic errors. That's just the nature of software development.

Situations that I've found LLMs to be incredible at handling:

- Small scope. I've already defined the inputs and the output format for this function, but I need help writing what goes inside of it. LLMs that consider the context of your entire project *can* be helpful, but sometimes it's useful to have it not be aware of the context of the system. You should be aware of the context of the system instead.
- Configurations. Writing Dockerfiles, compose files, etc. It's pretty good at this.
- Organizational refactors. Describing how a project should be structured, like which lines of code should belong to certain types of files, or be split into different directories, etc.

Basically, there are times when there's value in getting something done quickly. And there are even more times when there's more value in getting something done correctly.


## Reference Links

Nvim LSP configs: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
