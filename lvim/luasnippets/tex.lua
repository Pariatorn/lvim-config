local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local line_begin = require("luasnip.extras.conditions.expand").line_begin

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() ~= 1
end

return {
  -- delimiters
  s(
    { trig = "lr", dscr = "left right delimiters with normal brackets" },
    fmta([[\left( <> \right)]], { i(0) }),
    { condition = in_mathzone }
  ),
  s(
    { trig = "lrc", dscr = "left right delimiters with curly bracktes" },
    fmta([[\left\{ <> \right\}]], { i(0) }),
    { condition = in_mathzone }
  ),
  s(
    { trig = "lrs", dscr = "left right delimiters with square brackets" },
    fmta(
      [[
        \left[ <> \right]
      ]],
      { i(0) }
    ),
    { condition = in_mathzone }
  ),

  -- ---------------------------------------------------
  -- environments
  s(
    { trig = "beg", dscr = "Generic environment" },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),

  s(
    { trig = "ali", dscr = "Align environment (numbered)" },
    fmta(
      [[
        \begin{align}
          <>
          /label{eq:<>}
        \end{align}
      ]],
      { i(0), i(1) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "alis", dscr = "Align environment (unnumbered)" },
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}
      ]],
      { i(0) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "itt", dscr = "Itemize environment" },
    fmta(
      [[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
      { i(0) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "enum", dscr = "Enumerate environment" },
    fmta(
      [[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
      { i(0) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "enumc", dscr = "Enumerate environment custom label" },
    fmta(
      [[
        \begin{enumerate}[\label=<>]
          \item <>
        \end{enumerate}
      ]],
      { i(1, "alph*"), i(0) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "fig", dscr = "Figure environment" },
    fmta(
      [[
        \begin{figure}
          \centering
          \includegraphics[width=\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
      { i(1, "path"), i(2), i(3) }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "figp", dscr = "Figure environment positioned" },
    fmta(
      [[
        \begin{figure}[<>]
          \centering
          \includegraphics[width=\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
      { i(1, "h!"), i(2, "path"), i(3), i(4) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "tab", dscr = "Table environment with booktabs" },
    fmta(
      [[
        \begin{table}
          \centering
          \caption{<>}
          \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
          \end{tabular}
          \label{tab:<>}
        \end{table}
      ]],
      { i(1), i(2, "positions"), i(4), i(0), i(3) }
    )
  ),
  s(
    { trig = "tabp", dscr = "Table environment with booktabs positioned" },
    fmta(
      [[
        \begin{table}[<>]
          \centering
          \caption{<>}
          \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
          \end{tabular}
          \label{tab:<>}
        \end{table}
      ]],
      { i(1, "h!"), i(2), i(3, "positions"), i(5), i(0), i(4) }
    )
  ),

  -- ---------------------------------------------------
  -- fonts
  s({ trig = "tit" }, fmta("\\textit{<>}", { i(1) }), { condition = in_text }),
  s({ trig = "tbf" }, fmta("\\textbf{<>}", { i(1) }), { condition = in_text }),
  s({ trig = "mrm" }, fmta("\\mathrm{<>}", { i(1) }), { condition = in_mathzone }),
  s({ trig = "mbf" }, fmta("\\mathbf{<>}", { i(1) }), { condition = in_mathzone }),
  s({ trig = "mbb" }, fmta("\\mathbb{<>}", { i(1) }), { condition = in_mathzone }),

  s({ trig = "tsub" }, fmta("\\textsubscript{<>}", { i(1) }), { condition = in_text }),
  s({ trig = "tsup" }, fmta("\\textsuperscript{<>}", { i(1) }), { condition = in_text }),

  -- ---------------------------------------------------
  -- math
  -- operators
  s({ trig = "ff" }, fmta("\\frac{<>}{<>}", { i(1), i(2) }), { condition = in_mathzone }),
  s({ trig = "sq" }, fmta("\\sqrt{<>}", { i(1) }), { condition = in_mathzone }),

  s(
    { trig = "intt", dscr = "integral with upper and lower limit" },
    fmta("\\int_{<>}^{<>}<>\\mathrm{\\mathstrut d<>}", { i(1), i(2), i(0), i(3) }),
    { condition = in_mathzone }
  ),
  s(
    { trig = "innt", dscr = "integral with symmetric upper and lower limit" },
    fmta("\\int_{-<>}^{<>}<>\\mathrm{\\mathstrut d<>}", { i(1), rep(1), i(0), i(2) }),
    { condition = in_mathzone }
  ),
  s(
    { trig = "sum", dscr = "sum with lower limit" },
    fmta("\\sum_{<>} <>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  s(
    { trig = "summ", dscr = "sum with upper and lower limit" },
    fmta("\\sum_{<>}^{<>} <>", { i(1), i(2), i(0) }),
    { condition = in_mathzone }
  ),

  -- typesetting
  s({ trig = "sub" }, fmta("_{<>}", { i(1) }), { condition = in_mathzone }),
  s({ trig = "subr" }, fmta("_{\\mathrm{<>}}", { i(1) }), { condition = in_mathzone }),
  s({ trig = "sup" }, fmta("^{<>}", { i(1) }), { condition = in_mathzone }),

  -- ---------------------------------------------------
  -- system
  -- preamble
  s({ trig = "up", dscr = "usepackage" }, fmta([[\usepackage{<>}]], { i(1) }), { condition = line_begin }),
  s(
    { trig = "upo", dscr = "usepackage with options" },
    fmta([[\usepackage[<>]{<>}]], { i(1), i(2) }),
    { condition = line_begin }
  ),

  -- sections
  s({ trig = "sec", dscr = "section" }, fmta([[\section{<>}]], { i(1) }), { condition = line_begin }),
  s({ trig = "ssec", dscr = "subsection" }, fmta([[\subsection{<>}]], { i(1) }), { condition = line_begin }),
  s({ trig = "sssec", dscr = "subsubsection" }, fmta([[\subsubsection{<>}]], { i(1) }), { condition = line_begin }),
  s({ trig = "par", dscr = "paragraph" }, fmta([[\paragraph{<>}]], { i(1) }), { condition = line_begin }),

  -- labels and references
  s({ trig = "lab", dscr = "label" }, fmta([[\label{<>}]], { i(1) })),
  s({ trig = "flab", dscr = "Figure label" }, fmta([[\label{fig:<>}]], { i(1) }), { condition = in_text }),
  s({ trig = "elab", dscr = "Equation label" }, fmta([[\label{eq:<>}]], { i(1) }), { condition = in_mathzone }),
  s({ trig = "tlab", dscr = "Tabular label" }, fmta([[\label{tab:<>}]], { i(1) }), { condition = in_text }),

  s({ trig = "ref", dscr = "reference" }, fmta([[\ref{<>}]], { i(1) }), { condition = in_text }),
  s({ trig = "fref", dscr = "Figure reference" }, fmta([[\ref{fig:<>}]], { i(1) }), { condition = in_text }),
  s({ trig = "eref", dscr = "Equation reference" }, fmta([[\ref{eq:<>}]], { i(1) }), { condition = in_text }),
  s({ trig = "tref", dscr = "Tabular reference" }, fmta([[\ref{tab:<>}]], { i(1) }), { condition = in_text }),

  s({ trig = "cit", dscr = "Cite" }, fmta([[\cite{<>}]], { i(1) }), { condition = in_text }),

  -- misc
  s({ trig = "qty", dscr = "siunitx number and unit" }, fmta([[\qty{<>}{<>}]], { i(1), i(2) }))
}
