# Security Policy

AI-Native OS is unusual, so it has two kinds of issue worth reporting. The first is an ordinary
code or script vulnerability: a problem in `install.sh`, in a workflow, or in anything else that
executes on your machine. The second is a safety issue in the content itself: a skill, a prompt,
a masterfile, or an example that could lead an agent to an unsafe or harmful action. Both matter.
The repo's own stance is human-on-the-loop, so content that nudges an agent past a human checkpoint
in a sensitive domain (health, food safety, finance, anything irreversible) is a security concern
here, not just a typo.

## How to report privately

Do not open a public issue for a security or safety problem. Use one of these private channels:

- **GitHub private security advisory** on the repo: open the **Security** tab at
  https://github.com/impactbrussels/AINativeOS and choose **Report a vulnerability**. This keeps the
  report private to the maintainer until a fix ships.
- **Direct contact** via https://impact.brussels if you cannot use GitHub.

## What to include

The more concrete the report, the faster the fix:

- Which file or skill is affected, and the exact path.
- For code: the version or commit, your platform, and the steps to reproduce.
- For content safety: the prompt or skill text at issue, the unsafe action it could produce, and
  the domain where it matters.
- The impact as you see it, and a suggested fix if you have one.

Please do not include real secrets, personal data, or live credentials in a report.

## What to expect

- An acknowledgement within five working days.
- An initial assessment, with a severity call, within fifteen working days.
- For confirmed issues, a fix or a documented mitigation, with credit to you if you want it.

This is a small open project run by Impact Brussels ASBL, not a vendor with a 24/7 desk. The
timelines above are honest targets, not a contractual SLA.

## Supported versions

Security and safety fixes land on the current `0.2.x` line.

| Version | Supported          |
| ------- | ------------------ |
| 0.2.x   | Yes                |
| 0.1.x   | No                 |
| < 0.1   | No                 |
