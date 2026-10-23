<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Nexus — Object Store</title>
<link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400;12..96,500;12..96,600;12..96,700;12..96,800&family=Instrument+Serif:ital@0;1&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  /* ============ RESET & TOKENS ============ */
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Bricolage Grotesque', system-ui, sans-serif;
    background: #ecebe6;
    color: #111;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
    overflow-x: hidden;
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
    --ease: cubic-bezier(0.22, 1, 0.36, 1);
  }

  /* ============ CUSTOM CURSOR ============ */
  .cursor-dot, .cursor-ring {
    position: fixed;
    top: 0; left: 0;
    pointer-events: none;
    z-index: 9999;
    border-radius: 50%;
    mix-blend-mode: difference;
  }
  .cursor-dot {
    width: 8px; height: 8px;
    background: var(--yellow);
    transform: translate(-50%, -50%);
  }
  .cursor-ring {
    width: 40px; height: 40px;
    border: 1.5px solid var(--yellow);
    transform: translate(-50%, -50%);
    transition: width .25s var(--ease), height .25s var(--ease), background .25s var(--ease);
  }
  .cursor-ring.hovering {
    width: 70px; height: 70px;
    background: rgba(232,255,71,0.15);
  }
  @media (hover: none) { .cursor-dot, .cursor-ring { display: none; } }

  /* ============ GRAIN ============ */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    pointer-events: none;
    z-index: 9998;
    opacity: 0.035;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  }

  /* ============ SCROLL PROGRESS ============ */
  .scroll-progress {
    position: fixed; top: 0; left: 0;
    height: 3px;
    width: 0%;
    background: var(--orange);
    z-index: 200;
    transition: width .1s linear;
  }

  .container { width: 100%; max-width: 1440px; margin: 0 auto; padding: 0 32px; }

  /* ============ TICKER ============ */
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

  /* ============ HEADER ============ */
  header {
    position: sticky; top: 0; z-index: 100;
    background: rgba(236,235,230,0.85);
    backdrop-filter: blur(12px);
    border-bottom: 2px solid var(--ink);
  }
  .header-inner {
    display: flex; align-items: center; justify-content: space-between;
    gap: 24px; padding: 18px 0; min-height: 76px;
  }
  .brand {
    font-weight: 800;
    font-size: 30px;
    letter-spacing: -1.5px;
    display: flex; align-items: center; gap: 6px;
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
    font-size: 12px; font-weight: 700;
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
    font-size: 10px; font-weight: 700;
    min-width: 20px; height: 20px;
    padding: 0 4px;
    border-radius: 20px;
    display: grid; place-items: center;
    border: 2px solid var(--ink);
    transition: transform .25s var(--ease);
  }
  .cart-count.bump { transform: scale(1.5); }

  /* ============ HERO ============ */
  .hero {
    border-bottom: 2px solid var(--ink);
    padding: 60px 0 0;
    position: relative;
    overflow: hidden;
  }
  .hero-glow {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.55;
    pointer-events: none;
    z-index: 0;
  }
  .hero-glow.one { width: 420px; height: 420px; background: var(--orange); top: -120px; right: 8%; }
  .hero-glow.two { width: 360px; height: 360px; background: var(--yellow); bottom: 40px; left: -80px; }
  .hero-top {
    display: flex; justify-content: space-between;
    font-family: var(--mono);
    font-size: 12px; font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding-bottom: 32px;
    border-bottom: 1px solid var(--ink);
    flex-wrap: wrap; gap: 16px;
    position: relative; z-index: 1;
  }
  .hero-main {
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 32px;
    padding: 40px 0;
    align-items: end;
    position: relative; z-index: 1;
  }
  .hero-title {
    font-weight: 800;
    font-size: clamp(64px, 11vw, 168px);
    line-height: 0.85;
    letter-spacing: -6px;
    text-transform: uppercase;
    margin-bottom: 8px;
  }
  .hero-title .italic {
    font-family: var(--serif);
    font-weight: 400; font-style: italic;
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
    font-size: 13px; font-weight: 500;
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
    font-size: 15px; line-height: 1.6;
    text-align: right;
  }
  .hero-cta {
    display: inline-flex; align-items: center; gap: 12px;
    padding: 16px 28px;
    background: var(--ink);
    color: var(--yellow);
    font-family: var(--mono);
    font-size: 12px; font-weight: 700;
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

  /* Hero marquee */
  .hero-marquee {
    background: var(--yellow);
    border-top: 2px solid var(--ink);
    border-bottom: 2px solid var(--ink);
    padding: 16px 0;
    overflow: hidden;
    margin-top: 20px;
    position: relative; z-index: 1;
  }
  .hero-marquee-track {
    display: flex; gap: 40px;
    width: max-content;
    animation: ticker 22s linear infinite;
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

  /* ============ SECTION LABEL ============ */
  .section-label {
    display: flex; align-items: center; gap: 16px;
    font-family: var(--mono);
    font-size: 12px; font-weight: 700;
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

  /* ============ FILTER CHIPS ============ */
  .filters {
    display: flex; gap: 8px; flex-wrap: wrap;
    padding: 24px 0;
  }
  .chip {
    padding: 9px 18px;
    border: 2px solid var(--ink);
    border-radius: 999px;
    font-family: var(--mono);
    font-size: 11px; font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    background: var(--paper);
    transition: all .2s var(--ease);
  }
  .chip:hover { transform: translateY(-2px); }
  .chip.active {
    background: var(--ink);
    color: var(--yellow);
  }

  /* ============ PRODUCTS ============ */
  .products {
    padding: 20px 0 80px;
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
    font-size: 11px; font-weight: 700;
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
    font-size: 10px; font-weight: 700;
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
    font-size: 10.5px; font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    margin-bottom: 10px;
    opacity: 0.6;
  }
  .product-name {
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
    margin-bottom: 16px;
    flex: 1;
  }

  /* Color swatches */
  .swatches { display: flex; gap: 6px; margin-bottom: 18px; }
  .swatch {
    width: 18px; height: 18px;
    border-radius: 50%;
    border: 2px solid var(--ink);
    transition: transform .15s var(--ease);
  }
  .swatch:hover { transform: scale(1.2); }
  .swatch.selected { outline: 2px solid var(--ink); outline-offset: 2px; }

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
    font-weight: 800;
    font-size: 24px;
    letter-spacing: -0.8px;
    transition: color 0.25s ease;
  }
  .price .currency { font-size: 14px; opacity: 0.6; }
  .price-old {
    font-family: var(--mono);
    font-size: 12px; font-weight: 500;
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
  .add-btn:hover { transform: rotate(90deg) scale(1.1); }

  .empty-state {
    padding: 60px 20px;
    text-align: center;
    font-family: var(--mono);
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    opacity: 0.6;
    width: 100%;
  }

  /* ============ FEATURE ============ */
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
    font-size: 11px; font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 6px 14px;
    background: var(--ink);
    color: var(--yellow);
    border-radius: 999px;
    margin-bottom: 28px;
  }
  .feature-h {
    font-weight: 800;
    font-size: 72px;
    line-height: 0.9;
    letter-spacing: -3px;
    text-transform: uppercase;
    margin-bottom: 28px;
  }
  .feature-h em {
    font-family: var(--serif);
    font-weight: 400; font-style: italic;
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
    font-size: 12px; font-weight: 700;
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
    font-size: 12px; font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
  }
  .feature-stat .val {
    font-weight: 800;
    font-size: 40px;
    letter-spacing: -1.5px;
    line-height: 1;
  }
  .feature-stat .val sup {
    font-family: var(--mono);
    font-size: 14px; font-weight: 500;
    vertical-align: super;
    letter-spacing: 0;
    opacity: 0.6;
    margin-left: 4px;
  }

  /* ============ NEWSLETTER ============ */
  .newsletter {
    background: var(--yellow);
    border-bottom: 2px solid var(--ink);
    padding: 80px 0;
    text-align: center;
  }
  .newsletter h2 {
    font-weight: 800;
    font-size: clamp(40px, 6vw, 84px);
    letter-spacing: -3px;
    line-height: 0.95;
    text-transform: uppercase;
    margin-bottom: 16px;
  }
  .newsletter h2 em {
    font-family: var(--serif);
    font-weight: 400; font-style: italic;
    text-transform: none;
    color: var(--orange);
  }
  .newsletter p {
    font-family: var(--mono);
    font-size: 13px; font-weight: 500;
    letter-spacing: 0.5px;
    margin-bottom: 32px;
  }
  .newsletter-form {
    display: flex;
    gap: 0;
    max-width: 520px;
    margin: 0 auto;
    border: 2px solid var(--ink);
    border-radius: 999px;
    overflow: hidden;
    background: var(--paper);
  }
  .newsletter-form input {
    flex: 1;
    padding: 16px 22px;
    border: none;
    background: transparent;
    font-family: var(--mono);
    font-size: 13px;
    outline: none;
  }
  .newsletter-form button {
    padding: 16px 28px;
    background: var(--ink);
    color: var(--yellow);
    font-family: var(--mono);
    font-size: 12px; font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: all .2s;
    white-space: nowrap;
  }
  .newsletter-form button:hover { background: var(--orange); color: var(--paper); }
  .newsletter-msg {
    margin-top: 16px;
    font-family: var(--mono);
    font-size: 12px;
    letter-spacing: 1px;
    text-transform: uppercase;
    min-height: 18px;
  }

  /* ============ FOOTER ============ */
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
    font-size: 14px; line-height: 1.7;
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
    font-size: 11px; font-weight: 700;
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
    flex-wrap: wrap; gap: 16px;
    font-family: var(--mono);
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: rgba(246,245,240,0.5);
  }

  /* ============ SEARCH OVERLAY ============ */
  .search-overlay {
    position: fixed; inset: 0;
    background: rgba(236,235,230,0.96);
    backdrop-filter: blur(20px);
    z-index: 300;
    display: flex;
    flex-direction: column;
    padding: 120px 32px 40px;
    opacity: 0;
    visibility: hidden;
    transition: opacity .3s var(--ease), visibility .3s;
  }
  .search-overlay.open { opacity: 1; visibility: visible; }
  .search-inner { max-width: 800px; margin: 0 auto; width: 100%; }
  .search-input {
    width: 100%;
    padding: 20px 0;
    background: transparent;
    border: none;
    border-bottom: 2px solid var(--ink);
    font-size: 32px;
    font-weight: 700;
    letter-spacing: -1px;
    outline: none;
  }
  .search-input::placeholder { color: rgba(17,17,17,0.25); }
  .search-results {
    margin-top: 32px;
    display: flex; flex-direction: column; gap: 8px;
  }
  .search-result {
    display: flex; justify-content: space-between; align-items: center;
    padding: 16px 0;
    border-bottom: 1px solid rgba(17,17,17,0.15);
    transition: padding .2s var(--ease);
  }
  .search-result:hover { padding-left: 12px; }
  .search-result strong { font-size: 18px; }
  .search-result span {
    font-family: var(--mono);
    font-size: 12px; font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    opacity: 0.6;
  }
  .search-hint {
    margin-top: 32px;
    font-family: var(--mono);
    font-size: 12px;
    letter-spacing: 1px;
    text-transform: uppercase;
    opacity: 0.5;
  }
  .close-overlay {
    position: absolute; top: 32px; right: 32px;
    width: 48px; height: 48px;
    border: 2px solid var(--ink);
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 16px;
    background: var(--paper);
    transition: all .2s;
  }
  .close-overlay:hover { background: var(--ink); color: var(--yellow); transform: rotate(90deg); }

  /* ============ CART DRAWER ============ */
  .cart-overlay {
    position: fixed; inset: 0;
    background: rgba(17,17,17,0.4);
    backdrop-filter: blur(4px);
    z-index: 300;
    opacity: 0; visibility: hidden;
    transition: opacity .3s var(--ease), visibility .3s;
  }
  .cart-overlay.open { opacity: 1; visibility: visible; }
  .cart-drawer {
    position: fixed; top: 0; right: 0; bottom: 0;
    width: min(440px, 100%);
    background: var(--paper);
    border-left: 2px solid var(--ink);
    z-index: 301;
    display: flex; flex-direction: column;
    transform: translateX(100%);
    transition: transform .4s var(--ease);
  }
  .cart-drawer.open { transform: translateX(0); }
  .cart-head {
    display: flex; justify-content: space-between; align-items: center;
    padding: 24px;
    border-bottom: 2px solid var(--ink);
  }
  .cart-head h3 {
    font-weight: 800;
    font-size: 22px;
    letter-spacing: -0.5px;
    text-transform: uppercase;
  }
  .cart-body {
    flex: 1;
    overflow-y: auto;
    padding: 16px 24px;
  }
  .cart-item {
    display: grid;
    grid-template-columns: 56px 1fr auto;
    gap: 14px;
    align-items: center;
    padding: 16px 0;
    border-bottom: 1px solid rgba(17,17,17,0.15);
  }
  .cart-item-icon {
    width: 56px; height: 56px;
    border: 2px solid var(--ink);
    border-radius: 10px;
    display: grid; place-items: center;
    background: var(--yellow);
    font-size: 20px;
  }
  .cart-item-info strong {
    display: block;
    font-size: 14px;
    line-height: 1.25;
    margin-bottom: 4px;
  }
  .cart-item-info span {
    font-family: var(--mono);
    font-size: 12px;
    opacity: 0.6;
  }
  .qty {
    display: flex; align-items: center; gap: 8px;
    font-family: var(--mono);
    font-size: 13px; font-weight: 700;
  }
  .qty button {
    width: 24px; height: 24px;
    border: 1.5px solid var(--ink);
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 11px;
    transition: all .15s;
  }
  .qty button:hover { background
