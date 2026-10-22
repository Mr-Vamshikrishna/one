<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · Modern Store</title>
  <!-- Fonts & Icons -->
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:opsz,wght@9..40,400;9..40,500;9..40,600;9..40,700&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <style>
    /* ===== RESET & BASE ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      background: #0a0a0f;
      color: #f0f0f5;
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }
    a { text-decoration: none; color: inherit; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }
    ul { list-style: none; }

    :root {
      --bg: #0a0a0f;
      --bg-2: #111118;
      --card: #16161f;
      --card-2: #1c1c28;
      --border: rgba(255,255,255,0.07);
      --border-2: rgba(255,255,255,0.12);
      --primary: #f0f0f5;
      --accent: #6c5ce7;
      --accent-2: #a29bfe;
      --accent-glow: rgba(108,92,231,0.35);
      --muted: #8b8b9e;
      --muted-2: #5f5f70;
      --pink: #fd79a8;
      --green: #00d68f;
      --orange: #ff9f43;
      --radius: 24px;
      --radius-md: 16px;
      --radius-sm: 12px;
      --container: 1320px;
      --transition: 0.3s cubic-bezier(0.4,0,0.2,1);
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 32px; }

    /* ===== TOP ANNOUNCEMENT BAR ===== */
    .announce {
      background: linear-gradient(90deg, #6c5ce7, #a29bfe, #fd79a8, #6c5ce7);
      background-size: 300% 100%;
      animation: gradientMove 6s linear infinite;
      text-align: center;
      padding: 9px 16px;
      font-size: 13px;
      font-weight: 500;
      letter-spacing: 0.3px;
      color: #fff;
    }
    @keyframes gradientMove {
      0% { background-position: 0% 50%; }
      100% { background-position: 300% 50%; }
    }
    .announce i { margin-right: 8px; }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(10,10,15,0.85);
      backdrop-filter: blur(20px) saturate(180%);
      border-bottom: 1px solid var(--border);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 24px;
      padding: 16px 0; min-height: 76px;
    }
    .brand {
      display: flex; align-items: center; gap: 12px;
      font-family: 'Syne', sans-serif;
      font-weight: 800; font-size: 26px; letter-spacing: -0.5px;
      color: var(--primary);
      flex-shrink: 0;
    }
    .brand-mark {
      width: 40px; height: 40px;
      border-radius: 12px;
      background: linear-gradient(135deg, #6c5ce7, #a29bfe);
      display: grid; place-items: center;
      color: #fff; font-size: 18px;
      box-shadow: 0 4px 20px var(--accent-glow);
    }

    /* Search bar */
    .search-bar {
      flex: 1; max-width: 480px;
      display: flex; align-items: center; gap: 10px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 50px;
      padding: 10px 8px 10px 20px;
      transition: var(--transition);
    }
    .search-bar:focus-within {
      border-color: var(--accent);
      box-shadow: 0 0 0 4px rgba(108,92,231,0.15);
    }
    .search-bar i { color: var(--muted); font-size: 15px; }
    .search-bar input {
      flex: 1; background: none; border: none; outline: none;
      color: var(--primary); font-size: 14px;
    }
    .search-bar input::placeholder { color: var(--muted-2); }
    .search-bar .search-go {
      background: var(--accent); color: #fff;
      width: 36px; height: 36px; border-radius: 50%;
      display: grid; place-items: center; font-size: 13px;
      transition: var(--transition);
      flex-shrink: 0;
    }
    .search-bar .search-go:hover { background: var(--accent-2); transform: scale(1.05); }

    nav.main-nav ul {
      display: flex; gap: 4px; align-items: center;
    }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 7px;
      padding: 9px 16px; border-radius: 40px;
      font-weight: 500; font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      color: var(--primary);
      background: var(--card);
    }
    nav.main-nav li a.active { color: var(--accent-2); }

    .header-actions { display: flex; align-items: center; gap: 6px; flex-shrink: 0; }
    .header-actions .icon-btn {
      width: 44px; height: 44px; display: grid; place-items: center;
      border-radius: 12px; font-size: 17px; color: var(--muted);
      transition: var(--transition); position: relative;
      background: var(--card);
      border: 1px solid var(--border);
    }
    .header-actions .icon-btn:hover {
      background: var(--card-2); color: var(--accent-2);
      border-color: var(--border-2);
    }
    .cart-count {
      position: absolute; top: -6px; right: -6px;
      background: var(--pink); color: #fff;
      font-size: 10px; font-weight: 700;
      min-width: 19px; height: 19px; padding: 0 5px;
      border-radius: 20px;
      display: grid; place-items: center;
      border: 2px solid var(--bg);
    }

    /* ===== HERO ===== */
    .hero {
      position: relative;
      margin: 28px 32px 0;
      border-radius: 32px;
      overflow: hidden;
      background: radial-gradient(ellipse at 20% 20%, #2a1f5c 0%, #131320 45%, #0a0a0f 100%);
      border: 1px solid var(--border);
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      align-items: center;
      min-height: 420px;
    }
    .hero::before {
      content: '';
      position: absolute; inset: 0;
      background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.025'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
      pointer-events: none;
    }
    .hero-content {
      padding: 56px 24px 56px 56px;
      position: relative; z-index: 2;
    }
    .hero-tag {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(108,92,231,0.15);
      border: 1px solid rgba(108,92,231,0.3);
      color: var(--accent-2);
      padding: 7px 16px; border-radius: 40px;
      font-size: 12px; font-weight: 600;
      letter-spacing: 0.5px; text-transform: uppercase;
      margin-bottom: 22px;
    }
    .hero-tag .dot {
      width: 6px; height: 6px; border-radius: 50%;
      background: var(--green);
      box-shadow: 0 0 8px var(--green);
      animation: pulse 2s infinite;
    }
    @keyframes pulse {
      0%,100% { opacity: 1; }
      50% { opacity: 0.4; }
    }
    .hero h1 {
      font-family: 'Syne', sans-serif;
      font-size: 54px; font-weight: 800;
      line-height: 1.05; letter-spacing: -1.5px;
      margin-bottom: 20px;
    }
    .hero h1 .gradient {
      background: linear-gradient(135deg, #a29bfe, #fd79a8, #ff9f43);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .hero p {
      color: var(--muted); font-size: 16px;
      max-width: 440px; margin-bottom: 32px; line-height: 1.7;
    }
    .hero .actions { display: flex; gap: 14px; flex-wrap: wrap; }

    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 15px 32px; border-radius: 50px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
      white-space: nowrap;
    }
    .btn-primary {
      background: linear-gradient(135deg, #6c5ce7, #8b7cf6);
      color: #fff; border-color: transparent;
      box-shadow: 0 8px 24px rgba(108,92,231,0.35);
    }
    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 32px rgba(108,92,231,0.5);
    }
    .btn-ghost {
      background: rgba(255,255,255,0.04);
      color: var(--primary);
      border-color: var(--border-2);
      backdrop-filter: blur(10px);
    }
    .btn-ghost:hover {
      background: rgba(255,255,255,0.08);
      border-color: var(--accent);
    }

    /* Hero visual */
    .hero-visual {
      position: relative; height: 100%;
      display: flex; align-items: center; justify-content: center;
      padding: 40px;
    }
    .hero-orbit {
      width: 280px; height: 280px;
      border-radius: 50%;
      background: conic-gradient(from 0deg, #6c5ce7, #fd79a8, #ff9f43, #00d68f, #6c5ce7);
      filter: blur(1px);
      opacity: 0.9;
      position: relative;
      animation: spin 20s linear infinite;
      box-shadow: 0 0 80px rgba(108,92,231,0.4);
    }
    @keyframes spin { to { transform: rotate(360deg); } }
    .hero-orbit::before {
      content: '';
      position: absolute; inset: 22px;
      border-radius: 50%;
      background: #131320;
    }
    .hero-orbit-inner {
      position: absolute; inset: 0;
      display: grid; place-items: center;
      z-index: 2;
    }
    .hero-icon-big {
      width: 120px; height: 120px;
      border-radius: 32px;
      background: linear-gradient(135deg, #1c1c28, #16161f);
      border: 1px solid var(--border-2);
      display: grid; place-items: center;
      font-size: 48px;
      color: var(--accent-2);
      box-shadow: 0 20px 60px rgba(0,0,0,0.5);
    }
    .float-chip {
      position: absolute;
      background: rgba(22,22,31,0.9);
      backdrop-filter: blur(12px);
      border: 1px solid var(--border-2);
      border-radius: 14px;
      padding: 10px 16px;
      font-size: 12px; font-weight: 600;
      display: flex; align-items: center; gap: 8px;
      animation: float 4s ease-in-out infinite;
      z-index: 3;
      box-shadow: 0 8px 24px rgba(0,0,0,0.4);
    }
    .float-chip i { font-size: 14px; }
    .chip-1 { top: 12%; right: 8%; animation-delay: 0s; color: var(--green); }
    .chip-2 { bottom: 16%; left: 4%; animation-delay: 1.5s; color: var(--orange); }
    .chip-3 { top: 42%; left: 0%; animation-delay: 0.8s; color: var(--pink); }
    @keyframes float {
      0%,100% { transform: translateY(0); }
      50% { transform: translateY(-12px); }
    }

    /* ===== STATS BAR ===== */
    .stats-bar {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin: 28px 32px 0;
    }
    .stat-item {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      padding: 20px 24px;
      display: flex; align-items: center; gap: 16px;
      transition: var(--transition);
    }
    .stat-item:hover { border-color: var(--border-2); background: var(--card-2); }
    .stat-icon {
      width: 44px; height: 44px; border-radius: 12px;
      display: grid; place-items: center;
      font-size: 18px; flex-shrink: 0;
    }
    .stat-icon.purple { background: rgba(108,92,231,0.15); color: var(--accent-2); }
    .stat-icon.pink { background: rgba(253,121,168,0.15); color: var(--pink); }
    .stat-icon.green { background: rgba(0,214,143,0.15); color: var(--green); }
    .stat-icon.orange { background: rgba(255,159,67,0.15); color: var(--orange); }
    .stat-text .num {
      font-family: 'Syne', sans-serif;
      font-weight: 700; font-size: 20px; line-height: 1.1;
    }
    .stat-text .label { font-size: 12px; color: var(--muted); margin-top: 2px; }

    /* ===== SECTION ===== */
    section { padding-top: 64px; }
    .section-head {
      display: flex; align-items: flex-end; justify-content: space-between;
      margin-bottom: 32px; gap: 20px; flex-wrap: wrap;
    }
    .section-head .eyebrow {
      color: var(--accent-2); font-size: 13px; font-weight: 600;
      letter-spacing: 1.5px; text-transform: uppercase;
      margin-bottom: 8px; display: flex; align-items: center; gap: 8px;
    }
    .section-head .eyebrow::before {
      content: ''; width: 24px; height: 2px; background: var(--accent-2); border-radius: 2px;
    }
    .section-head h2 {
      font-family: 'Syne', sans-serif;
      font-size: 34px; font-weight: 700; letter-spacing: -0.5px;
    }
    .view-all {
      display: inline-flex; align-items: center; gap: 8px;
      color: var(--accent-2); font-weight: 600; font-size: 14px;
      padding: 10px 20px; border-radius: 40px;
      border: 1px solid var(--border-2);
      transition: var(--transition);
    }
    .view-all:hover {
      background: rgba(108,92,231,0.1);
      border-color: var(--accent);
      gap: 12px;
    }

    /* ===== CATEGORY PILLS ===== */
    .cat-row {
      display: flex; gap: 12px; flex-wrap: wrap;
      margin-bottom: 36px;
    }
    .cat-pill {
      display: flex; align-items: center; gap: 9px;
      padding: 11px 22px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 50px;
      font-size: 14px; font-weight: 500;
      color: var(--muted);
      transition: var(--transition);
    }
    .cat-pill i { font-size: 14px; }
    .cat-pill:hover {
      color: var(--primary);
      border-color: var(--accent);
      background: var(--card-2);
      transform: translateY(-2px);
    }
    .cat-pill.active {
      background: linear-gradient(135deg, #6c5ce7, #8b7cf6);
      color: #fff;
      border-color: transparent;
      box-shadow: 0 6px 20px rgba(108,92,231,0.35);
    }

    /* ===== PRODUCT GRID ===== */
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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
      border-color: rgba(108,92,231,0.4);
      box-shadow: 0 20px 40px rgba(0,0,0,0.4), 0 0 0 1px rgba(108,92,231,0.2);
    }
    .product-media {
      height: 200px;
      position: relative;
      display: grid;
      place-items: center;
      overflow: hidden;
      background: linear-gradient(145deg, #1c1c28, #131320);
    }
    .product-media::after {
      content: '';
      position: absolute; inset: 0;
      background: radial-gradient(circle at 50% 120%, rgba(108,92,231,0.25), transparent 60%);
      opacity: 0;
      transition: var(--transition);
    }
    .product-card:hover .product-media::after { opacity: 1; }
    .product-media i {
      font-size: 62px;
      color: rgba(255,255,255,0.85);
      transition: var(--transition);
      z-index: 1;
    }
    .product-card:hover .product-media i {
      transform: scale(1.12) rotate(-4deg);
      color: var(--accent-2);
    }
    .badge {
      position: absolute; top: 14px; left: 14px;
      font-size: 11px; font-weight: 700;
      padding: 5px 13px; border-radius: 40px;
      text-transform: uppercase; letter-spacing: 0.5px;
      z-index: 2;
      backdrop-filter: blur(8px);
    }
    .badge.sale { background: rgba(253,121,168,0.9); color: #fff; }
    .badge.new { background: rgba(0,214,143,0.9); color: #0a0a0f; }
    .badge.hot { background: rgba(255,159,67,0.9); color: #0a0a0f; }
    .wish-btn {
      position: absolute; top: 14px; right: 14px;
      width: 36px; height: 36px; border-radius: 50%;
      background: rgba(10,10,15,0.5);
      backdrop-filter: blur(8px);
      border: 1px solid var(--border-2);
      display: grid; place-items: center;
      color: var(--muted); font-size: 14px;
      transition: var(--transition);
      z-index: 2;
    }
    .wish-btn:hover {
      color: var(--pink);
      border-color: var(--pink);
      background: rgba(253,121,168,0.15);
      transform: scale(1.1);
    }
    .product-body {
      padding: 20px;
      display: flex; flex-direction: column; flex: 1;
    }
    .product-cat {
      font-size: 11px; font-weight: 600; color: var(--accent-2);
      text-transform: uppercase; letter-spacing: 1px;
      margin-bottom: 8px;
    }
    .product-name {
      font-weight: 600; font-size: 16px; line-height: 1.35;
      margin-bottom: 6px;
    }
    .product-desc {
      font-size: 13px; color: var(--muted);
      margin-bottom: 18px; flex: 1;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-foot {
      display: flex; align-items: center; justify-content: space-between;
      gap: 12px; padding-top: 16px;
      border-top: 1px solid var(--border);
    }
    .price {
      font-family: 'Syne', sans-serif;
      font-weight: 700; font-size: 21px;
      display: flex; align-items: baseline; gap: 8px;
    }
    .price .old {
      font-family: 'DM Sans', sans-serif;
      font-size: 13px; font-weight: 400;
      color: var(--muted-2);
      text-decoration: line-through;
    }
    .add-btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 7px;
      padding: 10px 18px; border-radius: 40px;
      background: rgba(108,92,231,0.12);
      border: 1px solid rgba(108,92,231,0.3);
      color: var(--accent-2);
      font-size: 13px; font-weight: 600;
      transition: var(--transition);
    }
    .add-btn:hover {
      background: var(--accent);
      color: #fff;
      border-color: var(--accent);
      box-shadow: 0 6px 18px rgba(108,92,231,0.4);
    }
    .add-btn i { font-size: 12px; }

    /* ===== PROMO BANNER ===== */
    .promo {
      margin-top: 64px;
      border-radius: 28px;
      padding: 48px 56px;
      background: linear-gradient(120deg, #1c1c28 0%, #221d3d 100%);
      border: 1px solid var(--border);
      display: flex; align-items: center; justify-content: space-between;
      gap: 32px; flex-wrap: wrap;
      position: relative; overflow: hidden;
    }
    .promo::before {
      content: '';
      position: absolute; right: -80px; top: -80px;
      width: 320px; height: 320px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(253,121,168,0.25), transparent 70%);
    }
    .promo::after {
      content: '';
      position: absolute; left: -60px; bottom: -60px;
      width: 240px; height: 240px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(108,92,231,0.25), transparent 70%);
    }
    .promo-content { position: relative; z-index: 2; max-width: 560px; }
    .promo-content .tag {
      color: var(--pink); font-weight: 700; font-size: 13px;
      letter-spacing: 1.5px; text-transform: uppercase;
      margin-bottom: 12px;
    }
    .promo-content h3 {
      font-family: 'Syne', sans-serif;
      font-size: 38px; font-weight: 800; line-height: 1.1;
      letter-spacing: -1px; margin-bottom: 14px;
    }
    .promo-content p {
      color: var(--muted); font-size: 15px; margin-bottom: 24px;
    }
    .promo .btn { position: relative; z-index: 2; }

    /* ===== FOOTER ===== */
    footer {
      margin-top: 80px;
      padding: 56px 0 32px;
      border-top: 1px solid var(--border);
      background: var(--bg-2);
    }
    .footer-grid {
      display: grid;
      grid-template-columns: 2fr 1fr 1fr 1fr;
      gap: 40px;
      margin-bottom: 48px;
    }
    .footer-brand .brand { margin-bottom: 16px; }
    .footer-brand p {
      color: var(--muted); font-size: 14px; max-width: 280px; line-height: 1.7;
    }
    .footer-social { display: flex; gap: 10px; margin-top: 20px; }
    .footer-social a {
      width: 38px; height: 38px; border-radius: 10px;
      background: var(--card); border: 1px solid var(--border);
      display: grid; place-items: center;
      color: var(--muted); font-size: 15px;
      transition: var(--transition);
    }
    .footer-social a:hover {
      background: var(--accent); color: #fff; border-color: var(--accent);
      transform: translateY(-3px);
    }
    .footer-col h4 {
      font-size: 14px; font-weight: 700; margin-bottom: 18px;
      color: var(--primary); letter-spacing: 0.3px;
    }
    .footer-col ul li { margin-bottom: 11px; }
    .footer-col ul li a {
      color: var(--muted); font-size: 14px;
      transition: var(--transition);
    }
    .footer-col ul li a:hover { color: var(--accent-2); padding-left: 4px; }
    .footer-bottom {
      padding-top: 28px;
      border-top: 1px solid var(--border);
      display: flex; align-items: center; justify-content: space-between;
      flex-wrap: wrap; gap: 16px;
      color: var(--muted-2); font-size: 13px;
    }
    .footer-bottom .pay-icons { display: flex; gap: 12px; font-size: 20px; color: var(--muted); }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 1100px) {
      .hero { grid-template-columns: 1fr; }
      .hero-visual { display: none; }
      .hero-content { padding: 48px 40px; }
      .stats-bar { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 900px) {
      .container { padding: 0 20px; }
      .search-bar { display: none; }
      nav.main-nav { display: none; }
      .hero { margin: 20px 20px 0; }
      .hero h1 { font-size: 38px; }
      .hero-content { padding: 40px 28px; }
      .stats-bar { margin: 20px 20px 0; }
      .product-grid { grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 16px; }
      .promo { padding: 36px 28px; }
      .promo-content h3 { font-size: 28px; }
      .footer-grid { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 560px) {
      .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
      .product-media { height: 150px; }
      .product-media i { font-size: 44px; }
      .product-body { padding: 14px; }
      .product-name { font-size: 14px; }
      .product-desc { display: none; }
      .product-foot { padding-top: 12px; }
      .price { font-size: 17px; }
      .add-btn { padding: 8px 12px; font-size: 12px; }
      .add-btn span { display: none; }
      .hero h1 { font-size: 30px; }
      .section-head h2 { font-size: 24px; }
      .stats-bar { grid-template-columns: 1fr; }
      .footer-grid { grid-template-columns: 1fr; gap: 28px; }
      .footer-bottom { flex-direction: column; text-align: center; }
    }
  </style>
</head>
<body>

<!-- Announcement -->
<div class="announce">
  <i class="fas fa-truck-fast"></i> Free express shipping on orders over $75 — limited time only
</div>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a class="brand" href="#">
      <span class="brand-mark"><i class="fas fa-cube"></i></span>
      Nexus
    </a>

    <div class="search-bar">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Search for products, brands..." aria-label="Search">
      <button class="search-go" aria-label="Search"><i class="fas fa-arrow-right"></i></button>
    </div>

    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active"><i class="fas fa-compass"></i> Explore</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#promo"><i class="fas fa-bolt"></i> Deals</a></li>
      </ul>
    </nav>

    <div class="header-actions">
      <button class="icon-btn" aria-label="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
      <button class="icon-btn" aria-label="Cart">
        <i class="fas fa-bag-shopping"></i>
        <span class="cart-count">3</span>
      </button>
    </div>
  </div>
</header>

<main>
  <!-- Hero -->
  <section class="hero" style="padding-top:0;">
    <div class="hero-content">
      <div class="hero-tag"><span class="dot"></span> New season · 2025 drop</div>
      <h1>Elevate your<br><span class="gradient">everyday carry.</span></h1>
      <p>Thoughtfully designed tech and lifestyle essentials. Built for the way you live, work, and play.</p>
      <div class="actions">
        <button class="btn btn-primary"><i class="fas fa-bag-shopping"></i> Shop the collection</button>
        <button class="btn btn-ghost"><i class="fas fa-play"></i> Watch the film</button>
      </div>
    </div>
    <div class="hero-visual">
      <div class="hero-orbit">
        <div class="hero-orbit-inner">
          <div class="hero-icon-big"><i class="fas fa-headphones-simple"></i></div>
        </div>
      </div>
      <div class="float-chip chip-1"><i class="fas fa-bolt"></i> Fast delivery</div>
      <div class="float-chip chip-2"><i class="fas fa-star"></i> 4.9 rating</div>
      <div class="float-chip chip-3"><i class="fas fa-shield-halved"></i> 2yr warranty</div>
    </div>
  </section>

  <!-- Stats -->
  <div class="stats-bar">
    <div class="stat-item">
      <div class="stat-icon purple"><i class="fas fa-box"></i></div>
      <div class="stat-text">
        <div class="num">12k+</div>
        <div class="label">Products in stock</div>
      </div>
    </div>
    <div class="stat-item">
      <div class="stat-icon pink"><i class="fas fa-users"></i
