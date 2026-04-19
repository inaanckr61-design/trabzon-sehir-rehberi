from pathlib import Path
import subprocess
import sys

import markdown


def find_browser() -> Path | None:
    candidates = [
        Path(r"C:\Program Files\Google\Chrome\Application\chrome.exe"),
        Path(r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"),
        Path(r"C:\Program Files\Microsoft\Edge\Application\msedge.exe"),
        Path(r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"),
    ]
    for candidate in candidates:
        if candidate.exists():
            return candidate
    return None


def main() -> int:
    root = Path(__file__).resolve().parent
    md_path = root / "INANC_KARA_RAPOR.md"
    html_path = root / "INANC_KARA_RAPOR.html"
    pdf_path = root / "inanc_kara.pdf"

    if not md_path.exists():
        print(f"Rapor bulunamadi: {md_path}")
        return 1

    body = markdown.markdown(
        md_path.read_text(encoding="utf-8"),
        extensions=["fenced_code", "tables", "nl2br"],
    )

    html = f"""<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Inanc Kara Rapor</title>
  <style>
    body {{
      font-family: "Segoe UI", Arial, sans-serif;
      line-height: 1.5;
      color: #111;
      max-width: 920px;
      margin: 32px auto;
      padding: 0 20px;
    }}
    h1, h2, h3 {{ color: #222; }}
    pre code {{
      display: block;
      background: #f4f4f4;
      border-radius: 6px;
      padding: 10px 12px;
      overflow-x: auto;
    }}
    code {{
      background: #f4f4f4;
      border-radius: 4px;
      padding: 2px 5px;
    }}
    ul, ol {{ margin-top: 6px; }}
    hr {{ margin: 24px 0; }}
  </style>
</head>
<body>
{body}
</body>
</html>
"""

    html_path.write_text(html, encoding="utf-8")

    browser = find_browser()
    if browser is None:
        print("Chrome/Edge bulunamadi. PDF olusturulamadi.")
        return 1

    try:
        subprocess.run(
            [
                str(browser),
                "--headless",
                "--disable-gpu",
                "--no-pdf-header-footer",
                f"--print-to-pdf={pdf_path}",
                html_path.resolve().as_uri(),
            ],
            check=True,
            capture_output=True,
            text=True,
        )
    except subprocess.CalledProcessError as exc:
        print("PDF olusturma hatasi:")
        print(exc.stderr or exc.stdout)
        return 1

    print(f"PDF olusturuldu: {pdf_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
