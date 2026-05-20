#!/bin/bash
set -uo pipefail

MELOS_ROOT_PATH="${MELOS_ROOT_PATH:-$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)}"
FORMATTER="$MELOS_ROOT_PATH/.tools/scripts/melos/format_output.sh"

# ── parse args ────────────────────────────────────────────────────────────────
ONLY_FAILED="--only-failed"
SCOPE_FLAG=""
SELECTED=()

for arg in "$@"; do
    if [ "$arg" = "--show-passed" ]; then
        ONLY_FAILED=""
    elif [[ "$arg" == --scope=* ]]; then
        SCOPE_FLAG="$arg"
    else
        SELECTED+=("$arg")
    fi
done

if [ ${#SELECTED[@]} -eq 0 ]; then
    echo "usage: run.sh [--show-passed] [--scope=<glob>] <melos-script> [<melos-script>...]"
    exit 1
fi

# ── runner ────────────────────────────────────────────────────────────────────
FAILED=()
PASSED=()
STEP=0
TOTAL=${#SELECTED[@]}
SPIN='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
[ -t 1 ] && IS_TTY=1 || IS_TTY=0

check() {
    local name=$1
    STEP=$((STEP + 1))

    local tmpfile pid i=0
    tmpfile=$(mktemp)
    melos run "$name" $SCOPE_FLAG > "$tmpfile" 2>&1 &
    pid=$!

    if [ $IS_TTY -eq 1 ]; then
        while kill -0 "$pid" 2>/dev/null; do
            printf "\033[2K\rstep %d/%d: %s %s" \
                "$STEP" "$TOTAL" "$name" "${SPIN:$((i % 10)):1}"
            i=$((i + 1))
            sleep 0.1
        done
    fi
    wait "$pid" 2>/dev/null
    local exit_code=$?

    if [ $exit_code -eq 0 ]; then
        PASSED+=("$name")
        if [ $IS_TTY -eq 1 ]; then
            printf "\033[2K\rstep %d/%d: %s \033[32m✓\033[0m\n" "$STEP" "$TOTAL" "$name"
        else
            echo "step $STEP/$TOTAL: $name ✓"
        fi
    else
        FAILED+=("$name")
        if [ $IS_TTY -eq 1 ]; then
            printf "\033[2K\rstep %d/%d: %s \033[31m✗\033[0m\n" "$STEP" "$TOTAL" "$name"
        else
            echo "step $STEP/$TOTAL: $name ✗"
        fi
    fi

    bash "$FORMATTER" "$ONLY_FAILED" < "$tmpfile"
    echo ""
    rm -f "$tmpfile"
}

for name in "${SELECTED[@]}"; do
    check "$name"
done

# ── summary ───────────────────────────────────────────────────────────────────
echo "────────────────────────────────────────"
echo "PASSED: ${PASSED[*]:-none}"

if [ ${#FAILED[@]} -gt 0 ]; then
    echo "FAILED: ${FAILED[*]}"
    exit 1
fi

echo "ALL CHECKS PASSED"
