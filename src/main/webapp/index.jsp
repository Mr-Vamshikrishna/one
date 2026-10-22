<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Morrow — Everyday Essentials</title>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,500;0,9..144,600;1,9..144,400&family=Manrope:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Manrope', system-ui, sans-serif;
    background: #f7f3ec;
    color: #2b2620;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
  }
  a { text-decoration: none; color: inherit; }
  button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
  input { font: inherit; }
  ul { list-style: none; }
  img { display: block; max-width: 100%; }

  :root {
    --bg: #f7f3ec;
    --bg-2: #efe9df;
    --paper: #fffdf9;
    --ink: #2b2620;
    --ink-soft: #5b524a;
    --muted: #918879;
    --line: #e0d8ca;
    --olive: #5f6b4a;
    --olive-light: #eef0e6;
    --clay: #b8704a;
    --clay-light: #f5e6dd;
    --sand: #d9cdb8;
    --serif: 'Fraunces', Georgia, serif;
    --sans: 'Manrope', system-ui, sans-serif;
  }

  .container { width: 100%; max-width: 1280px; margin: 0 auto; padding: 0 40px; }

  /* TOP BAR */
  .topbar {
    background: var(--ink);
    color: var(--bg);
    text-align: center;
    padding: 11px 20px;
    font-size: 12.5px;
    letter-spacing: 0.3px;
    font-weight: 500;
  }
  .topbar i { margin-right: 8px; opacity: 0.7; }

  /* HEADER */
  header {
    position: sticky; top: 0; z-index: 100;
    background: rgba(247,243,236,0.9);
    backdrop-filter: blur(20px) saturate(180%);
    border-bottom: 1px solid var(--line);
  }
  .header-inner {
    display: flex; align-items: center; justify-content: space-between;
    gap: 40px; padding: 22px 0; min-height: 84px;
  }
  .brand {
    font-family: var(--serif);
    font-size: 30px;
    font-weight: 400;
    letter-spacing: -1px;
    display: flex; align-items: center; gap: 3px;
    flex-shrink: 0;
  }
  .brand-dot {
    width: 7px; height: 7px;
    border-radius: 50%;
    background: var(--clay);
    margin-bottom: 4px;
  }
  nav.main-nav ul { display: flex; gap: 8px; align-items: center; }
  nav.main-nav li a {
    font-size: 14px; font-weight: 500;
    color: var(--ink-soft);
    padding: 8px 18px; border-radius: 40px;
    transition: all 0.25s ease;
  }
  nav.main-nav li a:hover { color: var(--ink); background: var(--bg-2); }
  nav.main-nav li a.active { color: var(--ink); font-weight: 600; }

  .header-actions { display: flex; align-items: center; gap: 4px; flex-shrink: 0; }
  .icon-btn {
    width: 42px; height: 42px;
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 15px; color: var(--ink-soft);
    transition: all 0.25s ease;
    position: relative;
  }
  .icon-btn:hover { background: var(--bg-2); color: var(--ink); }
  .cart-count {
    position: absolute; top: 4px; right: 4px;
    background: var(--clay); color: var(--paper);
    font-size: 9.5px; font-weight: 700;
    min-width: 16px; height: 16px; padding: 0 4px;
    border-radius: 20px;
    display: grid; place-items: center;
    border: 2px solid var(--bg);
  }

  /* HERO */
  .hero { padding: 80px 0 100px; }
  .hero-grid {
    display: grid;
    grid-template-columns: 1.05fr 0.95fr;
    gap: 80px;
    align-items: center;
  }
  .hero-eyebrow {
    display: inline-flex; align-items: center; gap: 12px;
    font-size: 12px; font-weight: 600;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--clay); margin-bottom: 32px;
  }
  .hero-eyebrow::before {
    content: ''; width: 36px; height: 1px; background: var(--clay);
  }
  .hero h1 {
    font-family: var(--serif);
    font-size: clamp(48px, 5.5vw, 82px);
    font-weight: 400;
    line-height: 1.02;
    letter-spacing: -2.5px;
    margin-bottom: 28px;
  }
  .hero h1 em { font-style: italic; color: var(--clay); }
  .hero p {
    font-size: 17px; line-height: 1.7;
    color: var(--ink-soft);
    max-width: 440px; margin-bottom: 40px;
  }
  .hero-actions { display: flex; gap: 14px; align-items: center; flex-wrap: wrap; }
  .btn {
    display: inline-flex; align-items: center; justify-content: center; gap: 10px;
    padding: 16px 32px; border-radius: 999px;
    font-weight: 600; font-size: 14.5px;
    transition: all 0.25s ease;
    border: 1.5px solid transparent;
    white-space: nowrap;
  }
  .btn-primary { background: var(--ink); color: var(--paper); border-color: var(--ink); }
  .btn-primary:hover { background: var(--olive); border-color: var(--olive); transform: translateY(-1px); }
  .btn-outline { background: transparent; color: var(--ink); border-color: var(--line); }
  .btn-outline:hover { background: var(--paper); border-color: var(--sand); }

  .hero-visual { position: relative; aspect-ratio: 1 / 1.05; }
  .hero-img {
    position: absolute; inset: 0;
    border-radius: 300px 300px 24px 24px;
    background: linear-gradient(155deg, #ede4d4 0%, #d9cdb8 60%, #c9b89c 100%);
    overflow: hidden;
    display: grid; place-items: center;
    box-shadow: 0 40px 80px -30px rgba(43,38,32,0.25);
  }
  .hero-img i {
    font-size: 220px;
    color: rgba(43,38,32,0.85);
    filter: drop-shadow(0 20px 40px rgba(43,38,32,0.2));
  }
  .hero-badge {
    position: absolute;
    background: var(--paper);
    border-radius: 999px;
    padding: 14px 22px;
    box-shadow: 0 12px 32px -8px rgba(43,38,32,0.2);
    display: flex; align-items: center; gap: 12px;
    z-index: 2;
  }
  .hero-badge-1 { top: 8%; left: -20px; }
  .hero-badge-2 { bottom: 12%; right: -20px; }
  .hero-badge-icon {
    width: 40px; height: 40px; border-radius: 50%;
    display: grid; place-items: center; font-size: 15px;
  }
  .hero-badge-1 .hero-badge-icon { background: var(--olive-light); color: var(--olive); }
  .hero-badge-2 .hero-badge-icon { background: var(--clay-light); color: var(--clay); }
  .hero-badge-text .num {
    font-family: var(--serif); font-size: 19px;
    font-weight: 500; line-height: 1.1;
  }
  .hero-badge-text .label { font-size: 11.5px; color: var(--muted); }

  /* LOGO STRIP */
  .logo-strip {
    padding: 36px 0;
    border-top: 1px solid var(--line);
    border-bottom: 1px solid var(--line);
    background: var(--bg-2);
  }
  .logo-strip-inner {
    display: flex; justify-content: space-between; align-items: center;
    gap: 40px; flex-wrap: wrap; opacity: 0.55;
  }
  .logo-item {
    font-family: var(--serif);
    font-size: 22px; font-weight: 500;
    letter-spacing: -0.5px; color: var(--ink-soft);
  }
  .logo-item i { margin-right: 8px; font-size: 18px; }

  /* SECTION HEAD */
  section.block { padding-top: 96px; }
  .section-head {
    display: flex; justify-content: space-between; align-items: flex-end;
    gap: 32px; margin-bottom: 56px; flex-wrap: wrap;
  }
  .section-head .left { flex: 1; min-width: 280px; }
  .section-eyebrow {
    font-size: 11.5px; font-weight: 600;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--clay); margin-bottom: 16px;
    display: flex; align-items: center; gap: 12px;
  }
  .section-eyebrow::before { content: ''; width: 28px; height: 1px; background: var(--clay); }
  .section-head h2 {
    font-family: var(--serif);
    font-size: clamp(36px, 4vw, 52px);
    font-weight: 400; line-height: 1.05;
    letter-spacing: -1.5px; max-width: 520px;
  }
  .section-head h2 em { font-style: italic; color: var(--clay); }
  .view-all {
    font-size: 14px; font-weight: 600;
    display: inline-flex; align-items: center; gap: 10px;
    padding-bottom: 6px;
    border-bottom: 1.5px solid var(--ink);
    transition: all 0.25s ease; white-space: nowrap;
  }
  .view-all:hover { gap: 16px; color: var(--clay); border-color: var(--clay); }

  /* PRODUCT GRID */
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
    gap: 32px 28px;
  }
  .product {
    border-radius: 20px; overflow: hidden;
    display: flex; flex-direction: column;
    transition: transform 0.35s cubic-bezier(0.34,1.4,0.64,1);
    cursor: pointer;
  }
  .product:hover { transform: translateY(-6px); }

  .product-media {
    aspect-ratio: 1 / 1.05;
    border-radius: 20px;
    display: grid; place-items: center;
    position: relative; overflow: hidden;
    background: var(--card-bg, var(--bg-2));
  }
  .product-media i {
    font-size: 96px;
    color: var(--icon-color, var(--ink));
    transition: all 0.5s cubic-bezier(0.34,1.4,0.64,1);
    filter: drop-shadow(0 12px 24px rgba(43,38,32,0.15));
    position: relative; z-index: 1;
  }
  .product:hover .product-media i { transform: scale(1.08) rotate(-4deg); }

  .p-1 { --card-bg: linear-gradient(160deg, #efe9df, #e2d8c4); }
  .p-2 { --card-bg: linear-gradient(160deg, #e8e9e0, #d4d6c8); }
  .p-3 { --card-bg: linear-gradient(160deg, #f2e6dd, #e2cfc0); }
  .p-4 { --card-bg: linear-gradient(160deg, #e6e4dd, #d1cec4); }
  .p-5 { --card-bg: linear-gradient(160deg, #ece6dc, #d9ccb8); }
  .p-6 { --card-bg: linear-gradient(160deg, #e0e4e3, #c8cecc); }
  .p-7 { --card-bg: linear-gradient(160deg, #f0e6e0, #dfc9be); }
  .p-8 { --card-bg: linear-gradient(160deg, #e8e6d9, #d5d2be); }
  .p-9 { --card-bg: linear-gradient(160deg, #e9e0e8, #d2c4d1); }
  .p-10 { --card-bg: linear-gradient(160deg, #e2e5e0, #ccd2c8); }

  .product-tag {
    position: absolute; top: 16px; left: 16px;
    background: rgba(255,253,249,0.92);
    backdrop-filter: blur(8px);
    padding: 6px 12px; border-radius: 999px;
    font-size: 10.5px; font-weight: 700;
    letter-spacing: 1px; text-transform: uppercase;
    color: var(--ink); z-index: 2;
  }
  .product-tag.sale { background: var(--clay); color: var(--paper); }
  .product-tag.new { background: var(--olive); color: var(--paper); }

  .wish-btn {
    position: absolute; top: 14px; right: 14px;
    width: 38px; height: 38px; border-radius: 50%;
    background: rgba(255,253,249,0.85);
    backdrop-filter: blur(8px);
    display: grid; place-items: center;
    color: var(--ink-soft); font-size: 13px;
    z-index: 2; transition: all 0.25s ease;
  }
  .wish-btn:hover { background: var(--paper); color: var(--clay); transform: scale(1.08); }

  .product-info {
    padding: 22px 6px 4px;
    display: flex; flex-direction: column; flex: 1;
  }
  .product-meta {
    display: flex; justify-content: space-between; align-items: center;
    margin-bottom: 10px; gap: 12px;
  }
  .product-cat {
    font-size: 11px; font-weight: 600;
    letter-spacing: 1.2px; text-transform: uppercase;
    color: var(--muted);
  }
  .product-rating {
    display: flex; align-items: center; gap: 4px;
    font-size: 12px; color: var(--ink-soft); font-weight: 500;
  }
  .product-rating i { color: var(--clay); font-size: 11px; }
  .product-name {
    font-family: var(--serif);
    font-size: 22px; font-weight: 400;
    letter-spacing: -0.4px; line-height: 1.2;
    margin-bottom: 8px;
  }
  .product-desc {
    font-size: 13.5px; line-height: 1.55;
    color: var(--ink-soft); margin-bottom: 16px;
    display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
  }
  .product-bottom {
    display: flex; align-items: center; justify-content: space-between;
    gap: 12px; margin-top: auto; padding-top: 4px;
  }
  .price-row { display: flex; align-items: baseline; gap: 8px; }
  .price {
    font-family: var(--serif);
    font-size: 24px; font-weight: 500;
    letter-spacing: -0.5px;
  }
  .price .currency { font-size: 15px; margin-right: 1px; }
  .price-old { font-size: 13px; color: var(--muted); text-decoration: line-through; }
  .add-btn {
    display: inline-flex; align-items: center; gap: 7px;
    padding: 9px 16px; border-radius: 999px;
    background: transparent; border: 1.5px solid var(--line);
    color: var(--ink); font-size: 12.5px; font-weight: 600;
    transition: all 0.25s ease;
  }
  .add-btn:hover { background: var(--ink); color: var(--paper); border-color: var(--ink); }
  .add-btn i { font-size: 11px; }

  /* EDITORIAL QUOTE */
  .editorial {
    margin-top: 112px; padding: 72px 0;
    border-top: 1px solid var(--line);
    border-bottom: 1px solid var(--line);
    text-align: center; background: var(--bg-2);
  }
  .editorial-mark {
    font-family: var(--serif); font-size: 64px;
    line-height: 1; color: var(--clay); opacity: 0.4; margin-bottom: 8px;
  }
  .editorial-quote {
    font-family: var(--serif);
    font-size: clamp(26px, 3vw, 40px);
    line-height: 1.35; letter-spacing: -1px;
    font-weight: 400; font-style: italic;
    max-width: 820px; margin: 0 auto 32px;
  }
  .editorial-quote em { font-style: normal; color: var(--clay); font-weight: 500; }
  .editorial-attr {
    display: flex; align-items: center; justify-content: center;
    gap: 14px; font-size: 13px; color: var(--muted);
  }
  .editorial-attr .line { width: 32px; height: 1px; background: var(--muted); }
  .editorial-attr strong { font-weight: 600; color: var(--ink); }

  /* FEATURE BANNER */
  .feature-banner {
    margin-top: 96px;
    border-radius: 28px; overflow: hidden;
    background: linear-gradient(140deg, #e8ded0 0%, #d9cdb8 100%);
    display: grid; grid-template-columns: 1fr 1fr;
    min-height: 480px; position: relative;
    box-shadow: 0 40px 80px -40px rgba(43,38,32,0.2);
  }
  .feature-banner-content {
    padding: 72px 64px;
    display: flex; flex-direction: column; justify-content: center;
    position: relative; z-index: 2;
  }
  .feature-tag {
    display: inline-flex; align-items: center; gap: 8px;
    font-size: 11.5px; font-weight: 600;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--clay); margin-bottom: 24px;
  }
  .feature-tag::before { content: ''; width: 24px; height: 1px; background: var(--clay); }
  .feature-banner-content h3 {
    font-family: var(--serif);
    font-size: clamp(38px, 4vw, 56px);
    font-weight: 400; line-height: 1.02;
    letter-spacing: -2px; margin-bottom: 20px;
  }
  .feature-banner-content h3 em { font-style: italic; color: var(--clay); }
  .feature-banner-content p {
    font-size: 15.5px; line-height: 1.7;
    color: var(--ink-soft); max-width: 400px; margin-bottom: 32px;
  }
  .feature-banner-visual {
    position: relative; display: grid; place-items: center; overflow: hidden;
  }
  .feature-banner-visual i {
    font-size: 240px; color: rgba(43,38,32,0.85);
    filter: drop-shadow(0 30px 60px rgba(43,38,32,0.3));
    transform: rotate(-8deg);
  }
  .fb-badge {
    position: absolute; bottom: 32px; right: 32px;
    background: var(--paper); border-radius: 16px;
    padding: 16px 22px; box-shadow: 0 16px 40px -8px rgba(43,38,32,0.25);
  }
  .fb-badge .fb-price {
    font-family: var(--serif); font-size: 28px;
    font-weight: 500; letter-spacing: -0.8px; line-height: 1.1;
  }
  .fb-badge .fb-label { font-size: 12px; color: var(--muted); margin-top: 2px; }

  /* NEWSLETTER */
  .newsletter {
    margin: 96px 0; padding: 72px 64px;
    border-radius: 28px; background: var(--ink); color: var(--paper);
    display: grid; grid-template-columns: 1.2fr 1fr;
    gap: 64px; align-items: center;
    position: relative; overflow: hidden;
  }
  .newsletter-content { position: relative; z-index: 1; }
  .newsletter-eyebrow {
    font-size: 11.5px; font-weight: 600;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--clay); margin-bottom: 20px;
    display: flex; align-items: center; gap: 10px;
  }
  .newsletter-eyebrow::before { content: ''; width: 24px; height: 1px; background: var(--clay); }
  .newsletter h3 {
    font-family: var(--serif);
    font-size: clamp(32px, 3.4vw, 48px);
    font-weight: 400; line-height: 1.08;
    letter-spacing: -1.5px; margin-bottom: 16px;
  }
  .newsletter h3 em { font-style: italic; color: var(--sand); }
  .newsletter p {
    font-size: 15px; line-height: 1.7;
    color: rgba(247,243,236,0.65); max-width: 400px;
  }
  .newsletter-form { position: relative; z-index: 1; display: flex; flex-direction: column; gap: 12px; }
  .newsletter-input-wrap {
    display: flex; align-items: center;
    background: rgba(247,243,236,0.08);
    border: 1px solid rgba(247,243,236,0.15);
    border-radius: 999px; padding: 6px 6px 6px 24px;
    transition: border-color 0.25s ease;
  }
  .newsletter-input-wrap:focus-within { border-color: var(--clay); }
  .newsletter-input-wrap input {
    flex: 1; background: none; border: none; outline: none;
    color: var(--paper); font-size: 14.5px; padding: 12px 0;
  }
  .newsletter-input-wrap input::placeholder { color: rgba(247,243,236,0.4); }
  .newsletter-input-wrap button {
    background: var(--paper); color: var(--ink);
    padding: 13px 26px; border-radius: 999px;
    font-size: 13px; font-weight: 600;
    transition: all 0.25s ease;
  }
  .newsletter-input-wrap button:hover { background: var(--clay); color: var(--paper); }
  .newsletter-fineprint { font-size: 12px; color: rgba(247,243,236,0.45); }

  /* FOOTER */
  footer { padding: 72px 0 32px; border-top: 1px solid var(--line); }
  .footer-top {
    display: grid; grid-template-columns: 1.6fr 1fr 1fr 1fr;
    gap: 56px; margin-bottom: 56px;
  }
  .footer-brand .brand { margin-bottom: 20px; }
  .footer-brand p {
    font-size: 14px; line-height: 1.7;
    color: var(--ink-soft); max-width: 300px; margin-bottom: 24px;
  }
  .footer-social { display: flex; gap: 8px; }
  .footer-social a {
    width: 40px; height: 40px; border-radius: 50%;
    border: 1.5px solid var(--line);
    display: grid; place-items: center;
    color: var(--ink-soft); font-size: 14px;
    transition: all 0.25s ease;
  }
  .footer-social a:hover {
    background: var(--ink); color: var(--paper);
    border-color: var(--ink); transform: translateY(-2px);
  }
  .footer-col h4 {
    font-size: 11.5px; font-weight: 700;
    letter-spacing: 1.5px; text-transform: uppercase;
    color: var(--ink); margin-bottom: 20px;
  }
  .footer-col ul li { margin-bottom: 12px; }
  .footer-col ul li a {
    font-size: 14px; color: var(--ink-soft);
    transition: color 0.2s ease;
  }
  .footer-col ul li a:hover { color: var(--clay); }
  .footer-bottom {
    padding-top: 32px; border-top: 1px solid var(--line);
    display: flex; justify-content: space-between; align-items: center;
    gap: 16px; flex-wrap: wrap;
    font-size: 13px; color: var(--muted);
  }
  .footer-bottom-links { display: flex; gap: 24px; flex-wrap: wrap; }
  .footer-bottom-links a:hover { color: var(--ink); }

  /* RESPONSIVE */
  @media (max-width: 1024px) {
    .container { padding: 0 28px; }
    .hero-grid { grid-template-columns: 1fr; gap: 56px; }
    .hero-visual { max-width: 480px; width: 100%; margin: 0 auto; }
    .hero-img i { font-size: 170px; }
    .hero-badge-1 { left: 0; }
    .hero-badge-2 { right: 0; }
    .feature-banner { grid-template-columns: 1fr; }
    .feature-banner-visual { min-height: 320px; order: -1; }
    .feature-banner-visual i { font-size: 160px; }
    .feature-banner-content { padding: 48px 40px; }
    .newsletter { grid-template-columns: 1fr; gap: 36px; padding: 56px 40px; }
    .footer-top { grid-template-columns: 1fr 1fr; gap: 40px; }
    nav.main-nav { display: none; }
  }
  @media (max-width: 760px) {
    .container { padding: 0 20px; }
    .hero { padding: 48px 0 64px; }
    .hero h1 { letter-spacing: -1.5px; }
    .product-grid { grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 24px 16px; }
    .product-name { font-size: 18px; }
    .product-media i { font-size: 74px; }
    section.block { padding-top: 64px; }
    .editorial { margin-top: 72px; padding: 56px 0; }
    .feature-banner { margin-top: 64px; }
    .newsletter { margin: 64px 0; }
    .footer-top { grid-template-columns: 1fr; gap: 32px; }
  }
  @media (max-width: 520px) {
    .header-inner { gap: 12px; padding: 16px 0; min-height: 72px; }
    .brand { font-size: 26px; }
    .hero h1 { font-size: 40px; }
    .hero p { font-size: 15px; }
    .hero-actions { width: 100%; }
    .hero-actions .btn { flex: 1; padding: 14px 20px; font-size: 13.5px; }
    .hero-img i { font-size: 130px; }
    .hero-badge { padding: 10px 16px; }
    .hero-badge-icon { width: 32px; height: 32px; font-size: 13px; }
    .hero-badge-text .num { font-size: 16px; }
    .hero-badge-text .label { font-size: 10.5px; }
    .product-grid { grid-template-columns: 1fr 1fr; gap: 20px 12px; }
    .product-info { padding: 16px 2px 0; }
    .product-name { font-size: 15.5px; }
    .product-desc { display: none; }
    .product-cat { font-size: 10px; letter-spacing: 1px; }
    .price { font-size: 18px; }
    .add-btn { padding: 7px 12px; font-size: 11.5px; }
    .add-btn span { display: none; }
    .footer-top { grid-template-columns: 1fr; }
    .newsletter { padding: 40px 24px; }
  }
</style>
</head>
<body>

<!-- Top bar -->
<div class="topbar">
  <i class="fas fa-truck-fast"></i> Complimentary shipping on orders over $75 · New spring collection now live
</div>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a href="#" class="brand">Morrow<span class="brand-dot"></span></a>

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
    <div class="container hero-grid">
      <div class="hero-content">
        <div class="hero-eyebrow">Spring 2025 · The new edit</div>
        <h1>Objects for<br><em>mindful</em> living.</h1>
        <p>A considered collection of everyday essentials — designed with intention, built to last, and made to bring a little more calm to your day.</p>
        <div class="hero-actions">
          <a href="#products" class="btn btn-primary">Shop the collection <i class="fas fa-arrow-right" style="font-size:13px;"></i></a>
          <a href="#feature" class="btn btn-outline">Read our story</a>
        </div>
      </div>

      <div class="hero-visual">
        <div class="hero-img"><i class="fas fa-headphones"></i></div>
        <div class="hero-badge hero-badge-1">
          <div class="hero-badge-icon"><i class="fas fa-star"></i></div>
          <div class="hero-badge-text">
            <div class="num">4.9 / 5</div>
            <div class="label">12,000+ reviews</div>
          </div>
        </div>
        <div class="hero-badge hero-badge-2">
          <div class="hero-badge-icon"><i class="fas fa-leaf"></i></div>
          <div class="hero-badge-text">
            <div class="num">100%</div>
            <div class="label">Sustainably made</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Logo strip -->
  <div class="logo-strip">
    <div class="container logo-strip-inner">
      <div class="logo-item"><i class="fas fa-feather"></i> Lightweight</div>
      <div class="logo-item"><i class="fas fa-leaf"></i> Sustainable</div>
      <div class="logo-item"><i class="fas fa-award"></i> Premium quality</div>
      <div class="logo-item"><i class="fas fa-recycle"></i> Recyclable</div>
      <div class="logo-item"><i class="fas fa-shield-halved"></i> 2-year warranty</div>
    </div>
  </div>

  <!-- Products -->
  <section class="block container" id="products">
    <div class="section-head">
      <div class="left">
        <div class="section-eyebrow">
