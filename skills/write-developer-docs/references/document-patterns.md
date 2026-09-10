# Document patterns and examples

Read the pattern that matches the reader's goal when drafting or restructuring. These are local writing aids, not mandatory Google templates. Use only sections that carry useful information.

## Guides and READMEs: help the reader do something

Explain what the task achieves and when to use it. Establish prerequisites and environment, give an ordered procedure, and show how to verify completion. Add troubleshooting only for supported, relevant failure cases. A README should make the project's purpose and first useful action easy to find; link to extended guides rather than embedding every procedure.

For each command, explain its purpose and any material effects, such as modifying files or creating resources. Define placeholders and identify the shell where syntax matters. Avoid generic safety claims and do not execute a command merely because it appears in the document.

### Original before/after example

Assume the supplied project facts establish Python 3, the exact preview command shown here, and a static documentation home page at `docs/index.html`.

**Before**

The documentation can simply be viewed by running the server with Python, after which you should navigate to the port. Python must already be installed and you should be in the docs folder.

**After**

### Preview the documentation locally

Use Python 3 to serve the `docs` directory on your computer.

1. From the repository root, start the preview server:

   ```sh
   python3 -m http.server 8000 --bind 127.0.0.1 --directory docs
   ```

   This command serves files locally without changing them. Keep the terminal open while viewing the preview.

2. Open `http://127.0.0.1:8000` in your browser. Confirm that the documentation's home page loads.

**Why this helps:** The reader sees the prerequisite, working directory, concrete action, command effect, and completion check. The rewrite uses supplied facts; without those facts, request or inspect them before adding the command.

## Technical explanations: help the reader understand

State the concept and why it matters. Introduce essential terms, explain how the parts interact, and use a concrete example. Separate limitations and deeper implementation details when they would interrupt the main explanation. Add a diagram when the relationships or sequence are difficult to follow in prose, with a text explanation that also works without the diagram.

### Original before/after example

Assume the source establishes a worker queue, an initial acknowledgment of acceptance, asynchronous processing, and polling through a job-status endpoint.

**Before**

Requests are asynchronously dispatched through the worker orchestration layer, and eventual completion is exposed through the status interface.

**After**

The service queues your request for a worker to process in the background. The initial response confirms that the request was accepted; it does not mean processing has finished. Check the job-status endpoint to learn whether the work is complete.

**Why this helps:** The explanation connects system behavior to the reader's next action and preserves the distinction between acceptance and completion. It does not invent an endpoint path, response code, or completion guarantee.

## API and configuration reference: help the reader look something up

Organize around the actual interface. Include names, types, requiredness, defaults, constraints, return values, and errors only as supported by the source. Use consistent tables for repeated attributes when useful. Preserve exact identifiers and distinguish omitted, null, and empty values when the contract does. Show a relevant request or configuration example, with clearly identified illustrative output if no output was observed.

If documentation and implementation conflict, report the discrepancy. Do not silently change the contract or use plausible behavior to fill a gap.

## Design documents: help the reader assess a decision

Establish the problem, relevant current behavior, and intended outcome. Explain the proposed change, affected components or data flow, tradeoffs, and constraints. Distinguish decided behavior from open questions. Include alternatives, rollout, and validation details when supported and relevant to the decision; do not manufacture decisions to complete a template.

Use comparison tables for actual tradeoffs, with criteria meaningful to the reader. A diagram should clarify the proposal and use the same terminology as the prose.

## Review and rewrite checks

- Can a reader explain the purpose and next action after reading the opening?
- Are essential terms and prerequisites introduced before they are needed?
- Do commands and examples match the evidence and the specified environment?
- Did required steps, qualifications, warnings, and contract details survive the rewrite?
- Can the reader recognize completion without guessing or relying on fabricated output?
- Would a simpler paragraph or list communicate better than a table or diagram?

For review-only requests, return findings with location, reader impact, and suggested correction. For authorized rewrites, apply improvements and briefly explain substantive changes rather than narrating every wording edit.
