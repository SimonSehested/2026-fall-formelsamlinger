import sys
import pypdf

def audit_pdf(pdf_path):
    print(f"=== Auditing PDF: {pdf_path} ===")
    reader = pypdf.PdfReader(pdf_path)
    total_pages = len(reader.pages)
    print(f"Total Pages: {total_pages}")
    
    # 1. Page Geometry & Layout Check
    a4_w_pt = 595.276
    a4_h_pt = 841.890
    geometry_issues = []
    char_counts = []
    
    for idx, page in enumerate(reader.pages):
        box = page.mediabox
        w = float(box.width)
        h = float(box.height)
        if abs(w - a4_w_pt) > 5 or abs(h - a4_h_pt) > 5:
            geometry_issues.append((idx + 1, w, h))
        
        text = page.extract_text() or ""
        char_counts.append(len(text))
        if len(text.strip()) < 50:
            print(f"WARNING: Page {idx+1} has very low character count: {len(text.strip())}")

    print(f"Geometry check: {'PASSED (all 67 pages A4 portrait)' if not geometry_issues else f'FAILED on pages {geometry_issues}'}")
    print(f"Avg characters per page: {sum(char_counts)/total_pages:.1f} (min: {min(char_counts)}, max: {max(char_counts)})")

    # 2. Outline / Bookmarks Check by Level
    def get_outline_tree(items, level=0):
        res = []
        for item in items:
            if isinstance(item, list):
                res.extend(get_outline_tree(item, level + 1))
            else:
                p_num = reader.get_destination_page_number(item) + 1
                res.append((level, item.title, p_num))
        return res

    tree = get_outline_tree(reader.outline)
    print(f"\nTotal Bookmarks Extracted: {len(tree)}")
    
    l0_sections = [(t, p) for lvl, t, p in tree if lvl == 0]
    print("\nTop-Level (L0) Sections & Starting Pages:")
    for t, p in l0_sections:
        print(f"  - {t}: Page {p}")

    expected_l0_order = [
        ("Symboloversigt", 3),
        ("Quick-Lookup", 7),
        ("Isolated DC/DC Converters", 9),
        ("AC-DC Converters", 22),
        ("DC-AC Converters", 36),
        ("Dynamic Modeling", 50),
        ("Foundational Cheat Sheet", 65),
    ]

    order_passed = True
    last_page = 0
    for exp_title, exp_p in expected_l0_order:
        matched = [(t, p) for t, p in l0_sections if exp_title.lower() in t.lower()]
        if not matched:
            print(f"ERROR: Expected top-level section matching '{exp_title}' not found!")
            order_passed = False
        else:
            t, p = matched[0]
            if p != exp_p:
                print(f"WARNING: Section '{t}' started at page {p}, expected page {exp_p}")
            if p < last_page:
                print(f"ERROR: Section '{t}' on page {p} is before previous section on page {last_page}!")
                order_passed = False
            last_page = p
    print(f"Top-Level Chapter Order & Monotonicity: {'PASSED' if order_passed else 'FAILED'}")

    # Check TOC pages (1 and 2)
    toc_p1 = reader.pages[0].extract_text()
    toc_p2 = reader.pages[1].extract_text()
    toc_text = toc_p1 + " " + toc_p2
    toc_check = all(s[0].split()[0] in toc_text for s in expected_l0_order)
    print(f"Table of Contents Content Check: {'PASSED' if toc_check else 'FAILED'}")

    # 3. Content & Keyword Audit
    full_text = " ".join((page.extract_text() or "") for page in reader.pages)
    keywords_to_check = [
        # Week 5 & 7
        ("Flyback", "Flyback converter"),
        ("Forward", "Forward converter"),
        ("commutation", "Commutation overlap"),
        ("PSFB", "Phase-Shifted Full-Bridge"),
        ("DAB", "Dual-Active-Bridge"),
        # Week 8
        ("rectifier", "AC-DC Rectifiers"),
        ("THD", "Total Harmonic Distortion"),
        ("displacement", "Displacement Power Factor"),
        ("PFC", "Power Factor Correction"),
        ("Boost PFC", "Active Boost PFC"),
        # Week 9
        ("inverter", "DC-AC Inverters"),
        ("SPWM", "Sinusoidal PWM"),
        ("overmodulation", "Overmodulation"),
        ("triplen", "Triplen Harmonics"),
        ("common-mode", "Common-Mode Voltage"),
        ("AC-AC", "AC-AC Regulators"),
        # Week 10
        ("state-space", "State-Space Averaging"),
        ("perturbation", "Small-Signal Perturbation"),
        ("transfer function", "Transfer Functions"),
        ("RHP", "Right-Half-Plane Zero"),
        # Weeks 1-4
        ("CCM", "Continuous Conduction Mode"),
        ("DCM", "Discontinuous Conduction Mode"),
        ("ZCS", "Zero Current Switching"),
        ("ZVS", "Zero Voltage Switching"),
    ]

    print("\nKeyword Verification:")
    missing_kw = []
    for kw, desc in keywords_to_check:
        count = full_text.count(kw)
        if count == 0:
            print(f"  [MISSING] {desc} ('{kw}')")
            missing_kw.append(kw)
        else:
            print(f"  [FOUND] {desc} ('{kw}'): {count} occurrences")
            
    if not missing_kw:
        print("\nAll required core technical concepts verified in compiled PDF.")
    else:
        print(f"\nWARNING: Missing keywords: {missing_kw}")

    return {
        "total_pages": total_pages,
        "geometry_ok": len(geometry_issues) == 0,
        "order_ok": order_passed,
        "toc_ok": toc_check,
        "missing_keywords": missing_kw
    }

if __name__ == "__main__":
    pdf_file = "Advanced Power Electronics/main_test2.pdf" if len(sys.argv) < 2 else sys.argv[1]
    res = audit_pdf(pdf_file)
    if res["geometry_ok"] and res["order_ok"] and res["toc_ok"] and not res["missing_keywords"]:
        print("\n>>> AUDIT RESULT: ALL CHECKS PASSED <<<")
        sys.exit(0)
    else:
        print("\n>>> AUDIT RESULT: CHECKS FAILED <<<")
        sys.exit(1)
