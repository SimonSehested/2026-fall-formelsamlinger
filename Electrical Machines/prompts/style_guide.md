# Style Guide for Formula Collection

## Overall style

Write in concise engineering handbook style.

The formula collection should look like a clean mathematical/engineering reference, not lecture notes.

Each concept should normally be written as:

```tex
\subsubsection{Searchable concept name}
\[
formula
\]
Short physical or mathematical explanation.
```

## Mandatory rules

- Output in `.tex` files must be valid LaTeX only.
- Use `\section`, `\subsection`, and `\subsubsection`.
- One concept per `\subsubsection` when possible.
- Put important formulas in display math.
- After each formula block, write 1-3 concise explanatory sentences.
- Prefer physical/mathematical meaning over procedural explanation, except in exam recipes.
- Keep wording compact.
- Avoid long paragraphs.
- Avoid bullet lists unless they improve lookup speed.
- Avoid examples unless essential for exam use.
- No Markdown in `.tex` files.
- Infer notation from the course source material; do not import notation from another course.

## Explanation style

Good:

    The torque-speed relation follows from the air-gap power and rotor current.

Bad:

    This formula is useful when you are asked to solve problems where you need to calculate the answer.

Good:

    Synchronous speed is set by supply frequency and the number of pole pairs.

Bad:

    You should remember this because it often appears in exams.

## Preferred formatting

Use this style for central results:

```tex
\[
T = \frac{P}{\omega}
\]
```

Use aligned equations when helpful:

```tex
\[
\begin{aligned}
P &= T\omega,\\
\omega &= 2\pi n.
\end{aligned}
\]
```

## Searchability

Use explicit headings. Include Danish and English aliases when both appear in the course.

Good headings:

```tex
\subsubsection{Synchronous speed, synkron hastighed, pole pairs}
\subsubsection{Induced EMF in a synchronous machine}
\subsubsection{Equivalent circuit of an induction machine}
\subsubsection{Torque-speed curve, tip-speed, slip}
\subsubsection{Power factor from phasor diagram}
```

Bad headings:

```tex
\subsubsection{Important formula}
\subsubsection{Useful theorem}
\subsubsection{Method}
\subsubsection{Theory}
```

## Exam recipes

When a recurring exam task exists, use:

```tex
\subsection{Exam recipe: task name}

\textbf{Use when:} ...

\textbf{Steps:}
\begin{enumerate}
    \item ...
    \item ...
    \item ...
\end{enumerate}

\textbf{Fast checks:} ...

\textbf{Common traps:} ...
```

Keep recipes to 3--7 steps.

## Length

A normal `\subsubsection` should contain:

- 1 heading
- 1-2 display equations
- 1-3 short explanatory sentences

Longer sections are allowed for lookup tables, phasor conventions, machine parameter summaries, and compact decision tables.

## Tables

Use tables for compact lookup when appropriate, for example:

- machine types and governing equations
- per-unit conversions
- phasor sign conventions
- losses and efficiency relations
- operating modes

Tables should be compact and searchable.

## Symboloversigt (mandatory)

The first content section must be a Symboloversigt: a full list of variables/symbols with meaning and units.

Put it in `sources/00_symbols_and_notation.tex` and input it first in `main.tex`.

Preferred table format (three columns):

```tex
\section{Symboloversigt}

\subsection{Ctrl+F keywords: symbol, notation, units, meaning, variabel, enhed, Symboloversigt}

\begin{center}
\begin{tabular}{@{}>{$}l<{$} p{7.5cm} l@{}}
\toprule
\text{Symbol} & \text{Meaning} & \text{Unit}\\
\midrule
B & Specific magnetic loading / air-gap flux density & \(\mathrm{T}\)\\
ac & Specific electric loading & \(\mathrm{A\text{-}conductors/m}\)\\
\bottomrule
\end{tabular}
\end{center}
```

Also include a constants table when relevant:

```tex
\begin{center}
\begin{tabular}{@{}>{$}l<{$} l l p{4.5cm}@{}}
\toprule
\text{Symbol} & \text{Value} & \text{Unit} & \text{Note}\\
\midrule
\mu_0 & \(4\pi\times10^{-7}\) & \(\mathrm{H/m}\) & Vacuum permeability\\
\bottomrule
\end{tabular}
\end{center}
```

Rules:

- Every important symbol used in the formula chapters must appear here
- Meaning must say what the quantity refers to, not just repeat the symbol name
- Unit must be explicit; use ``dimensionless'' when appropriate
- Split into thematic tables if one table becomes too long
- Include overloaded symbols with a short context note

## Verification language

If source material is unclear, write a LaTeX comment:

```tex
% TODO: verify from lecture slides
```

Do not silently guess.
