#!/bin/bash
# Formats melos exec output into per-package status lines.
# Handles both sequential (-c 1) and concurrent (-c N) melos exec output.
# Args: [--only-failed]

ONLY_FAILED="${1:-}"

awk -v only_failed="$ONLY_FAILED" '
# ── sequential helpers ────────────────────────────────────────────────────────

function flush_seq(    n, i, lines, line) {
    if (seq_pkg == "") return
    seq_count++
    if (seq_ok) {
        if (only_failed != "--only-failed")
            print "  [" seq_pkg "] \033[32m✓\033[0m"
    } else {
        print "  [" seq_pkg "] \033[31m✗\033[0m"
        n = split(seq_buf, lines, "\n")
        for (i = 1; i <= n; i++) {
            line = lines[i]
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
            if (line != "") print "      " line
        }
    }
    seq_pkg = ""; seq_buf = ""; seq_ok = 0
}

# ── concurrent helper ─────────────────────────────────────────────────────────
# Called at END after the failed list has been collected.

function print_concurrent(    i, name, n, j, lines, line) {
    for (i = 1; i <= con_count; i++) {
        name = con_order[i]
        if (name in con_failed) {
            print "  [" name "] \033[31m✗\033[0m"
            n = split(con_output[name], lines, "\n")
            for (j = 1; j <= n; j++) {
                line = lines[j]
                gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
                # Skip flutter startup-lock noise
                if (line != "" && line !~ /Waiting for another/)
                    print "      " line
            }
        } else {
            if (only_failed != "--only-failed")
                print "  [" name "] \033[32m✓\033[0m"
        }
    }
}

# ── main ──────────────────────────────────────────────────────────────────────

BEGIN {
    in_section = 0; has_section = 0; mode = "unknown"
    seq_pkg = ""; seq_buf = ""; seq_ok = 0; seq_count = 0
    con_count = 0; non_exec = ""
}

/^-{10,}$/ {
    has_section = 1
    if (!in_section) {
        in_section = 1
    } else if (mode == "sequential") {
        # In sequential mode each separator closes one package and opens the next —
        # stay in_section so the following package header is captured correctly.
        flush_seq()
    } else {
        # Concurrent: one open/close pair wraps all packages; close the section.
        in_section = 0; mode = "unknown"
    }
    next
}

in_section {
    # Detect mode from first meaningful line
    if (mode == "unknown") {
        # Concurrent lines: [pkg]: ... (possibly prefixed with ERROR: etc.)
        if (/\[[a-zA-Z][a-zA-Z0-9_-]*\]:/)    mode = "concurrent"
        else if (/^[a-zA-Z][a-zA-Z0-9_-]*:$/) mode = "sequential"
    }

    if (mode == "sequential") {
        if (seq_pkg == "" && /^[a-zA-Z][a-zA-Z0-9_-]*:$/) {
            seq_pkg = substr($0, 1, length($0) - 1); next
        }
        if (/^[a-zA-Z][a-zA-Z0-9_-]*: SUCCESS$/) { seq_ok = 1; next }
        if (seq_pkg != "") seq_buf = seq_buf $0 "\n"
    }

    if (mode == "concurrent" && /\[[a-zA-Z][a-zA-Z0-9_-]*\]:/) {
        # Extract name from first [...] on the line (handles "ERROR: [pkg]:" prefix)
        tmp = $0; sub(/^[^\[]*\[/, "", tmp)
        name = tmp; sub(/\].*$/, "", name)

        content = $0; sub(/^[^\[]*\[[^\]]*\]: ?/, "", content)

        if (!(name in con_seen)) { con_seen[name] = 1; con_order[++con_count] = name }

        ctrim = content; gsub(/^[[:space:]]+|[[:space:]]+$/, "", ctrim)
        if (ctrim != "") con_output[name] = con_output[name] content "\n"
    }
    next
}

# Failed package list from melos summary outside sections:
#   "        └> flow_builder (with exit code 1)"
/with exit code/ {
    f = $0
    gsub(/^[^>]*>[[:space:]]*/, "", f)   # strip up to and including "> "
    gsub(/[[:space:]].*$/, "", f)         # strip " (with exit code...)"
    if (f != "") con_failed[f] = 1
    next
}

# Non-exec output (no sections — e.g. melos list --cycles).
# Collect only when no sections have appeared and skip melos boilerplate.
!has_section &&
!/^[[:space:]]*\$/ && !/└>/ && !/➡/ && !/RUNNING/ && !/^melos / && !/^[[:space:]]*$/ {
    line = $0; gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
    if (line != "") non_exec = non_exec "  " line "\n"
}

END {
    if (mode == "sequential") flush_seq()
    if (con_count > 0) print_concurrent()
    if (seq_count == 0 && con_count == 0 && non_exec != "") printf "%s", non_exec
}
'
