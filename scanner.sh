#!/bin/bash

# ===== Colors =====
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

# ===== Directories =====
PAYLOAD_DIR="payloads"
HTML_PAY="$PAYLOAD_DIR/html.txt"
SQL_PAY="$PAYLOAD_DIR/sql.txt"
XSS_PAY="$PAYLOAD_DIR/xss.txt"

mkdir -p "$PAYLOAD_DIR"
touch "$HTML_PAY" "$SQL_PAY" "$XSS_PAY"

# ===== Hacker Banner =====
hacker_banner() {
echo -e "${GREEN}"
cat << "EOF"
       ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄
      ████████████████      ██ ██████████████
     █████▀▀▀██▀▀▀█████    ███ ███▀▀▀▀▀▀▀▀▀▀▀
     ████▀    ██    ▀██   ████ ██
     ████     ██     ██   ████ ██   💉 Injection Scanner
     ████▄▄▄▄▄██▄▄▄▄▄██  █████ ██   🧪 HTML | SQL | XSS
     ▀████████████████  █████  ██   🧠 Made by Aashutosh
         ▀▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀   ▀▀
EOF
echo -e "${RED}               >> HACK THE WEB <<${NC}"
}

# ===== Menu =====
show_menu() {
    echo -e "${YELLOW}"
    echo "╔════════════════════════════════════╗"
    echo "║   🔐 Injection Structure Scanner   ║"
    echo "╠════════════════════════════════════╣"
    echo "║ 1. Add Payload     -> HTML/SQL/XSS ║"
    echo "║ 2. Inject Target   -> HTML/SQL/XSS ║"
    echo "║ 3. Remove Payloads -> Reset files  ║"
    echo "║ 4. Exit                           ║"
    echo "╚════════════════════════════════════╝"
    echo -e "${NC}"
}

# ===== Scan Function =====
scan_payloads() {
    local FILE=$1
    local TYPE=$2
    local URL=$3
    local PASSED=0

    echo -e "${YELLOW}[*] Testing $TYPE Injection on $URL...${NC}"

    while read -r PAYLOAD || [ -n "$PAYLOAD" ]; do
        [ -z "$PAYLOAD" ] && continue
        RESPONSE=$(curl -s -G --data-urlencode "q=$PAYLOAD" "$URL")
        if echo "$RESPONSE" | grep -Fq "$PAYLOAD"; then
            echo -e "[${GREEN}PASS${NC}] $TYPE injection succeeded with: $PAYLOAD"
            PASSED=1
            break
        fi
    done < "$FILE"

    if [ "$PASSED" -eq 0 ]; then
        echo -e "[${RED}FAIL${NC}] $TYPE injection failed (no payload worked)."
    fi
}

# ===== Add Payload =====
add_payload() {
    echo -n "Enter payload: "
    read PAYLOAD
    echo "Select type:"
    echo "1. HTML"
    echo "2. SQL"
    echo "3. XSS"
    echo "4. ALL"
    read -p "Choice: " type

    case $type in
        1) echo "$PAYLOAD" >> "$HTML_PAY";;
        2) echo "$PAYLOAD" >> "$SQL_PAY";;
        3) echo "$PAYLOAD" >> "$XSS_PAY";;
        4) echo "$PAYLOAD" | tee -a "$HTML_PAY" "$SQL_PAY" "$XSS_PAY" >/dev/null;;
        *) echo -e "${RED}Invalid type!${NC}"; return;;
    esac

    echo -e "${GREEN}Payload added.${NC}"
}

# ===== Remove Payloads =====
remove_payloads() {
    > "$HTML_PAY"
    > "$SQL_PAY"
    > "$XSS_PAY"
    echo -e "${RED}All payloads removed.${NC}"
}

# ===== Start =====
clear
hacker_banner

# ===== Main Loop =====
while true; do
    show_menu
    echo -n "Select an option: "
    read CHOICE

    case $CHOICE in
        1) add_payload ;;
        2)
            echo -e "${YELLOW}Enter target URL (e.g., http://example.com/search.php):${NC}"
            read -p "Target: " TARGET

            echo "Select injection type:"
            echo "1. HTML"
            echo "2. SQL"
            echo "3. XSS"
            read -p "Choice: " inj
            case $inj in
                1) scan_payloads "$HTML_PAY" "HTML" "$TARGET" ;;
                2) scan_payloads "$SQL_PAY" "SQL" "$TARGET" ;;
                3) scan_payloads "$XSS_PAY" "XSS" "$TARGET" ;;
                *) echo -e "${RED}Invalid injection type!${NC}" ;;
            esac
            ;;
        3) remove_payloads ;;
        4) echo -e "${GREEN}Goodbye!${NC}"; break ;;
        *) echo -e "${RED}Invalid choice. Try again.${NC}" ;;
    esac
done
