# What this repo is

This is my neovim configuration that I use for work + school + fun

## Goals

1. Write code by hand faster
2. Use neovim as my primary editor
3. Get more comfortable using tools in the CLI

## Tools to assist my workflow

Tmux (terminal multiplexer) + plugins:

- tpm - plugin manager
- tmux-resurrect - restore tmux sessions
- tmux-continuum - frequently save backups of tmux sessions

### Proposal for new backend tech stack

Supabase + FastAPI

Supabase to take care of:

- Auth
- Simple CRUD
- Table migrations

FastAPI to take care of:

- Integration with DS/DE workflows
- Core business logic for API endpoints
- Everything else

### Idea

Create your tables in Supabase

Frontend devs can immediately start working on things that are dependent on the API

- They can use the auto-generated PostgREST endpoints to pull the data they need for their work
  - That data might not cover everything that they need, but it gives them the ability to start their work at a similar time as the backend devs
  - Once endpoints requiring more business logic have been created, they can switch over to the new endpoints defined in FastAPI

GraphQL

- No more all or nothing endpoints
  - Frontend devs can request exactly the information that they need from the backend (can choose exactly which data they need)
  - Fewer back and forths interactions with backend devs to change the API so the frontend devs can get what they need

FastAPI

- Lightweight
- Typing on everything via Pydantic
  - Django Ninja devs are already very accustomed to a FastAPI-like workflow
- OpenAPI documentation built right into the framework
- Can plug in anything else that you might need
  - Need an ORM? There are plugins for that (SQLAlchemy recommended, but I've seen other recs too like TortoiseORM)
  - Need an admin panel? There are plugings for that
  - Want GraphQL support? Very easy to set up (documentation recommends using StrawberryQL)
  - FastAPI is flexible
- Async support for endpoints
  - Means you can spend less time waiting for queries to complete, more time putting the CPU to work
  - Ultimately means we can make faster applications

### Things to solve

Authentication - we've always had this problem though

Permissions

- Supabase has row-level security
- Can enforce additional permissions through FastAPI (maybe there's a plugin for this)
