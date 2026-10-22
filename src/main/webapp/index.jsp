<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · Premium Store</title>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <style>
    /* ===== RESET ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'Plus Jakarta Sans', system-ui, sans-serif;
      background: #08080c;
      color: #f4f4f8;
      line-height: 1.55;
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }
    a { text-decoration: none; color: inherit; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }
    ul { list-style: none; }
    img { display: block; max-width: 100%; }

    :root {
      --bg: #08080c;
      --bg-2: #0e0e14;
      --card: #13131b;
      --card-2: #1a1a24;
      --border: rgba(255,255,255,0.06);
      --border-2: rgba(255,255,255,0.1);
      --ink: #f4f4f8;
      --muted: #8888a0;
      --muted-2: #5a5a70;
      --lime: #d4ff3f;
      --lime-dim: rgba(212,255,63,0.12);
      --violet: #8b5cf6;
      --pink: #ec4899;
      --cyan: #22d3ee;
      --radius: 22px;
      --container: 1320px;
      --transition: 0.25s cubic-bezier(0.4,0,0.2,1);
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 32px; }

    /* ===== ANNOUNCEMENT ===== */
    .topbar {
      background: var(--lime);
      color: #08080c;
      text-align: center;
      padding: 9px 16px;
      font-size: 12.5px;
      font-weight: 700;
      letter-spacing: 0.3px;
      display: flex; align-items: center; justify-content: center; gap: 10px;
    }
    .topbar i { font-size: 12px; }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(8,8,12,0.78);
      backdrop-filter: blur(24px) saturate(180%);
      border-bottom: 1px solid var(--border);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 28px;
      padding: 18px 0; min-height: 80px;
    }
    .brand {
      display: flex; align-items: center; gap: 10px;
      font-weight: 800; font-size: 24px; letter-spacing: -1px;
      flex-shrink: 0;
    }
    .brand-mark {
      width: 34px; height: 34px;
      border-radius: 10px;
      background: linear-gradient(135deg, var(--lime), #a8e000);
      display: grid; place-items: center;
      color: #08080c; font-size: 15px;
      box-shadow: 0 0 20px rgba(212,255,63,0.35);
    }
    .brand span { color: var(--lime); }

    nav.main-nav ul { display: flex; gap: 4px; align-items: center; }
    nav.main-nav li a {
      padding: 9px 18px; border-radius: 40px;
      font-weight: 500; font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      color: var(--ink); background: var(--card);
    }

    .header-actions { display: flex; align-items: center; gap: 8px; flex-shrink: 0; }
    .icon-btn {
      width: 44px; height: 44px; border-radius: 12px;
      display: grid; place-items: center;
      font-size: 16px; color: var(--muted);
      transition: var(--transition); position: relative;
      border: 1px solid transparent;
    }
    .icon-btn:hover {
      color: var(--lime); background: var(--card);
      border-color: var(--border-2);
    }
    .cart-count {
      position: absolute; top: 2px; right: 2px;
      background: var(--lime); color: #08080c;
      font-size: 10px; font-weight: 800;
      min-width: 18px; height: 18px; padding: 0 4px;
      border-radius: 20px;
      display: grid; place-items: center;
      border: 2px solid var(--bg);
    }

    /* ===== HERO ===== */
    .hero {
      position: relative;
      padding: 72px 0 80px;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      top: -200px; left: 50%; transform: translateX(-50%);
      width: 900px; height: 900px;
      background: radial-gradient(circle, rgba(139,92,246,0.18), transparent 60%);
      pointer-events: none;
    }
    .hero::after {
      content: '';
      position: absolute;
      top: 100px; right: -100px;
      width: 500px; height: 500px;
      background: radial-gradient(circle, rgba(212,255,63,0.1), transparent 60%);
      pointer-events: none;
    }
    .hero-grid {
      position: relative;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 64px;
      align-items: center;
      z-index: 1;
    }
    .hero-badge {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 7px 16px;
      background: var(--lime-dim);
      border: 1px solid rgba(212,255,63,0.3);
      border-radius: 40px;
      font-size: 12px; font-weight: 700;
      color: var(--lime);
      letter-spacing: 0.5px; text-transform: uppercase;
      margin-bottom: 28px;
    }
    .hero-badge .dot {
      width: 6px; height: 6px; border-radius: 50%;
      background: var(--lime);
      box-shadow: 0 0 10px var(--lime);
      animation: pulse 2s infinite;
    }
    @keyframes pulse { 0%,100% { opacity: 1; } 50% { opacity: 0.4; } }

    .hero h1 {
      font-family: 'Instrument Serif', serif;
      font-size: 76px; font-weight: 400;
      line-height: 0.98; letter-spacing: -2px;
      margin-bottom: 26px;
    }
    .hero h1 em {
      font-style: italic;
      background: linear-gradient(120deg, var(--lime) 0%, var(--cyan) 60%, var(--violet) 100%);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .hero p {
      font-size: 16px; color: var(--muted);
      max-width: 440px; margin-bottom: 36px; line-height: 1.7;
    }
    .hero .actions { display: flex; gap: 14px; flex-wrap: wrap; }

    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 15px 30px; border-radius: 40px;
      font-weight: 700; font-size: 14.5px;
      transition: var(--transition);
      border: 1.5px solid transparent;
      white-space: nowrap;
    }
    .btn-lime {
      background: var(--lime); color: #08080c;
      border-color: var(--lime);
      box-shadow: 0 8px 30px rgba(212,255,63,0.25);
    }
    .btn-lime:hover {
      transform: translateY(-2px);
      box-shadow: 0 14px 40px rgba(212,255,63,0.45);
    }
    .btn-outline {
      background: transparent; color: var(--ink);
      border-color: var(--border-2);
    }
    .btn-outline:hover {
      background: var(--card); border-color: var(--lime); color: var(--lime);
    }

    /* Hero visual */
    .hero-visual {
      position: relative;
      aspect-ratio: 1;
      display: grid;
      place-items: center;
    }
    .orbit {
      position: absolute;
      width: 100%; height: 100%;
      border-radius: 50%;
      border: 1px dashed rgba(255,255,255,0.08);
      animation: spin 40s linear infinite;
    }
    .orbit-2 {
      width: 78%; height: 78%;
      border: 1px solid rgba(255,255,255,0.05);
      animation: spin 30s linear infinite reverse;
    }
    @keyframes spin { to { transform: rotate(360deg); } }

    .glow-core {
      position: absolute;
      width: 60%; height: 60%;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(212,255,63,0.35), rgba(139,92,246,0.15) 50%, transparent 70%);
      filter: blur(40px);
      animation: glowPulse 4s ease-in-out infinite;
    }
    @keyframes glowPulse {
      0%,100% { transform: scale(1); opacity: 0.8; }
      50% { transform: scale(1.15); opacity: 1; }
    }

    .hero-card {
      position: relative;
      width: 72%;
      aspect-ratio: 3/4;
      border-radius: 32px;
      background: linear-gradient(155deg, #1c1c28 0%, #13131b 100%);
      border: 1px solid var(--border-2);
      box-shadow:
        0 60px 100px -30px rgba(0,0,0,0.8),
        inset 0 1px 0 rgba(255,255,255,0.08);
      display: flex;
      flex-direction: column;
      padding: 28px;
      transform: rotate(-5deg);
      z-index: 2;
      overflow: hidden;
    }
    .hero-card::before {
      content: '';
      position: absolute;
      top: -50%; right: -50%;
      width: 100%; height: 100%;
      background: radial-gradient(circle, rgba(212,255,63,0.12), transparent 70%);
    }
    .hero-card-top {
      display: flex; justify-content: space-between; align-items: center;
      position: relative; z-index: 1;
    }
    .card-brand {
      font-size: 11px; font-weight: 700;
      letter-spacing: 2px; color: var(--muted);
      text-transform: uppercase;
    }
    .card-dots { display: flex; gap: 4px; }
    .card-dots span {
      width: 6px; height: 6px; border-radius: 50%;
      background: var(--border-2);
    }
    .card-dots span:first-child { background: var(--lime); }
    .hero-icon {
      flex: 1;
      display: grid; place-items: center;
      font-size: 100px;
      color: var(--ink);
      position: relative; z-index: 1;
      filter: drop-shadow(0 10px 40px rgba(212,255,63,0.3));
    }
    .hero-card-bottom { position: relative; z-index: 1; }
    .card-label {
      font-size: 10px; font-weight: 600;
      letter-spacing: 1.5px; color: var(--muted);
      text-transform: uppercase; margin-bottom: 6px;
    }
    .card-title {
      font-family: 'Instrument Serif', serif;
      font-size: 26px; line-height: 1.1;
      margin-bottom: 14px;
    }
    .card-price-row {
      display: flex; justify-content: space-between; align-items: center;
      padding-top: 14px;
      border-top: 1px solid var(--border);
    }
    .card-price {
      font-size: 22px; font-weight: 800;
      color: var(--lime);
    }
    .card-cta {
      width: 38px; height: 38px; border-radius: 50%;
      background: var(--lime); color: #08080c;
      display: grid; place-items: center;
      font-size: 14px;
    }

    /* Floating chips */
    .float-stat {
      position: absolute;
      background: rgba(19,19,27,0.85);
      backdrop-filter: blur(16px);
      border: 1px solid var(--border-2);
      border-radius: 16px;
      padding: 12px 18px;
      display: flex; align-items: center; gap: 12px;
      z-index: 3;
      box-shadow: 0 20px 50px -10px rgba(0,0,0,0.6);
      animation: floatY 5s ease-in-out infinite;
    }
    .float-stat .fs-icon {
      width: 36px; height: 36px;
      border-radius: 10px;
      display: grid; place-items: center;
      font-size: 15px;
    }
    .float-stat .fs-num {
      font-size: 15px; font-weight: 800; line-height: 1.1;
    }
    .float-stat .fs-label {
      font-size: 11px; color: var(--muted);
    }
    .fs-1 { top: 6%; right: 0; animation-delay: 0s; }
    .fs-1 .fs-icon { background: var(--lime-dim); color: var(--lime); }
    .fs-2 { bottom: 14%; left: -4%; animation-delay: 1.2s; }
    .fs-2 .fs-icon { background: rgba(139,92,246,0.15); color: #a78bfa; }
    .fs-3 { top: 40%; left: -8%; animation-delay: 2.4s; }
    .fs-3 .fs-icon { background: rgba(236,72,153,0.15); color: var(--pink); }
    @keyframes floatY {
      0%,100% { transform: translateY(0); }
      50% { transform: translateY(-14px); }
    }

    /* ===== TRUST STRIP ===== */
    .trust {
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
      padding: 22px 0;
      background: var(--bg-2);
    }
    .trust-inner {
      display: flex; justify-content: space-between; gap: 32px;
      flex-wrap: wrap;
    }
    .trust-item {
      display: flex; align-items: center; gap: 10px;
      font-size: 13.5px; color: var(--muted);
      font-weight: 500;
    }
    .trust-item i { color: var(--lime); font-size: 15px; }

    /* ===== SECTION HEAD ===== */
    section.block { padding-top: 88px; }
    .section-head {
      display: flex; align-items: flex-end; justify-content: space-between;
      gap: 24px; margin-bottom: 40px; flex-wrap: wrap;
    }
    .eyebrow {
      font-size: 12px; font-weight: 700;
      letter-spacing: 1.5px; text-transform: uppercase;
      color: var(--lime); margin-bottom: 14px;
      display: flex; align-items: center; gap: 10px;
    }
    .eyebrow::before {
      content: ''; width: 28px; height: 2px; background: var(--lime); border-radius: 2px;
    }
    .section-head h2 {
      font-family: 'Instrument Serif', serif;
      font-size: 52px; font-weight: 400;
      letter-spacing: -1.5px; line-height: 1;
    }
    .view-all {
      font-size: 14px; font-weight: 600;
      color: var(--ink);
      display: inline-flex; align-items: center; gap: 8px;
      padding: 11px 22px;
      border: 1px solid var(--border-2);
      border-radius: 40px;
      transition: var(--transition);
    }
    .view-all:hover {
      border-color: var(--lime);
      color: var(--lime);
      gap: 12px;
    }

    /* ===== FILTERS ===== */
    .filters {
      display: flex; gap: 8px; flex-wrap: wrap;
      margin-bottom: 40px;
    }
    .filter-btn {
      padding: 10px 22px;
      border-radius: 40px;
      font-size: 13px; font-weight: 600;
      border: 1px solid var(--border);
      color: var(--muted);
      background: transparent;
      transition: var(--transition);
    }
    .filter-btn:hover { color: var(--ink); border-color: var(--border-2); }
    .filter-btn.active {
      background: var(--lime);
      color: #08080c;
      border-color: var(--lime);
      box-shadow: 0 4px 16px rgba(212,255,63,0.25);
    }

    /* ===== PRODUCT GRID ===== */
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
      gap: 24px;
    }
    .product-card {
      background: var(--card);
      border-radius: var(--radius);
      border: 1px solid var(--border);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      transition: var(--transition);
      position: relative;
    }
    .product-card:hover {
      transform: translateY(-6px);
      border-color: rgba(212,255,63,0.35);
      box-shadow:
        0 30px 60px -20px rgba(0,0,0,0.7),
        0 0 0 1px rgba(212,255,63,0.15);
    }
    .product-media {
      aspect-ratio: 1 / 0.92;
      position: relative;
      display: grid;
      place-items: center;
      overflow: hidden;
      background: var(--bg-2);
    }
    .product-media::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(circle at 50% 100%, var(--media-glow, rgba(212,255,63,0.2)), transparent 65%);
      opacity: 0.5;
      transition: var(--transition);
    }
    .product-card:hover .product-media::before { opacity: 1; }
    .product-media i {
      font-size: 78px;
      color: var(--ink);
      position: relative; z-index: 1;
      transition: transform 0.5s cubic-bezier(0.34,1.56,0.64,1);
      filter: drop-shadow(0 10px 30px rgba(0,0,0,0.4));
    }
    .product-card:hover .product-media i {
      transform: scale(1.12) rotate(-6deg);
      color: var(--lime);
    }

    /* unique media glows */
    .pm-1 { --media-glow: rgba(212,255,63,0.25); }
    .pm-2 { --media-glow: rgba(139,92,246,0.25); }
    .pm-3 { --media-glow: rgba(34,211,238,0.25); }
    .pm-4 { --media-glow: rgba(236,72,153,0.25); }
    .pm-5 { --media-glow: rgba(212,255,63,0.25); }
    .pm-6 { --media-glow: rgba(251,146,60,0.25); }
    .pm-7 { --media-glow: rgba(139,92,246,0.25); }
    .pm-8 { --media-glow: rgba(34,211,238,0.25); }
    .pm-9 { --media-glow: rgba(236,72,153,0.25); }
    .pm-10 { --media-glow: rgba(212,255,63,0.25); }

    .badge {
      position: absolute; top: 14px; left: 14px;
      font-size: 10px; font-weight: 800;
      letter-spacing: 0.8px; text-transform: uppercase;
      padding: 6px 12px; border-radius: 40px;
      z-index: 2;
    }
    .badge-sale { background: var(--pink); color: #fff; }
    .badge-new { background: var(--lime); color: #08080c; }
    .badge-hot { background: var(--cyan); color: #08080c; }
    .wish {
      position: absolute; top: 12px; right: 12px;
      width: 36px; height: 36px;
      border-radius: 50%;
      background: rgba(8,8,12,0.55);
      backdrop-filter: blur(8px);
      border: 1px solid var(--border-2);
      display: grid; place-items: center;
      color: var(--muted); font-size: 13px;
      z-index: 2;
      transition: var(--transition);
    }
    .wish:hover {
      color: var(--pink);
      border-color: var(--pink);
      background: rgba(236,72,153,0.15);
      transform: scale(1.1);
    }
    .product-info {
      padding: 20px 22px 22px;
      display: flex; flex-direction: column; flex: 1;
    }
    .product-cat {
      font-size: 10.5px; font-weight: 700;
      letter-spacing: 1.2px; text-transform: uppercase;
      color: var(--lime); margin-bottom: 8px;
    }
    .product-title {
      font-size: 16.5px; font-weight: 600;
      line-height: 1.3; margin-bottom: 8px;
      letter-spacing: -0.2px;
    }
    .product-desc {
      font-size: 13px; color: var(--muted);
      line-height: 1.55; margin-bottom: 18px; flex: 1;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-bottom {
      display: flex; align-items: center; justify-content: space-between;
      padding-top: 16px;
      border-top: 1px solid var(--border);
      gap: 12px;
    }
    .price-wrap { display: flex; align-items: baseline; gap: 8px; }
    .price {
      font-size: 22px; font-weight: 800;
      letter-spacing: -0.5px;
      color: var(--ink);
    }
    .price-old {
      font-size: 13px; color: var(--muted-2);
      text-decoration: line-through;
    }
    .add-btn {
      width: 40px; height: 40px;
      border-radius: 50%;
      background: var(--card-2);
      border: 1px solid var(--border-2);
      color: var(--ink);
      display: grid; place-items: center;
      font-size: 14px;
      transition: var(--transition);
      flex-shrink: 0;
    }
    .add-btn:hover {
      background: var(--lime);
      color: #08080c;
      border-color: var(--lime);
      transform: rotate(90deg);
      box-shadow: 0 0 20px rgba(212,255,63,0.4);
    }

    /* ===== FEATURE BANNER ===== */
    .feature-banner {
      margin-top: 96px;
      border-radius: 28px;
      overflow: hidden;
      background: linear-gradient(120deg, #13131b 0%, #1a1a28 50%, #13131b 100%);
      border: 1px solid var(--border-2);
      position: relative;
      padding: 64px 64px;
      display: flex; align-items: center; justify-content: space-between;
      gap: 40px; flex-wrap: wrap;
    }
    .feature-banner::before {
      content: '';
      position: absolute;
      top: -50%; left: -10%;
      width: 500px; height: 500px;
      background: radial-gradient(circle, rgba(139,92,246,0.25), transparent 65%);
      pointer-events: none;
    }
    .feature-banner::after {
      content: '';
      position: absolute;
      bottom: -50%; right: -10%;
      width: 500px; height: 500px;
      background: radial-gradient(circle, rgba(212,255,63,0.18), transparent 65%);
      pointer-events: none;
    }
    .feature-content { position: relative; z-index: 2; max-width: 560px; }
    .feature-content .tag {
      display: inline-flex; align-items: center; gap: 8px;
      padding: 7px 16px;
      background: rgba(236,72,153,0.12);
      border: 1px solid rgba(236,72,153,0.3);
      border-radius: 40px;
      font-size: 12px; font-weight: 700;
      color: var(--pink);
      letter-spacing: 0.5px; text-transform: uppercase;
      margin-bottom: 20px;
    }
    .feature-content h3 {
      font-family: 'Instrument Serif', serif;
      font-size: 52px; font-weight: 400;
      line-height: 1.02; letter-spacing: -1.5px;
      margin-bottom: 18px;
    }
    .feature-content h3 em {
      font-style: italic; color: var(--lime);
    }
    .feature-content p {
      color: var(--muted); font-size: 15px;
      line-height: 1.7; margin-bottom: 30px;
    }
    .feature-badge {
      position: relative; z-index: 2;
      width: 180px; height: 180px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--lime), #a8e000);
      display: grid; place-items: center;
      color: #08080c;
      font-weight: 800;
      text-align: center;
      box-shadow: 0 0 60px rgba(212,255,63,0.4);
      animation: floatY 6s ease-in-out infinite;
    }
    .feature-badge .fb-num {
      font-family: 'Instrument Serif', serif;
      font-size: 56px; line-height: 1;
      font-weight: 400;
    }
    .feature-badge .fb-label {
      font-size: 11px; font-weight: 700;
      letter-spacing: 1.5px; text-transform: uppercase;
    }

    /* ===== FOOTER ===== */
    footer {
      margin-top: 96px;
      border-top: 1px solid var(--border);
      padding: 64px 0 32px;
      background: var(--bg-2);
    }
    .footer-top {
      display: grid;
      grid-template-columns: 1.6fr 1fr 1fr 1.4fr;
      gap: 48px;
      margin-bottom: 56px;
    }
    .footer-brand .brand { margin-bottom: 20px; }
    .footer-brand p {
      font-size: 14px; color: var(--muted);
      max-width: 280px; line-height: 1.7;
    }
    .footer-col h4 {
      font-size: 12px; font-weight: 700;
      letter-spacing: 1.2px; text-transform: uppercase;
      color: var(--ink); margin-bottom: 20px;
    }
    .footer-col ul li { margin-bottom: 12px; }
    .footer-col ul li a {
      font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    .footer-col ul li a:hover { color: var(--lime); }
    .newsletter {
      display: flex; gap: 8px; margin-top: 16px;
    }
    .newsletter input {
      flex: 1;
      padding: 12px 16px;
      border-radius: 40px;
      border: 1px solid var(--border-2);
      background: var(--card);
      color: var(--ink);
      font-size: 13px;
      outline: none;
      transition: var(--transition);
    }
    .newsletter input::placeholder { color: var(--muted-2); }
    .newsletter input:focus { border-color: var(--lime); }
    .newsletter button {
      width: 44px; height: 44px;
      border-radius: 50%;
      background: var(--lime); color: #08080c;
      display: grid; place-items: center;
      font-size: 14px;
      transition: var(--transition);
      flex-shrink: 0;
    }
    .newsletter button:hover { transform: scale(1.08); }
    .footer-bottom {
      border-top: 1px solid var(--border);
      padding-top: 28px;
      display: flex; align-items: center; justify-content: space-between;
      flex-wrap: wrap; gap: 16px;
      font-size: 13px; color: var(--muted-2);
    }
    .footer-bottom .socials { display: flex; gap: 10px; }
    .footer-bottom .socials a {
      width: 38px; height: 38px;
      border-radius: 10px;
      border: 1px solid var(--border);
      display: grid; place-items: center;
      font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    .footer-bottom .socials a:hover {
      background: var(--lime); color: #08080c;
      border-color: var(--lime);
      transform: translateY(-3px);
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 1080px) {
      .hero-grid { grid-template-columns: 1fr; gap: 56px; }
      .hero-visual { max-width: 520px; margin: 0 auto; width: 100%; }
      .hero h1 { font-size: 64px; }
      .footer-top { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 860px) {
      .container { padding: 0 20px; }
      nav.main-nav { display: none; }
      .hero h1 { font-size: 52px; }
      .section-head h2 { font-size: 40px; }
      .feature-banner { padding: 44px 32px; }
      .feature-content h3 { font-size: 40px; }
      .feature-badge { width: 140px; height: 140px; }
      .feature-badge .fb-num { font-size: 44px; }
      .product-grid { grid-template-columns: repeat(auto-fill, minmax(210px, 1fr)); gap: 16px; }
      .trust-inner { justify-content: center; }
    }
    @media (max-width: 560px) {
      .hero { padding: 44px 0 56px; }
      .hero h1 { font-size: 42px; letter-spacing: -1.5px; }
      .hero p { font-size: 15px; }
      .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
      .product-media i { font-size: 48px; }
      .product-info { padding: 14px 14px 16px; }
      .product-title { font-size: 14px; }
      .product-desc { display: none; }
      .price { font-size: 17px; }
      .add-btn { width: 34px; height: 34px; font-size: 12px; }
      .section-head h2 { font-size: 30px; }
      .feature-banner { padding: 36px 24px; }
      .feature-content h3 { font-size: 30px; }
      .feature-badge { display: none; }
      .footer-top { grid-template-columns: 1fr; gap: 32px; }
      .footer-bottom { flex-direction: column; text-align: center; }
      .hero-visual { max-width: 340px; }
      .float-stat { padding: 9px 13px; }
      .float-stat .fs-num { font-size: 13px; }
      .float-stat .fs-label { font-size: 10px; }
      .fs-2, .fs-3 { display: none; }
    }
  </style>
</head>
<body>

<!-- Announcement -->
<div class="topbar">
  <i class="fas fa-bolt"></i>
  SPRING DROP — Free express shipping on orders over $75
</div>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a class="brand" href="#">
      <span class="brand-mark"><i class="fas fa-cube"></i></span>
      Nexus<span>.</span>
    </a>

    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active">Shop</a></li>
        <li><a href="#products">New In</a></li>
        <li><a href="#feature">Collection</a
