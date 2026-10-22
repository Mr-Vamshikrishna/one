<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Nexus — Object Store</title>
<link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400;12..96,500;12..96,600;12..96,700;12..96,800&family=Instrument+Serif:ital@0;1&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Bricolage Grotesque', system-ui, sans-serif;
    background: #ecebe6;
    color: #111;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
  }
  a { text-decoration: none; color: inherit; }
  button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
  input { font: inherit; }
  ul { list-style: none; }
  img { display: block; max-width: 100%; }

  :root {
    --bg: #ecebe6;
    --ink: #111111;
    --paper: #f6f5f0;
    --yellow: #e8ff47;
    --orange: #ff5c2b;
    --blue: #2a2aff;
    --line: #111111;
    --mono: 'JetBrains Mono', monospace;
    --serif: 'Instrument Serif', serif;
    --sans: 'Bricolage Grotesque', system-ui, sans-serif;
  }

  .container { width: 100%; max-width: 1440px; margin: 0 auto; padding: 0 32px; }

  /* ===== TICKER ===== */
  .ticker {
    background: var(--ink);
    color: var(--yellow);
    overflow: hidden;
    padding: 10px 0;
    border-bottom: 2px solid var(--ink);
  }
  .ticker-track {
    display: flex; gap: 48px;
    width: max-content;
    animation: ticker 28s linear infinite;
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
  }
  .ticker-track span { display: flex; align-items: center; gap: 48px; }
  .ticker-track i { color: var(--orange); }
  @keyframes ticker {
    from { transform: translateX(0); }
    to { transform: translateX(-50%); }
  }

  /* ===== HEADER ===== */
  header {
    position: sticky; top: 0; z-index: 100;
    background: var(--bg);
    border-bottom: 2px solid var(--ink);
  }
  .header-inner {
    display: flex; align-items: center; justify-content: space-between;
    gap: 24px; padding: 18px 0; min-height: 76px;
  }
  .brand {
    font-family: var(--sans);
    font-weight: 800;
    font-size: 30px;
    letter-spacing: -1.5px;
    display: flex; align-items: center; gap: 4px;
    text-transform: uppercase;
  }
  .brand .star {
    display: inline-block;
    color: var(--orange);
    font-size: 22px;
    animation: rotateStar 8s linear infinite;
  }
  @keyframes rotateStar { to { transform: rotate(360deg); } }

  nav.main-nav ul { display: flex; gap: 28px; align-items: center; }
  nav.main-nav li a {
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding: 6px 0;
    position: relative;
  }
  nav.main-nav li a::after {
    content: '';
    position: absolute; bottom: 0; left: 0;
    width: 100%; height: 2px;
    background: var(--ink);
    transform: scaleX(0);
    transform-origin: right;
    transition: transform 0.3s ease;
  }
  nav.main-nav li a:hover::after,
  nav.main-nav li a.active::after {
    transform: scaleX(1);
    transform-origin: left;
  }

  .header-actions { display: flex; align-items: center; gap: 8px; }
  .icon-btn {
    width: 42px; height: 42px;
    border: 2px solid var(--ink);
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 14px;
    background: var(--paper);
    transition: all 0.2s ease;
    position: relative;
  }
  .icon-btn:hover {
    background: var(--ink);
    color: var(--yellow);
    transform: translate(-2px, -2px);
    box-shadow: 4px 4px 0 var(--orange);
  }
  .cart-count {
    position: absolute; top: -8px; right: -8px;
    background: var(--orange);
    color: var(--paper);
    font-family: var(--mono);
    font-size: 10px;
    font-weight: 700;
    min-width: 20px; height: 20px;
    padding: 0 4px;
    border-radius: 20px;
    display: grid; place-items: center;
    border: 2px solid var(--ink);
  }

  /* ===== HERO ===== */
  .hero {
    border-bottom: 2px solid var(--ink);
    padding: 60px 0 0;
    position: relative;
    overflow: hidden;
  }
  .hero-top {
    display: flex; justify-content: space-between;
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding-bottom: 32px;
    border-bottom: 1px solid var(--ink);
    flex-wrap: wrap;
    gap: 16px;
  }
  .hero-main {
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 32px;
    padding: 40px 0;
    align-items: end;
  }
  .hero-title {
    font-family: var(--sans);
    font-weight: 800;
    font-size: clamp(64px, 11vw, 168px);
    line-height: 0.85;
    letter-spacing: -6px;
    text-transform: uppercase;
    margin-bottom: 8px;
  }
  .hero-title .italic {
    font-family: var(--serif);
    font-weight: 400;
    font-style: italic;
    letter-spacing: -3px;
    text-transform: none;
    color: var(--orange);
  }
  .hero-title .outlined {
    -webkit-text-stroke: 2px var(--ink);
    color: transparent;
  }
  .hero-sub {
    display: flex; align-items: center; gap: 20px;
    font-family: var(--mono);
    font-size: 13px;
    font-weight: 500;
    padding-top: 24px;
    flex-wrap: wrap;
  }
  .hero-sub .dash { width: 40px; height: 2px; background: var(--ink); }
  .hero-sub .big-dot {
    width: 12px; height: 12px; border-radius: 50%;
    background: var(--orange);
    animation: pulseDot 1.5s infinite;
  }
  @keyframes pulseDot {
    0%,100% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.3); opacity: 0.6; }
  }

  .hero-side {
    text-align: right;
    display: flex; flex-direction: column; gap: 20px;
    align-items: flex-end;
    padding-bottom: 20px;
  }
  .hero-side p {
    max-width: 280px;
    font-size: 15px;
    line-height: 1.6;
    text-align: right;
  }
  .hero-cta {
    display: inline-flex; align-items: center; gap: 12px;
    padding: 16px 28px;
    background: var(--ink);
    color: var(--yellow);
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    border: 2px solid var(--ink);
    border-radius: 999px;
    transition: all 0.2s ease;
  }
  .hero-cta:hover {
    background: var(--yellow);
    color: var(--ink);
    transform: translate(-3px, -3px);
    box-shadow: 6px 6px 0 var(--orange);
  }
  .hero-cta i { font-size: 14px; }

  /* Hero marquee strip */
  .hero-marquee {
    background: var(--yellow);
    border-top: 2px solid var(--ink);
    border-bottom: 2px solid var(--ink);
    padding: 16px 0;
    overflow: hidden;
    margin-top: 20px;
  }
  .hero-marquee-track {
    display: flex; gap: 40px;
    width: max-content;
    animation: ticker 22s linear infinite;
    font-family: var(--sans);
    font-weight: 800;
    font-size: 40px;
    letter-spacing: -1.5px;
    text-transform: uppercase;
  }
  .hero-marquee-track span {
    display: flex; align-items: center; gap: 40px;
    color: var(--ink);
  }
  .hero-marquee-track .star-sep {
    color: var(--orange);
    font-size: 32px;
  }

  /* ===== SECTION LABEL ===== */
  .section-label {
    display: flex; align-items: center; gap: 16px;
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 48px 0 32px;
    border-bottom: 1px solid var(--ink);
    flex-wrap: wrap;
  }
  .section-label .num {
    display: inline-grid; place-items: center;
    width: 32px; height: 32px;
    border: 2px solid var(--ink);
    border-radius: 50%;
    background: var(--yellow);
  }
  .section-label .grow { flex: 1; }
  .section-label a {
    border-bottom: 2px solid var(--ink);
    padding-bottom: 2px;
    transition: color 0.2s;
  }
  .section-label a:hover { color: var(--orange); border-color: var(--orange); }

  /* ===== PRODUCTS ===== */
  .products {
    padding: 40px 0 80px;
    border-bottom: 2px solid var(--ink);
  }
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 0;
    border-left: 2px solid var(--ink);
    border-top: 2px solid var(--ink);
  }
  .product {
    border-right: 2px solid var(--ink);
    border-bottom: 2px solid var(--ink);
    background: var(--paper);
    position: relative;
    transition: background 0.2s ease;
    display: flex;
    flex-direction: column;
  }
  .product:hover { background: var(--yellow); }
  .product:hover .product-media i { transform: scale(1.15) rotate(-8deg); }
  .product:hover .product-foot { background: var(--ink); color: var(--yellow); }
  .product:hover .product-foot .price { color: var(--yellow); }
  .product:hover .add-btn {
    background: var(--yellow);
    color: var(--ink);
    border-color: var(--yellow);
  }

  .product-media {
    aspect-ratio: 1 / 0.95;
    display: grid; place-items: center;
    position: relative;
    overflow: hidden;
    border-bottom: 2px solid var(--ink);
  }
  .product-media::after {
    content: attr(data-num);
    position: absolute; top: 14px; left: 16px;
    font-family: var(--mono);
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    opacity: 0.5;
  }
  .product-media i {
    font-size: 90px;
    color: var(--ink);
    transition: transform 0.4s cubic-bezier(0.34,1.56,0.64,1);
  }
  .badge {
    position: absolute; top: 12px; right: 12px;
    padding: 5px 11px;
    font-family: var(--mono);
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    border: 2px solid var(--ink);
    border-radius: 999px;
    background: var(--paper);
    z-index: 2;
  }
  .badge.sale { background: var(--orange); color: var(--paper); }
  .badge.new { background: var(--yellow); color: var(--ink); }
  .badge.hot { background: var(--blue); color: var(--paper); }

  .product-body {
    padding: 20px 22px 0;
    display: flex;
    flex-direction: column;
    flex: 1;
  }
  .product-cat {
    font-family: var(--mono);
    font-size: 10.5px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    margin-bottom: 10px;
    opacity: 0.6;
  }
  .product-name {
    font-family: var(--sans);
    font-weight: 700;
    font-size: 22px;
    letter-spacing: -0.6px;
    line-height: 1.15;
    margin-bottom: 10px;
  }
  .product-desc {
    font-size: 13.5px;
    line-height: 1.55;
    opacity: 0.7;
    margin-bottom: 20px;
    flex: 1;
  }
  .product-foot {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    padding: 16px 22px;
    border-top: 2px solid var(--ink);
    margin: 0 -22px;
    background: var(--paper);
    transition: all 0.25s ease;
  }
  .price-row { display: flex; align-items: baseline; gap: 8px; }
  .price {
    font-family: var(--sans);
    font-weight: 800;
    font-size: 24px;
    letter-spacing: -0.8px;
    transition: color 0.25s ease;
  }
  .price .currency { font-size: 14px; opacity: 0.6; }
  .price-old {
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 500;
    text-decoration: line-through;
    opacity: 0.5;
  }
  .add-btn {
    width: 44px; height: 44px;
    border: 2px solid var(--ink);
    border-radius: 50%;
    background: transparent;
    display: grid; place-items: center;
    font-size: 15px;
    transition: all 0.2s ease;
    flex-shrink: 0;
  }
  .add-btn:hover {
    transform: rotate(90deg) scale(1.1);
  }

  /* ===== FEATURE / EDITORIAL ===== */
  .feature {
    border-bottom: 2px solid var(--ink);
    padding: 80px 0;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 0;
  }
  .feature-left {
    padding-right: 48px;
    border-right: 2px solid var(--ink);
  }
  .feature-tag {
    display: inline-flex; align-items: center; gap: 8px;
    font-family: var(--mono);
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 6px 14px;
    background: var(--ink);
    color: var(--yellow);
    border-radius: 999px;
    margin-bottom: 28px;
  }
  .feature-h {
    font-family: var(--sans);
    font-weight: 800;
    font-size: 72px;
    line-height: 0.9;
    letter-spacing: -3px;
    text-transform: uppercase;
    margin-bottom: 28px;
  }
  .feature-h em {
    font-family: var(--serif);
    font-weight: 400;
    font-style: italic;
    text-transform: none;
    letter-spacing: -2px;
    color: var(--orange);
  }
  .feature-p {
    font-size: 16px;
    line-height: 1.7;
    max-width: 460px;
    margin-bottom: 32px;
  }
  .feature-btn {
    display: inline-flex; align-items: center; gap: 12px;
    padding: 14px 28px;
    background: var(--ink);
    color: var(--paper);
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    border: 2px solid var(--ink);
    border-radius: 999px;
    transition: all 0.2s;
  }
  .feature-btn:hover {
    background: var(--yellow);
    color: var(--ink);
    transform: translate(-3px, -3px);
    box-shadow: 6px 6px 0 var(--orange);
  }
  .feature-right {
    padding-left: 48px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 20px;
  }
  .feature-stat {
    display: flex; justify-content: space-between; align-items: baseline;
    padding: 22px 0;
    border-bottom: 1px solid var(--ink);
  }
  .feature-stat:last-child { border-bottom: none; }
  .feature-stat .label {
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
  }
  .feature-stat .val {
    font-family: var(--sans);
    font-weight: 800;
    font-size: 40px;
    letter-spacing: -1.5px;
    line-height: 1;
  }
  .feature-stat .val sup {
    font-family: var(--mono);
    font-size: 14px;
    font-weight: 500;
    vertical-align: super;
    letter-spacing: 0;
    opacity: 0.6;
    margin-left: 4px;
  }

  /* ===== FOOTER ===== */
  footer {
    background: var(--ink);
    color: var(--paper);
    padding: 64px 0 24px;
  }
  .footer-top {
    display: grid;
    grid-template-columns: 1.4fr 1fr 1fr 1fr;
    gap: 40px;
    padding-bottom: 48px;
    border-bottom: 1px solid rgba(246,245,240,0.15);
  }
  .footer-brand .brand { color: var(--paper); margin-bottom: 20px; }
  .footer-brand .brand .star { color: var(--yellow); }
  .footer-brand p {
    font-size: 14px;
    line-height: 1.7;
    color: rgba(246,245,240,0.6);
    max-width: 300px;
    margin-bottom: 24px;
  }
  .footer-social { display: flex; gap: 8px; }
  .footer-social a {
    width: 40px; height: 40px;
    border: 2px solid rgba(246,245,240,0.2);
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 14px;
    color: var(--paper);
    transition: all 0.2s;
  }
  .footer-social a:hover {
    background: var(--yellow);
    color: var(--ink);
    border-color: var(--yellow);
    transform: translateY(-3px);
  }
  .footer-col h4 {
    font-family: var(--mono);
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--yellow);
    margin-bottom: 20px;
  }
  .footer-col ul li { margin-bottom: 12px; }
  .footer-col ul li a {
    font-size: 14px;
    color: rgba(246,245,240,0.65);
    transition: color 0.2s;
  }
  .footer-col ul li a:hover { color: var(--yellow); }
  .footer-bottom {
    padding-top: 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 16px;
    font-family: var(--mono);
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: rgba(246,245,240,0.5);
  }

  /* ===== RESPONSIVE ===== */
  @media (max-width: 1024px) {
    .hero-main { grid-template-columns: 1fr; gap: 40px; }
    .hero-side { text-align: left; align-items: flex-start; }
    .hero-side p { text-align: left; }
    .feature { grid-template-columns: 1fr; }
    .feature-left { padding-right: 0; border-right: none; border-bottom: 2px solid var(--ink); padding-bottom: 48px; margin-bottom: 48px; }
    .feature-right { padding-left: 0; }
    .footer-top { grid-template-columns: 1fr 1fr; }
  }
  @media (max-width: 768px) {
    .container { padding: 0 20px; }
    nav.main-nav { display: none; }
    .hero-title { letter-spacing: -3px; }
    .hero-marquee-track { font-size: 28px; }
    .feature-h { font-size: 52px; }
    .product-grid { grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); }
  }
  @media (max-width: 540px) {
    .product-grid { grid-template-columns: 1fr; }
    .product-media i { font-size: 100px; }
    .hero-title { letter-spacing: -2px; }
    .hero-side .hero-cta { padding: 14px 22px; font-size: 11px; }
    .feature-h { font-size: 40px; }
    .feature-stat .val { font-size: 30px; }
    .footer-top { grid-template-columns: 1fr; gap: 32px; }
    .footer-bottom { flex-direction: column; text-align: center; }
    .hero-marquee-track { font-size: 22px; gap: 24px; }
    .hero-marquee-track span { gap: 24px; }
    .section-label { font-size: 11px; gap: 10px; }
    .section-label .num { width: 26px; height: 26px; font-size: 11px; }
  }
