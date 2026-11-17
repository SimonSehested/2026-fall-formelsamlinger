# Verification Guide

After generating the formula collection, verify it against exam sets.

For each exam problem:

1. Identify the mathematical topic.
2. Identify formulas, definitions, or methods required.
3. Check whether the formula collection contains them.
4. If missing, add the missing material to the correct lecture file.
5. Record the result in `reports/exam_verification_report.md`.

Use this table format:

| Exam | Problem | Required concept | Covered in file/section | Missing? |
|---|---|---|---|---|

## Symboloversigt check

Also verify the Symboloversigt:

1. Confirm `sources/00_symbols_and_notation.tex` exists and is first in `main.tex`.
2. Spot-check important formulas: every non-trivial symbol should appear in the glossary with meaning and unit.
3. Confirm overloaded symbols have context notes.
4. Confirm constants include value and unit.
5. If a symbol is used in a chapter but missing from Symboloversigt, add it.

Rules:

- Do not solve full exam problems unless needed to identify missing formulas.
- Focus on coverage.
- Prefer adding compact reference formulas over long explanations.
- If an exam requires a recurring method, add a reusable formula or rule.
- If a concept appears in several exams, ensure it has a clear searchable heading.
- If a formula is missing from slides but clearly required by exams, add it and mark it with a comment:

    % Added from exam coverage
