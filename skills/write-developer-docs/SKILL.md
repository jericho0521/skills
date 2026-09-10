---
name: write-developer-docs
description: Write, rewrite, or review developer documentation using Google's developer documentation style guide. Use for setup guides, READMEs, technical explanations, API documentation, and design documents when readers need clearer structure, precise instructions, or understandable explanations. Review-only requests produce findings without editing files.
---

# Write developer docs

Help readers understand a system, complete a task, or assess a technical decision. Preserve technical meaning while improving the path through the document.

## Workflow

1. Establish the task and evidence.
   - Determine whether the request is to create, rewrite, or review. Keep questions and review-only requests read-only; do not interpret findings as permission to edit.
   - Inspect supplied material, relevant code or API definitions, and project documentation conventions. Identify the reader's goal and the document's destination.
   - Default to a mixed technical audience: explain essential concepts and project terminology without teaching unrelated fundamentals. Ask only when missing information materially changes the result.
   - Distinguish implemented behavior from proposals and assumptions. Do not invent prerequisites, commands, defaults, guarantees, or sample results. Surface evidence gaps; ask about blockers and keep nonblocking uncertainties explicit in the delivery notes.

2. Choose a structure for the reader's goal.
   - Follow explicit user requirements and project conventions, then Google's guidance. Preserve the destination's format; default to Markdown when unspecified.
   - Start with the purpose and useful outcome. Put information in the order readers need it, introducing unfamiliar concepts before relying on them.
   - For substantial drafting or restructuring, read [Document patterns and examples](references/document-patterns.md) and use the relevant pattern. These are adaptable patterns, not required section templates.
   - Keep detailed reference material out of the main procedure when it interrupts progress. Preserve requirements, qualifications, and meaningful links when reorganizing existing content; check affected heading links.

3. Write or assess the content.
   - Apply [Google style guidance](references/google-style-guidance.md). Use the bundled core for routine work and official topic links for uncertain or specialized style questions. If live verification is unavailable, use the core and disclose any unresolved style question; do not claim a fresh verification.
   - Use concrete examples when they explain a concept or show how to apply an instruction. Mark illustrative examples as such and distinguish sample output from observed output.
   - Use tables for genuine comparisons and diagrams for relationships or flows that prose makes harder to follow. Use Mermaid only when the destination supports it; otherwise explain the relationship in text. Accompany diagrams with a text explanation and provide appropriate text alternatives for images.
   - Preserve exact identifiers, UI labels, API contracts, units, and distinctions such as required versus optional. Explain terminology instead of replacing precise terms with misleading simplifications.

4. Verify comprehension and accuracy.
   - Walk through the document as its intended reader. Can they identify its purpose, understand the essential terms, follow the steps, and recognize success or a relevant failure?
   - Check technical claims against the available evidence. Inspect examples for prerequisites, placeholder definitions, shell or language context, and consistency with the described behavior. Execute examples only when appropriate and authorized; report what was actually checked.
   - Check heading hierarchy, link targets, code formatting, terminology, and whether each table or diagram earns its space. Avoid repeating the same information across prose and visual aids.
   - For a review, report specific locations, reader impact, and suggested changes; distinguish technical errors from editorial improvements. Do not rewrite the file.
   - For a rewrite, deliver the revised document and briefly explain material changes. For new documentation, deliver the document. Keep unresolved questions and verification limits separate from reader-facing prose unless readers need them.

## Completion criteria

The reader has enough context to understand the explanation or complete the documented task. Technical claims are supported or explicitly qualified, required information survives editing, and the output fits the requested destination. Do not pad a short answer with mandatory sections or add a style-compliance report unless requested.
