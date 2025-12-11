# EFT-Suite

Local-only Raspberry Pi web app to create, view, and print EFT fingerprint files
following the ANSI/NIST-ITL 1-2011 (NIST SP 500-290e3) format for FBI/ATF-style
submissions.

> ⚠️ **Disclaimer**  
> This project is a technical scaffold. You are responsible for validating any
> generated EFT files against official FBI/ATF specifications, EBTS field
> definitions, and NIST conformance tools before production use.

## Features

- Web interface available at `http://<raspberry-pi-ip>/`
- A. Create EFT fingerprint file via step-by-step wizard:
  - Questionnaire for identity and agency data
  - Upload scanned fingerprint card (JPG ≥ 300dpi recommended)
  - Upload head-and-shoulders photo (optional for future Type-10 use)
  - Guided cropping of rolled and flat finger impressions from the card
  - WSQ conversion using NBIS `cwsq` tool (once configured)
  - Build a single EFT file with Type-1, Type-2, and Type-14 records
- B. Examine/View existing EFT files (parse and display text fields)
- C. Generate printable fingerprint card PDFs from base templates:
  - FD258, FD1164, SF87, FD249, FD884, FD884a (you provide the base PDFs)

## Install on Raspberry Pi

```bash
git clone https://github.com/<your-user>/EFT-Suite.git
cd EFT-Suite
chmod +x scripts/*.sh
./scripts/install_all.sh
source .venv/bin/activate
scripts/run_server.sh
