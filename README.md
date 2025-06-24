🔍 Bash-Based Injection Scanner – Shell Script for HTML, SQL & XSS Testing
This repository contains a menu-driven shell script project developed as a cybersecurity tool to automate the testing of common web vulnerabilities: HTML Injection, SQL Injection, and Cross-Site Scripting (XSS) using customizable payloads.

🛡️ Project Overview
This tool simulates a basic vulnerability scanner built entirely in Bash, designed to:

Provide a hacker-style terminal interface

Allow dynamic payload management

Test user-specified targets for reflected injection flaws

Serve as a practical educational tool for web security learning

📚 Skills Practiced
Bash Scripting

Web Vulnerability Testing

Manual Injection Techniques

Payload Crafting & Testing

Interactive CLI Development

Linux Command-line Tools (curl, grep, etc.)

💉 Injection Types Covered
The script currently supports the following categories:

🔸 HTML Injection
Tests for reflected HTML elements like <b>, <marquee>, <script>, etc.

🔸 SQL Injection
Common SQLi payloads including ' OR '1'='1, '--, and logic-based attacks.

🔸 Cross-Site Scripting (XSS)
Tests for reflected XSS using <script>, <img onerror>, <svg onload>, etc.

🧰 Tool Capabilities
🧠 Menu-Driven Interface: Add/view/remove payloads and inject with ease

🟢 Hacker-style ASCII UI with green/red indicators

💾 Persistent Payload Files in payloads/ directory

🧪 Automatic Reflection Check to confirm injection success

❌ Reset Option to clear all custom payloads

✨ No dependencies beyond bash, curl, and grep

📁 Repository Structure
bash
Copy
Edit
injection-scanner/
├── scanner.sh          # Main shell script
└── payloads/
    ├── html.txt        # HTML payloads
    ├── sql.txt         # SQL payloads
    └── xss.txt         # XSS payloads
🛠️ Tools & Technologies Used
🐚 Bash Scripting

📡 curl for HTTP requests

🔎 grep for reflection checking

📁 File-based payload handling

🚀 How to Use
bash
Copy
Edit
git clone https://github.com/yourusername/injection-scanner
cd injection-scanner
chmod +x scanner.sh
./scanner.sh
Then, follow the on-screen menu to:

Add custom payloads

Enter a target URL (e.g., http://example.com/search.php)

Select the injection type to scan

View PASS/FAIL results

📄 Disclaimer
This tool is created strictly for educational and ethical testing purposes.
Do not use it against websites or systems without explicit permission.
The author is not responsible for any misuse of this script.
