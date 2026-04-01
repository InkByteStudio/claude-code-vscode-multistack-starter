# Project Onboarding Workflow

Use this prompt when getting oriented in an unfamiliar project or helping someone new get up to speed.

## Steps

1. **Explore the structure**: Map the top-level directory layout. Identify the main application code, tests, config, and documentation.
2. **Identify the stack**: Check for framework markers (package.json, composer.json, pyproject.toml, Dockerfile). Note the language, framework, and major dependencies.
3. **Find the entry points**: Locate the main application entry point, route definitions, and configuration files.
4. **Document build and run commands**: Find how to install dependencies, run the dev server, run tests, and build for production. Check package.json scripts, Makefile, or CI configs.
5. **Map the architecture**: Identify key patterns (MVC, service layers, middleware, event systems). Note how data flows from request to response.
6. **Check for conventions**: Look at existing code for naming patterns, file organization, test structure, and commit history.
7. **Summarize**: Produce a concise overview covering stack, structure, key commands, architecture, and conventions.

## Output format
Produce a summary document with these sections:
- **Stack**: Language, framework, major dependencies
- **Structure**: Key directories and what they contain
- **Commands**: Install, dev, test, build, deploy
- **Architecture**: Patterns, data flow, key abstractions
- **Conventions**: Naming, testing, commit style
- **Open questions**: Things that need clarification from the team