</style>
</head>
<body>

<!-- Ticker -->
<div class="ticker">
  <div class="ticker-track">
    <span>Free shipping over $75 <i class="fas fa-star"></i> New spring drop <i class="fas fa-star"></i> 30-day returns <i class="fas fa-star"></i> 4.9 stars · 12k reviews <i class="fas fa-star"></i></span>
    <span>Free shipping over $75 <i class="fas fa-star"></i> New spring drop <i class="fas fa-star"></i> 30-day returns <i class="fas fa-star"></i> 4.9 stars · 12k reviews <i class="fas fa-star"></i></span>
  </div>
</div>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a href="#" class="brand">
      Nexus <span class="star"><i class="fas fa-star-of-life"></i></span>
    </a>
    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active">Shop</a></li>
        <li><a href="#products">New in</a></li>
        <li><a href="#feature">Collection</a></li>
        <li><a href="#footer">About</a></li>
      </ul>
    </nav>
    <div class="header-actions">
      <button class="icon-btn" aria-label="Search"><i class="fas fa-magnifying-glass"></i></button>
      <button class="icon-btn" aria-label="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn" aria-label="Cart">
        <i class="fas fa-bag-shopping"></i>
        <span class="cart-count">3</span>
      </button>
    </div>
  </div>
</header>

