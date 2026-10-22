<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · Store</title>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <style>
    /* ===== RESET ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'Inter', system-ui, sans-serif;
      background: #faf9f6;
      color: #1a1a1a;
      line-height: 1.55;
      -webkit-font-smoothing: antialiased;
    }
    a { text-decoration: none; color: inherit; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }
    ul { list-style: none; }

    :root {
      --bg: #faf9f6;
      --bg-alt: #f2f0ea;
      --ink: #1a1a1a;
      --ink-soft: #4a4a4a;
      --muted: #8a8a8a;
      --line: #e5e2db;
      --line-soft: #eeebe4;
      --accent: #2d5a3d;
      --accent-soft: #e8f0ea;
      --terracotta: #c9633c;
      --radius: 16px;
      --radius-sm: 10px;
      --container: 1240px;
      --transition: 0.22s ease;
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 32px; }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(250,249,246,0.92);
      backdrop-filter: blur(14px);
      border-bottom: 1px solid var(--line);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 32px;
      padding: 18px 0; min-height: 76px;
    }
    .brand {
      font-family: 'Fraunces', serif;
      font-weight: 700; font-size: 28px; letter-spacing: -0.8px;
      display: flex; align-items: center; gap: 8px;
      color: var(--ink);
      flex-shrink: 0;
    }
    .brand .dot {
      width: 8px; height: 8px; border-radius: 50%;
      background: var(--terracotta);
      display: inline-block; margin-top: 6px;
    }

    nav.main-nav ul { display: flex; gap: 4px; align-items: center; }
    nav.main-nav li a {
      padding: 8px 16px; border-radius: 40px;
      font-weight: 500; font-size: 14px; color: var(--ink-soft);
      transition: var(--transition);
    }
    nav.main-nav li a:hover { color: var(--ink); background: var(--bg-alt); }
    nav.main-nav li a.active { color: var(--ink); font-weight: 600; }

    .header-actions { display: flex; align-items: center; gap: 4px; flex-shrink: 0; }
    .icon-btn {
      width: 42px; height: 42px; border-radius: 50%;
      display: grid; place-items: center;
      font-size: 17px; color: var(--ink-soft);
      transition: var(--transition); position: relative;
    }
    .icon-btn:hover { background: var(--bg-alt); color: var(--ink); }
    .cart-count {
      position: absolute; top: 4px; right: 4px;
      background: var(--terracotta); color: #fff;
      font-size: 10px; font-weight: 700;
      min-width: 17px; height: 17px; padding: 0 4px;
      border-radius: 20px;
      display: grid; place-items: center;
      border: 2px solid var(--bg);
    }

    /* ===== HERO ===== */
    .hero {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 60px;
      align-items: center;
      padding: 80px 0 60px;
    }
    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 10px;
      font-size: 12px; font-weight: 600;
      letter-spacing: 1.2px; text-transform: uppercase;
      color: var(--accent);
      margin-bottom: 24px;
    }
    .hero-eyebrow::before {
      content: ''; width: 32px; height: 1.5px; background: var(--accent);
    }
    .hero h1 {
      font-family: 'Fraunces', serif;
      font-size: 64px; font-weight: 500;
      line-height: 1.02; letter-spacing: -2px;
      margin-bottom: 24px;
    }
    .hero h1 em {
      font-style: italic; color: var(--terracotta);
    }
    .hero p {
      font-size: 17px; color: var(--ink-soft);
      max-width: 440px; margin-bottom: 36px; line-height: 1.7;
    }
    .hero .actions { display: flex; gap: 14px; flex-wrap: wrap; }

    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 15px 30px; border-radius: 40px;
      font-weight: 600; font-size: 15px;
      transition: var(--transition);
      border: 1.5px solid transparent;
      white-space: nowrap;
    }
    .btn-dark {
      background: var(--ink); color: var(--bg);
      border-color: var(--ink);
    }
    .btn-dark:hover { background: var(--accent); border-color: var(--accent); }
    .btn-ghost {
      background: transparent; color: var(--ink);
      border-color: var(--line);
    }
    .btn-ghost:hover { border-color: var(--ink); background: var(--bg-alt); }

    /* Hero visual */
    .hero-visual {
      position: relative;
      aspect-ratio: 1 / 1;
      border-radius: 24px;
      overflow: hidden;
      background: linear-gradient(160deg, #e8f0ea 0%, #f2f0ea 60%, #f5e8e2 100%);
      display: grid; place-items: center;
      border: 1px solid var(--line);
    }
    .hero-shape-1 {
      position: absolute;
      width: 70%; height: 70%;
      border-radius: 50%;
      background: radial-gradient(circle at 30% 30%, #ffffff, transparent 70%);
      top: 10%; left: 5%;
    }
    .hero-shape-2 {
      position: absolute;
      width: 50%; height: 50%;
      border-radius: 50%;
      background: var(--accent);
      opacity: 0.08;
      bottom: 8%; right: 8%;
    }
    .hero-product {
      position: relative; z-index: 2;
      width: 62%;
      aspect-ratio: 1;
      border-radius: 28px;
      background: linear-gradient(145deg, #ffffff, #f2f0ea);
      box-shadow: 0 40px 80px -20px rgba(26,26,26,0.18);
      display: grid; place-items: center;
      border: 1px solid rgba(255,255,255,0.6);
      transform: rotate(-6deg);
      animation: heroFloat 7s ease-in-out infinite;
    }
    .hero-product i {
      font-size: 110px;
      color: var(--accent);
    }
    .hero-tag {
      position: absolute;
      z-index: 3;
      background: var(--ink);
      color: var(--bg);
      padding: 10px 18px;
      border-radius: 40px;
      font-size: 12px; font-weight: 600;
      letter-spacing: 0.3px;
      box-shadow: 0 12px 30px -8px rgba(0,0,0,0.35);
    }
    .hero-tag.tag-1 { top: 8%; right: 4%; }
    .hero-tag.tag-2 { bottom: 12%; left: 4%; background: var(--terracotta); }
    @keyframes heroFloat {
      0%,100% { transform: rotate(-6deg) translateY(0); }
      50% { transform: rotate(-4deg) translateY(-14px); }
    }

    /* ===== MARQUEE / LOGO STRIP ===== */
    .strip {
      border-top: 1px solid var(--line);
      border-bottom: 1px solid var(--line);
      padding: 22px 0;
      overflow: hidden;
      background: var(--bg-alt);
    }
    .strip-track {
      display: flex; gap: 64px;
      animation: scroll 30s linear infinite;
      width: max-content;
    }
    .strip-item {
      display: flex; align-items: center; gap: 10px;
      color: var(--muted); font-size: 14px; font-weight: 500;
      white-space: nowrap;
    }
    .strip-item i { color: var(--accent); font-size: 16px; }
    @keyframes scroll {
      from { transform: translateX(0); }
      to { transform: translateX(-50%); }
    }

    /* ===== SECTION ===== */
    section.block { padding: 90px 0 0; }
    .section-head {
      display: flex; align-items: flex-end; justify-content: space-between;
      gap: 24px; margin-bottom: 44px; flex-wrap: wrap;
    }
    .section-head .eyebrow {
      font-size: 12px; font-weight: 600;
      letter-spacing: 1.2px; text-transform: uppercase;
      color: var(--accent); margin-bottom: 12px;
      display: flex; align-items: center; gap: 10px;
    }
    .section-head .eyebrow::before {
      content: ''; width: 24px; height: 1.5px; background: var(--accent);
    }
    .section-head h2 {
      font-family: 'Fraunces', serif;
      font-size: 44px; font-weight: 500;
      letter-spacing: -1.2px; line-height: 1.05;
    }
    .view-all {
      font-size: 14px; font-weight: 600;
      color: var(--ink);
      display: inline-flex; align-items: center; gap: 8px;
      padding: 8px 0;
      border-bottom: 1.5px solid var(--ink);
      transition: var(--transition);
    }
    .view-all:hover { gap: 14px; color: var(--accent); border-color: var(--accent); }

    /* ===== CATEGORY FILTER ===== */
    .filters {
      display: flex; gap: 8px; flex-wrap: wrap;
      margin-bottom: 40px;
    }
    .filter-btn {
      padding: 10px 22px;
      border-radius: 40px;
      font-size: 13px; font-weight: 500;
      border: 1px solid var(--line);
      color: var(--ink-soft);
      background: var(--bg);
      transition: var(--transition);
    }
    .filter-btn:hover { border-color: var(--ink); color: var(--ink); }
    .filter-btn.active {
      background: var(--ink);
      color: var(--bg);
      border-color: var(--ink);
    }

    /* ===== PRODUCT GRID ===== */
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
      gap: 28px;
    }
    .product-card {
      background: var(--bg);
      border-radius: var(--radius);
      border: 1px solid var(--line);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      transition: var(--transition);
      position: relative;
    }
    .product-card:hover {
      transform: translateY(-4px);
      border-color: #d5d1c8;
      box-shadow: 0 24px 48px -20px rgba(26,26,26,0.15);
    }
    .product-media {
      aspect-ratio: 1 / 1;
      position: relative;
      display: grid;
      place-items: center;
      overflow: hidden;
      border-bottom: 1px solid var(--line-soft);
    }
    .product-media i {
      font-size: 72px;
      color: var(--ink);
      transition: transform 0.5s ease;
      z-index: 1;
    }
    .product-card:hover .product-media i { transform: scale(1.08); }
    .m-bg-1 { background: linear-gradient(160deg, #e8f0ea, #f2f0ea); }
    .m-bg-2 { background: linear-gradient(160deg, #f5e8e2, #f2f0ea); }
    .m-bg-3 { background: linear-gradient(160deg, #e8eaf0, #f2f0ea); }
    .m-bg-4 { background: linear-gradient(160deg, #f2ece0, #f2f0ea); }
    .m-bg-5 { background: linear-gradient(160deg, #eae8f0, #f2f0ea); }
    .m-bg-6 { background: linear-gradient(160deg, #e0eef2, #f2f0ea); }
    .m-bg-7 { background: linear-gradient(160deg, #f0e8e8, #f2f0ea); }
    .m-bg-8 { background: linear-gradient(160deg, #e5f0e5, #f2f0ea); }
    .m-bg-9 { background: linear-gradient(160deg, #f0f0e0, #f2f0ea); }
    .m-bg-10 { background: linear-gradient(160deg, #f2e0ee, #f2f0ea); }

    .tag-pill {
      position: absolute; top: 16px; left: 16px;
      font-size: 10px; font-weight: 700;
      letter-spacing: 0.8px; text-transform: uppercase;
      padding: 6px 12px; border-radius: 40px;
      z-index: 2;
    }
    .tag-sale { background: var(--terracotta); color: #fff; }
    .tag-new { background: var(--ink); color: var(--bg); }
    .wish {
      position: absolute; top: 14px; right: 14px;
      width: 36px; height: 36px;
      border-radius: 50%;
      background: rgba(250,249,246,0.85);
      backdrop-filter: blur(6px);
      display: grid; place-items: center;
      color: var(--ink-soft); font-size: 14px;
      z-index: 2;
      transition: var(--transition);
      border: 1px solid var(--line-soft);
    }
    .wish:hover { color: var(--terracotta); transform: scale(1.08); }

    .product-info {
      padding: 22px 22px 24px;
      display: flex; flex-direction: column; flex: 1;
    }
    .product-cat {
      font-size: 11px; font-weight: 600;
      letter-spacing: 1px; text-transform: uppercase;
      color: var(--muted); margin-bottom: 8px;
    }
    .product-title {
      font-family: 'Fraunces', serif;
      font-size: 20px; font-weight: 500;
      line-height: 1.25; margin-bottom: 8px;
      letter-spacing: -0.3px;
    }
    .product-desc {
      font-size: 13px; color: var(--muted);
      line-height: 1.55; margin-bottom: 20px; flex: 1;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-bottom {
      display: flex; align-items: center; justify-content: space-between;
      padding-top: 18px;
      border-top: 1px solid var(--line-soft);
      gap: 12px;
    }
    .price-wrap { display: flex; align-items: baseline; gap: 8px; }
    .price {
      font-family: 'Fraunces', serif;
      font-size: 22px; font-weight: 600;
      letter-spacing: -0.5px;
    }
    .price-old {
      font-size: 13px; color: var(--muted);
      text-decoration: line-through;
    }
    .add-btn {
      width: 40px; height: 40px;
      border-radius: 50%;
      background: var(--ink);
      color: var(--bg);
      display: grid; place-items: center;
      font-size: 14px;
      transition: var(--transition);
      flex-shrink: 0;
    }
    .add-btn:hover { background: var(--accent); transform: rotate(90deg); }

    /* ===== PROMO / EDITORIAL ===== */
    .editorial {
      margin-top: 100px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      border-radius: 24px;
      overflow: hidden;
      border: 1px solid var(--line);
      background: var(--bg-alt);
    }
    .editorial-visual {
      background: linear-gradient(150deg, #2d5a3d 0%, #1a3a26 100%);
      position: relative;
      min-height: 400px;
      display: grid; place-items: center;
      overflow: hidden;
    }
    .editorial-visual::before {
      content: '';
      position: absolute;
      width: 120%; height: 120%;
      background: radial-gradient(circle at 30% 70%, rgba(255,255,255,0.1), transparent 60%);
    }
    .editorial-visual i {
      font-size: 160px;
      color: rgba(255,255,255,0.9);
      position: relative; z-index: 1;
    }
    .editorial-content {
      padding: 56px 56px;
      display: flex; flex-direction: column; justify-content: center;
    }
    .editorial-content .eyebrow {
      font-size: 12px; font-weight: 600;
      letter-spacing: 1.2px; text-transform: uppercase;
      color: var(--terracotta); margin-bottom: 16px;
    }
    .editorial-content h3 {
      font-family: 'Fraunces', serif;
      font-size: 40px; font-weight: 500;
      letter-spacing: -1px; line-height: 1.08;
      margin-bottom: 18px;
    }
    .editorial-content p {
      color: var(--ink-soft); font-size: 15px;
      line-height: 1.7; margin-bottom: 30px;
    }

    /* ===== FOOTER ===== */
    footer {
      margin-top: 100px;
      border-top: 1px solid var(--line);
      padding: 64px 0 32px;
    }
    .footer-top {
      display: grid;
      grid-template-columns: 1.6fr 1fr 1fr 1fr;
      gap: 48px;
      margin-bottom: 56px;
    }
    .footer-brand .brand { margin-bottom: 18px; }
    .footer-brand p {
      font-size: 14px; color: var(--muted);
      max-width: 280px; line-height: 1.7;
    }
    .footer-col h4 {
      font-size: 13px; font-weight: 700;
      letter-spacing: 0.5px; text-transform: uppercase;
      color: var(--ink); margin-bottom: 18px;
    }
    .footer-col ul li { margin-bottom: 12px; }
    .footer-col ul li a {
      font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    .footer-col ul li a:hover { color: var(--ink); }
    .newsletter {
      display: flex; gap: 8px; margin-top: 18px;
    }
    .newsletter input {
      flex: 1;
      padding: 12px 18px;
      border-radius: 40px;
      border: 1px solid var(--line);
      background: var(--bg);
      font-size: 13px;
      outline: none;
      transition: var(--transition);
    }
    .newsletter input:focus { border-color: var(--ink); }
    .newsletter button {
      width: 44px; height: 44px;
      border-radius: 50%;
      background: var(--ink); color: var(--bg);
      display: grid; place-items: center;
      font-size: 14px;
      transition: var(--transition);
      flex-shrink: 0;
    }
    .newsletter button:hover { background: var(--accent); }
    .footer-bottom {
      border-top: 1px solid var(--line);
      padding-top: 28px;
      display: flex; align-items: center; justify-content: space-between;
      flex-wrap: wrap; gap: 16px;
      font-size: 13px; color: var(--muted);
    }
    .footer-bottom .socials { display: flex; gap: 10px; }
    .footer-bottom .socials a {
      width: 36px; height: 36px;
      border-radius: 50%;
      border: 1px solid var(--line);
      display: grid; place-items: center;
      font-size: 13px; color: var(--ink-soft);
      transition: var(--transition);
    }
    .footer-bottom .socials a:hover {
      background: var(--ink); color: var(--bg); border-color: var(--ink);
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 1000px) {
      .hero { grid-template-columns: 1fr; gap: 40px; padding: 56px 0 40px; }
      .hero h1 { font-size: 52px; }
      .hero-visual { max-width: 480px; margin: 0 auto; width: 100%; }
      .editorial { grid-template-columns: 1fr; }
      .editorial-visual { min-height: 280px; }
      .footer-top { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 760px) {
      .container { padding: 0 20px; }
      nav.main-nav { display: none; }
      .section-head h2 { font-size: 32px; }
      .hero h1 { font-size: 42px; }
      .hero p { font-size: 15px; }
      .product-grid { grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 18px; }
      .editorial-content { padding: 40px 32px; }
      .editorial-content h3 { font-size: 30px; }
      section.block { padding-top: 64px; }
      footer { margin-top: 64px; }
    }
    @media (max-width: 520px) {
      .header-inner { gap: 12px; }
      .brand { font-size: 22px; }
      .hero h1 { font-size: 34px; letter-spacing: -1px; }
      .hero-product i { font-size: 70px; }
      .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
      .product-media i { font-size: 46px; }
      .product-info { padding: 16px; }
      .product-title { font-size: 16px; }
      .product-desc { display: none; }
      .price { font-size: 18px; }
      .add-btn { width: 34px; height: 34px; font-size: 12px; }
      .footer-top { grid-template-columns: 1fr; gap: 32px; }
      .strip-track { gap: 40px; }
    }
  </style>
</head>
<body>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a class="brand" href="#">
      Nexus<span class="dot"></span>
    </a>

    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active">Shop</a></li>
        <li><a href="#products">New In</a></li>
        <li><a href="#editorial">Journal</a></li>
        <li><a href="#footer">About</a></li>
      </ul>
    </nav>

    <div class="header-actions">
      <button class="icon-btn" aria-label="Search"><i class="fas fa-search"></i></button>
      <button class="icon-btn" aria-label="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn" aria-label="Cart">
        <i class="fas fa-shopping-bag"></i>
        <span class="cart-count">3</span>
      </button>
    </div>
  </div>
</header>

<main>
  <!-- Hero -->
  <section class="hero container">
    <div>
      <div class="hero-eyebrow">New Collection · Spring 2025</div>
      <h1>Objects for<br><em>mindful</em> living.</h1>
      <p>A curated selection of everyday essentials — designed with intention, built to last, and made to bring a little more calm to your day.</p>
      <div class="actions">
        <a href="#products" class="btn btn-dark">Shop the collection <i class="fas fa-arrow-right"></i></a>
        <a href="#editorial" class="btn btn-ghost">Read our story</a>
      </div>
    </div>
    <div class="hero-visual">
      <div class="hero-shape-1"></div>
      <div class="hero-shape-2"></div>
      <div class="hero-product">
        <i class="fas fa-headphones"></i>
      </div>
      <div class="hero-tag tag-1">Bestseller</div>
      <div class="hero-tag tag-2">$129</div>
    </div>
  </section>

  <!-- Strip -->
  <div class="strip">
    <div class="strip-track">
      <div class="strip-item"><i class="fas fa-truck-fast"></i> Free shipping over $75</div>
      <div class="strip-item"><i class="fas fa-leaf"></i> Sustainably made</div>
      <div class="strip-item"><i class="fas fa-rotate-left"></i> 30-day returns</div>
      <div class="strip-item"><i class="fas fa-shield-halved"></i> 2-year warranty</div>
      <div class="strip-item"><i class="fas fa-star"></i> 4.9 · 12,000+ reviews</div>
      <div class="strip-item"><i class="fas fa-truck-fast"></i> Free shipping over $75</div>
      <div class="strip-item"><i class="fas fa-leaf"></i> Sustainably made</div>
      <div class="strip-item"><i class="fas fa-rotate-left"></i> 30-day returns</div>
      <div class="strip-item"><i class="fas fa-shield-halved"></i> 2-year warranty</div>
      <div class="strip-item"><i class="fas fa-star"></i> 4.9 · 12,000+ reviews</div>
    </div>
  </div>

  <!-- Products -->
  <section class="block container" id="products">
    <div class="section-head">
      <div>
        <div class="eyebrow">Shop the edit</div>
        <h2>New arrivals</h2>
      </div>
      <a href="#" class="view-all">View all products <i class="fas fa-arrow-right"></i></a>
    </div>

    <div class="filters">
      <button class="filter-btn active">All</button>
      <button class="filter-btn">Audio</button>
      <button class="filter-btn">Computing</button>
      <button class="filter-btn">Wearables</button>
      <button class="filter-btn">Home</button>
      <button class="filter-btn">Bags</button>
    </div>

    <div class="product-grid">

      <!-- 1 -->
      <article class="product-card">
        <div class="product-media m-bg-1">
          <span class="tag-pill tag-sale">Sale</span>
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-headphones"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Audio</div>
          <h3 class="product-title">Aura Wireless Headphones</h3>
          <p class="product-desc">Immersive sound with active noise cancellation and 30-hour battery life.</p>
          <div class="product-bottom">
            <div class="price-wrap">
              <span class="price">$129</span>
              <span class="price-old">$152</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 2 -->
      <article class="product-card">
        <div class="product-media m-bg-2">
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-laptop"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Computing</div>
          <h3 class="product-title">Nexus Slim Laptop Stand</h3>
          <p class="product-desc">Ergonomic aluminum stand with adjustable height for all laptops.</p>
          <div class="product-bottom">
            <div class="price-wrap"><span class="price">$49</span></div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 3 -->
      <article class="product-card">
        <div class="product-media m-bg-3">
          <span class="tag-pill tag-new">New</span>
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-watch"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Wearables</div>
          <h3 class="product-title">Pulse Smart Watch</h3>
          <p class="product-desc">Health tracking, AMOLED display, 7-day battery, and water resistant.</p>
          <div class="product-bottom">
            <div class="price-wrap"><span class="price">$199</span></div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 4 -->
      <article class="product-card">
        <div class="product-media m-bg-4">
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-camera"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Photography</div>
          <h3 class="product-title">Lumina Compact Camera</h3>
          <p class="product-desc">4K video, 24MP sensor, and a lightweight design for creators.</p>
          <div class="product-bottom">
            <div class="price-wrap"><span class="price">$349</span></div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 5 -->
      <article class="product-card">
        <div class="product-media m-bg-5">
          <span class="tag-pill tag-sale">Sale</span>
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-mobile-screen"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Accessories</div>
          <h3 class="product-title">MagCharge Power Bank</h3>
          <p class="product-desc">10,000mAh magnetic wireless charging in a slim, fast form factor.</p>
          <div class="product-bottom">
            <div class="price-wrap">
              <span class="price">$59</span>
              <span class="price-old">$79</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 6 -->
      <article class="product-card">
        <div class="product-media m-bg-6">
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-gamepad"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Gaming</div>
          <h3 class="product-title">ProGrip Controller</h3>
          <p class="product-desc">Wireless, low-latency, textured grip, and 40-hour playtime.</p>
          <div class="product-bottom">
            <div class="price-wrap"><span class="price">$89</span></div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- 7 -->
      <article class="product-card">
        <div class="product-media m-bg-7">
          <button class="wish"><i class="far fa-heart"></i></button>
          <i class="fas fa-mug-hot"></i>
        </div>
        <div class="product-info">
          <div class="product-cat">Home</div>
          <h3 class="product-title">Ember Smart Mug</h3>
         