<main>
  <!-- Hero -->
  <section class="hero">
    <div class="container">
      <div class="hero-top">
        <span>Vol. 04 / Spring 2025</span>
        <span><i class="fas fa-asterisk"></i> Object store</span>
        <span>Est. 2019 — Made with care</span>
      </div>
      <div class="hero-main">
        <div>
          <h1 class="hero-title">
            Everyday<br>
            <span class="italic">objects,</span><br>
            <span class="outlined">reimagined.</span>
          </h1>
          <div class="hero-sub">
            <span class="big-dot"></span>
            <span>Curated essentials for modern life</span>
            <span class="dash"></span>
            <span>Free shipping over $75</span>
          </div>
        </div>
        <div class="hero-side">
          <p>A considered collection of tech and lifestyle pieces — built to be used, loved, and kept.</p>
          <a href="#products" class="hero-cta">
            Shop the drop <i class="fas fa-arrow-right"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="hero-marquee">
      <div class="hero-marquee-track">
        <span>New arrivals <i class="fas fa-star-of-life star-sep"></i> Limited stock <i class="fas fa-star-of-life star-sep"></i> Sustainable <i class="fas fa-star-of-life star-sep"></i> Free returns <i class="fas fa-star-of-life star-sep"></i></span>
        <span>New arrivals <i class="fas fa-star-of-life star-sep"></i> Limited stock <i class="fas fa-star-of-life star-sep"></i> Sustainable <i class="fas fa-star-of-life star-sep"></i> Free returns <i class="fas fa-star-of-life star-sep"></i></span>
      </div>
    </div>
  </section>

  <!-- Products -->
  <section class="products" id="products">
    <div class="container">
      <div class="section-label">
        <span class="num">01</span>
        <span>The edit — New arrivals</span>
        <span class="grow"></span>
        <a href="#">View all →</a>
      </div>

      <div class="product-grid">

        <!-- 01 -->
        <article class="product">
          <div class="product-media" data-num="01">
            <span class="badge sale">Sale</span>
            <i class="fas fa-headphones"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Audio</div>
            <h3 class="product-name">Aura Wireless Headphones</h3>
            <p class="product-desc">Immersive sound, active noise cancellation, 30-hour battery.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>129</span>
              <span class="price-old">$152</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 02 -->
        <article class="product">
          <div class="product-media" data-num="02">
            <i class="fas fa-laptop"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Computing</div>
            <h3 class="product-name">Slim Aluminum Laptop Stand</h3>
            <p class="product-desc">Ergonomic angle, adjustable height, fits all laptops.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>49</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 03 -->
        <article class="product">
          <div class="product-media" data-num="03">
            <span class="badge new">New</span>
            <i class="fas fa-watch"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Wearables</div>
            <h3 class="product-name">Pulse Smart Watch</h3>
            <p class="product-desc">Health tracking, AMOLED display, 7-day battery, waterproof.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>199</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 04 -->
        <article class="product">
          <div class="product-media" data-num="04">
            <i class="fas fa-camera"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Photography</div>
            <h3 class="product-name">Lumina Compact Camera</h3>
            <p class="product-desc">4K video, 24MP sensor, lightweight body for creators.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>349</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 05 -->
        <article class="product">
          <div class="product-media" data-num="05">
            <span class="badge hot">Hot</span>
            <i class="fas fa-mobile-screen-button"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Accessories</div>
            <h3 class="product-name">MagCharge Power Bank</h3>
            <p class="product-desc">10,000mAh magnetic wireless charging in a slim form.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>59</span>
              <span class="price-old">$79</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 06 -->
        <article class="product">
          <div class="product-media" data-num="06">
            <i class="fas fa-gamepad"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Gaming</div>
            <h3 class="product-name">ProGrip Controller</h3>
            <p class="product-desc">Wireless, low-latency, textured grip, 40-hour playtime.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>89</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 07 -->
        <article class="product">
          <div class="product-media" data-num="07">
            <i class="fas fa-mug-hot"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Home</div>
            <h3 class="product-name">Ember Smart Mug</h3>
            <p class="product-desc">Keeps drinks at the perfect temperature for 1.5 hours.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>99</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 08 -->
        <article class="product">
          <div class="product-media" data-num="08">
            <span class="badge new">Eco</span>
            <i class="fas fa-backpack"></i>
          </div>
          <div class="product-body">
            <div class="product-cat">Bags</div>
            <h3 class="product-name">Urban Commuter Backpack</h3>
            <p class="product-desc">Water-resistant, laptop sleeve, recycled materials.</p>
          </div>
          <div class="product-foot">
            <div class="price-row">
              <span class="price"><span class="currency">$</span>79</span>
            </div>
            <button class="add-btn" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </article>

        <!-- 09 -->
        <article class="product">
          <div class="product-media" data-n
