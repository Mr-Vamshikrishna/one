<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>DROP! — Sneakers & Streetwear</title>
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Space+Grotesk:wght@400;500;600;700&family=Archivo:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Space Grotesk', system-ui, sans-serif;
    background: #0d0d0d;
    color: #fff;
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
    --bg: #0d0d0d;
    --bg-2: #161616;
    --card: #1a1a1a;
    --card-2: #222;
    --yellow: #f9e900;
    --lime: #c5ff2b;
    --hot-pink: #ff2d78;
    --electric-blue: #2d7dff;
    --orange: #ff6b1a;
    --white: #fff;
    --muted: #999;
    --line: #2a2a2a;
    --display: 'Archivo Black', sans-serif;
    --sans: 'Archivo', sans-serif;
    --grotesk: 'Space Grotesk', sans-serif;
  }

  .container { width: 100%; max-width: 1400px; margin: 0 auto; padding: 0 28px; }

  /* ===== TOP BAR ===== */
  .topbar {
    background: var(--yellow);
    color: #0d0d0d;
    overflow: hidden;
    padding: 10px 0;
    border-bottom: 2px solid #0d0d0d;
  }
  .topbar-track {
    display: flex;
    gap: 40px;
    width: max-content;
    animation: ticker 20s linear infinite;
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
  }
  .topbar-track span { display: flex; align-items: center; gap: 40px; white-space: nowrap; }
  .topbar-track i { color: var(--hot-pink); }
  @keyframes ticker {
    from { transform: translateX(0); }
    to { transform: translateX(-50%); }
  }

  /* ===== HEADER ===== */
  header {
    position: sticky;
    top: 0;
    z-index: 100;
    background: var(--bg);
    border-bottom: 2px solid var(--line);
  }
  .header-inner {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    padding: 16px 0;
    min-height: 80px;
  }
  .brand {
    font-family: var(--display);
    font-size: 32px;
    letter-spacing: -2px;
    display: flex;
    align-items: center;
    gap: 2px;
    flex-shrink: 0;
    transform: rotate(-2deg);
  }
  .brand .exclaim {
    color: var(--yellow);
    display: inline-block;
    transform: rotate(8deg);
    transition: transform 0.3s ease;
  }
  .brand:hover .exclaim {
    transform: rotate(-8deg) scale(1.2);
  }

  nav.main-nav ul {
    display: flex;
    gap: 4px;
    align-items: center;
  }
  nav.main-nav li a {
    font-family: var(--sans);
    font-size: 13px;
    font-weight: 800;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--muted);
    padding: 8px 18px;
    border-radius: 6px;
    transition: all 0.2s ease;
    position: relative;
  }
  nav.main-nav li a:hover {
    color: var(--yellow);
    background: var(--card);
  }
  nav.main-nav li a.active {
    color: #0d0d0d;
    background: var(--yellow);
  }

  .header-actions {
    display: flex;
    align-items: center;
    gap: 8px;
    flex-shrink: 0;
  }
  .icon-btn {
    width: 42px;
    height: 42px;
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 8px;
    display: grid;
    place-items: center;
    font-size: 15px;
    transition: all 0.2s ease;
    position: relative;
  }
  .icon-btn:hover {
    background: var(--yellow);
    color: #0d0d0d;
    border-color: var(--yellow);
    transform: translateY(-2px);
  }
  .cart-count {
    position: absolute;
    top: -8px;
    right: -8px;
    background: var(--hot-pink);
    color: #fff;
    font-family: var(--sans);
    font-size: 10px;
    font-weight: 900;
    min-width: 20px;
    height: 20px;
    padding: 0 5px;
    border-radius: 20px;
    display: grid;
    place-items: center;
    border: 2px solid var(--bg);
  }

  /* ===== HERO ===== */
  .hero {
    position: relative;
    padding: 40px 0;
    overflow: hidden;
    border-bottom: 2px solid var(--line);
  }
  .hero-grid {
    display: grid;
    grid-template-columns: 1.1fr 1fr;
    gap: 40px;
    align-items: center;
    min-height: 560px;
  }
  .hero-content {
    position: relative;
    z-index: 2;
  }
  .hero-tag {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: var(--hot-pink);
    color: #fff;
    padding: 8px 16px;
    border-radius: 6px;
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 28px;
    transform: rotate(-3deg);
    box-shadow: 4px 4px 0 var(--yellow);
  }
  .hero-tag i { font-size: 11px; }

  .hero h1 {
    font-family: var(--display);
    font-size: clamp(56px, 8vw, 128px);
    line-height: 0.85;
    letter-spacing: -5px;
    margin-bottom: 32px;
    text-transform: uppercase;
  }
  .hero h1 .y {
    color: var(--yellow);
    display: inline-block;
    transform: rotate(-2deg);
  }
  .hero h1 .stroke {
    -webkit-text-stroke: 2px var(--white);
    color: transparent;
  }
  .hero h1 .pink { color: var(--hot-pink); }
  .hero p {
    font-family: var(--grotesk);
    font-size: 17px;
    line-height: 1.6;
    color: var(--muted);
    max-width: 440px;
    margin-bottom: 36px;
  }
  .hero .actions {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
    align-items: center;
  }
  .btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 18px 32px;
    font-family: var(--sans);
    font-weight: 900;
    font-size: 14px;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    border-radius: 8px;
    border: 2px solid transparent;
    transition: all 0.2s cubic-bezier(0.4,0,0.2,1);
    white-space: nowrap;
    position: relative;
  }
  .btn-primary {
    background: var(--yellow);
    color: #0d0d0d;
    border-color: var(--yellow);
    box-shadow: 5px 5px 0 var(--hot-pink);
  }
  .btn-primary:hover {
    transform: translate(-3px, -3px);
    box-shadow: 8px 8px 0 var(--hot-pink);
  }
  .btn-outline {
    background: transparent;
    color: #fff;
    border-color: #fff;
  }
  .btn-outline:hover {
    background: #fff;
    color: #0d0d0d;
  }
  .btn i { font-size: 13px; }

  /* Hero visual */
  .hero-visual {
    position: relative;
    aspect-ratio: 1 / 1;
    display: grid;
    place-items: center;
  }
  .hero-blob {
    position: absolute;
    width: 100%;
    height: 100%;
    background: var(--lime);
    border-radius: 60% 40% 45% 55% / 50% 55% 45% 50%;
    animation: blobMorph 12s ease-in-out infinite;
    opacity: 0.95;
  }
  @keyframes blobMorph {
    0%,100% { border-radius: 60% 40% 45% 55% / 50% 55% 45% 50%; transform: rotate(0deg); }
    33% { border-radius: 40% 60% 55% 45% / 45% 50% 50% 55%; transform: rotate(6deg); }
    66% { border-radius: 55% 45% 40% 60% / 55% 45% 55% 45%; transform: rotate(-6deg); }
  }
  .hero-product {
    position: relative;
    z-index: 2;
    font-size: 240px;
    color: #0d0d0d;
    filter: drop-shadow(0 30px 40px rgba(0,0,0,0.5));
    transform: rotate(-12deg);
    animation: heroSneaker 5s ease-in-out infinite;
  }
  @keyframes heroSneaker {
    0%,100% { transform: rotate(-12deg) translateY(0); }
    50% { transform: rotate(-8deg) translateY(-20px); }
  }
  .hero-sticker {
    position: absolute;
    background: var(--white);
    color: #0d0d0d;
    padding: 12px 20px;
    font-family: var(--sans);
    font-weight: 900;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    border-radius: 4px;
    z-index: 3;
    box-shadow: 4px 4px 0 #0d0d0d;
  }
  .sticker-1 {
    top: 6%;
    right: 4%;
    transform: rotate(8deg);
    background: var(--hot-pink);
    color: #fff;
    animation: wobble 4s ease-in-out infinite;
  }
  .sticker-2 {
    bottom: 14%;
    left: 0;
    transform: rotate(-6deg);
    background: var(--yellow);
    animation: wobble 4s ease-in-out infinite 1s;
  }
  .sticker-3 {
    top: 44%;
    left: -4%;
    transform: rotate(-10deg);
    background: var(--electric-blue);
    color: #fff;
    animation: wobble 4s ease-in-out infinite 2s;
  }
  @keyframes wobble {
    0%,100% { transform: rotate(8deg) scale(1); }
    50% { transform: rotate(4deg) scale(1.05); }
  }

  /* ===== TICKER STRIP ===== */
  .strip {
    background: var(--hot-pink);
    padding: 16px 0;
    border-bottom: 2px solid #0d0d0d;
    overflow: hidden;
  }
  .strip-track {
    display: flex;
    gap: 32px;
    width: max-content;
    animation: ticker 25s linear infinite;
    font-family: var(--display);
    font-size: 28px;
    letter-spacing: -1px;
    text-transform: uppercase;
    color: #fff;
  }
  .strip-track span {
    display: flex;
    align-items: center;
    gap: 32px;
    white-space: nowrap;
  }
  .strip-track .star {
    color: var(--yellow);
    font-size: 24px;
  }

  /* ===== SECTION HEAD ===== */
  section.block { padding: 80px 0 20px; }
  .section-head {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    gap: 24px;
    margin-bottom: 48px;
    flex-wrap: wrap;
  }
  .section-eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--lime);
    margin-bottom: 16px;
  }
  .section-eyebrow::before {
    content: '';
    width: 32px;
    height: 2px;
    background: var(--lime);
  }
  .section-head h2 {
    font-family: var(--display);
    font-size: clamp(40px, 5vw, 68px);
    line-height: 0.92;
    letter-spacing: -3px;
    text-transform: uppercase;
    max-width: 700px;
  }
  .section-head h2 .y { color: var(--yellow); }
  .view-all {
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 900;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 12px 22px;
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 8px;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: all 0.2s ease;
  }
  .view-all:hover {
    background: var(--lime);
    color: #0d0d0d;
    border-color: var(--lime);
    transform: translateY(-2px);
  }

  /* ===== FILTER PILLS ===== */
  .filters {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
    margin-bottom: 40px;
  }
  .filter-btn {
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding: 10px 20px;
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 8px;
    color: var(--muted);
    transition: all 0.2s ease;
  }
  .filter-btn:hover { color: #fff; border-color: #333; }
  .filter-btn.active {
    background: var(--yellow);
    color: #0d0d0d;
    border-color: var(--yellow);
    box-shadow: 3px 3px 0 var(--hot-pink);
    transform: rotate(-1deg);
  }

  /* ===== PRODUCT GRID ===== */
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 24px;
    margin-bottom: 60px;
  }
  .product {
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 16px;
    overflow: hidden;
    transition: all 0.3s cubic-bezier(0.4,0,0.2,1);
    position: relative;
    display: flex;
    flex-direction: column;
    cursor: pointer;
  }
  .product:hover {
    transform: translateY(-6px);
    border-color: var(--yellow);
    box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 0 1px var(--yellow);
  }
  .product-media {
    aspect-ratio: 1 / 0.95;
    display: grid;
    place-items: center;
    position: relative;
    overflow: hidden;
    background: var(--media-bg, #161616);
  }
  .product-media::after {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(circle at 50% 110%, rgba(255,255,255,0.1), transparent 55%);
    pointer-events: none;
  }
  .product-media i {
    font-size: 110px;
    color: var(--icon-color, #fff);
    transition: transform 0.5s cubic-bezier(0.34,1.4,0.64,1);
    position: relative;
    z-index: 1;
    filter: drop-shadow(0 12px 24px rgba(0,0,0,0.5));
  }
  .product:hover .product-media i {
    transform: scale(1.12) rotate(-10deg);
  }

  /* Product color backgrounds */
  .m-1 { --media-bg: linear-gradient(160deg, #2a1f3d, #1a1225); --icon-color: #ff2d78; }
  .m-2 { --media-bg: linear-gradient(160deg, #1a2a1f, #0f1a12); --icon-color: #c5ff2b; }
  .m-3 { --media-bg: linear-gradient(160deg, #3d2a1f, #25160d); --icon-color: #f9e900; }
  .m-4 { --media-bg: linear-gradient(160deg, #1f2a3d, #0d1525); --icon-color: #2d7dff; }
  .m-5 { --media-bg: linear-gradient(160deg, #2d1f3d, #1a1225); --icon-color: #fff; }
  .m-6 { --media-bg: linear-gradient(160deg, #3d1f2a, #25101a); --icon-color: #ff6b1a; }
  .m-7 { --media-bg: linear-gradient(160deg, #1f3d2a, #0f2518); --icon-color: #2dffa3; }
  .m-8 { --media-bg: linear-gradient(160deg, #3d3a1f, #252210); --icon-color: #f9e900; }

  .product-tag {
    position: absolute;
    top: 14px;
    left: 14px;
    padding: 6px 12px;
    font-family: var(--sans);
    font-size: 10px;
    font-weight: 900;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    border-radius: 4px;
    z-index: 2;
  }
  .tag-hot { background: var(--hot-pink); color: #fff; }
  .tag-new { background: var(--lime); color: #0d0d0d; }
  .tag-sale { background: var(--yellow); color: #0d0d0d; }
  .tag-low { background: var(--orange); color: #fff; }

  .wish-btn {
    position: absolute;
    top: 14px;
    right: 14px;
    width: 36px;
    height: 36px;
    background: rgba(13,13,13,0.6);
    backdrop-filter: blur(8px);
    border: 1px solid rgba(255,255,255,0.15);
    border-radius: 8px;
    display: grid;
    place-items: center;
    color: #fff;
    font-size: 13px;
    z-index: 2;
    transition: all 0.2s ease;
  }
  .wish-btn:hover {
    background: var(--hot-pink);
    border-color: var(--hot-pink);
    transform: scale(1.1);
  }

  .product-info {
    padding: 20px 20px 22px;
    display: flex;
    flex-direction: column;
    flex: 1;
  }
  .product-brand {
    font-family: var(--sans);
    font-size: 11px;
    font-weight: 900;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--yellow);
    margin-bottom: 8px;
  }
  .product-name {
    font-family: var(--grotesk);
    font-size: 17px;
    font-weight: 700;
    line-height: 1.25;
    margin-bottom: 6px;
    color: #fff;
  }
  .product-sub {
    font-size: 12px;
    color: var(--muted);
    margin-bottom: 16px;
    font-weight: 500;
  }
  .product-bottom {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    padding-top: 16px;
    border-top: 1px solid var(--line);
    margin-top: auto;
  }
  .price-wrap { display: flex; align-items: baseline; gap: 8px; }
  .price {
    font-family: var(--sans);
    font-size: 22px;
    font-weight: 900;
    letter-spacing: -0.5px;
    color: #fff;
  }
  .price .currency {
    font-size: 14px;
    margin-right: 1px;
    opacity: 0.7;
  }
  .price-old {
    font-size: 12px;
    color: var(--muted);
    text-decoration: line-through;
    font-weight: 600;
  }
  .add-btn {
    width: 42px;
    height: 42px;
    background: var(--card-2);
    border: 1px solid var(--line);
    border-radius: 8px;
    display: grid;
    place-items: center;
    color: #fff;
    font-size: 15px;
    transition: all 0.2s ease;
    flex-shrink: 0;
  }
  .add-btn:hover {
    background: var(--yellow);
    color: #0d0d0d;
    border-color: var(--yellow);
    transform: rotate(90deg);
  }

  /* ===== DROP BANNER ===== */
  .drop-banner {
    margin-top: 40px;
    border-radius: 20px;
    overflow: hidden;
    background: linear-gradient(120deg, #1a1a1a, #2a2a2a);
    border: 2px solid var(--yellow);
    display: grid;
    grid-template-columns: 1.2fr 1fr;
    min-height: 420px;
    position: relative;
  }
  .drop-content {
    padding: 56px 56px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    position: relative;
    z-index: 2;
  }
  .drop-tag {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: var(--hot-pink);
    color: #fff;
    padding: 8px 16px;
    border-radius: 6px;
    font-family: var(--sans);
    font-size: 11px;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    align-self: flex-start;
    margin-bottom: 24px;
    transform: rotate(-2deg);
  }
  .drop-tag i { font-size: 10px; }
  .drop-content h3 {
    font-family: var(--display);
    font-size: clamp(36px, 4.5vw, 60px);
    line-height: 0.92;
    letter-spacing: -2.5px;
    text-transform: uppercase;
    margin-bottom: 20px;
  }
  .drop-content h3 .lime { color: var(--lime); }
  .drop-content h3 .stroke {
    -webkit-text-stroke: 2px #fff;
    color: transparent;
  }
  .drop-content p {
    color: var(--muted);
    font-size: 15px;
    line-height: 1.6;
    max-width: 380px;
    margin-bottom: 28px;
  }
  .drop-visual {
    position: relative;
    display: grid;
    place-items: center;
    background: var(--lime);
    overflow: hidden;
  }
  .drop-visual::before {
    content: 'DROP!';
    position: absolute;
    font-family: var(--display);
    font-size: 200px;
    letter-spacing: -10px;
    color: #0d0d0d;
    opacity: 0.08;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) rotate(-8deg);
    white-space: nowrap;
  }
  .drop-visual i {
    font-size: 200px;
    color: #0d0d0d;
    position: relative;
    z-index: 1;
    transform: rotate(-10deg);
    filter: drop-shadow(0 20px 40px rgba(0,0,0,0.3));
  }
  .drop-countdown {
    position: absolute;
    bottom: 24px;
    left: 24px;
    right: 24px;
    background: rgba(13,13,13,0.9);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    padding: 16px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    z-index: 2;
    border: 1px solid rgba(255,255,255,0.1);
  }
  .countdown-item {
    text-align: center;
    flex: 1;
  }
  .countdown-item .num {
    font-family: var(--sans);
    font-size: 26px;
    font-weight: 900;
    line-height: 1;
    color: var(--yellow);
  }
  .countdown-item .lbl {
    font-family: var(--sans);
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--muted);
    margin-top: 4px;
  }
  .countdown-sep {
    color: var(--muted);
    font-size: 20px;
    font-weight: 900;
  }

  /* ===== BRANDS STRIP ===== */
  .brands {
    padding: 60px 0;
    border-top: 2px solid var(--line);
    border-bottom: 2px solid var(--line);
    margin-top: 60px;
    overflow: hidden;
  }
  .brands-track {
    display: flex;
    gap: 64px;
    width: max-content;
    animation: ticker 30s linear infinite;
    align-items: center;
  }
  .brands-track span {
    font-family: var(--display);
    font-size: 40px;
    letter-spacing: -2px;
    color: var(--card-2);
    text-transform: uppercase;
    transition: color 0.3s ease;
    white-space: nowrap;
  }
  .brands-track span:hover { color: var(--yellow); }

  /* ===== FOOTER ===== */
  footer {
    background: var(--bg-2);
    border-top: 2px solid var(--line);
    padding: 72px 0 32px;
  }
  .footer-top {
    display: grid;
    grid-template-columns: 1.6fr 1fr 1fr 1fr;
    gap: 48px;
    margin-bottom: 56px;
  }
  .footer-brand .brand { margin-bottom: 20px; }
  .footer-brand p {
    color: var(--muted);
    font-size: 14px;
    line-height: 1.7;
    max-width: 300px;
    margin-bottom: 24px;
  }
  .footer-social { display: flex; gap: 8px; }
  .footer-social a {
    width: 42px;
    height: 42px;
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 8px;
    display: grid;
    place-items: center;
    color: var(--muted);
    font-size: 15px;
    transition: all 0.2s ease;
  }
  .footer-social a:hover {
    background: var(--yellow);
    color: #0d0d0d;
    border-color: var(--yellow);
    transform: translateY(-3px);
  }
  .footer-col h4 {
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--yellow);
    margin-bottom: 22px;
  }
  .footer-col ul li { margin-bottom: 12px; }
  .footer-col ul li a {
    color: var(--muted);
    font-size: 14px;
    transition: color 0.2s ease;
  }
  .footer-col ul li a:hover { color: #fff; }
  .footer-bottom {
    padding-top: 32px;
    border-top: 1px solid var(--line);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 16px;
    font-family: var(--sans);
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
  }

  /* ===== RESPONSIVE ===== */
  @media (max-width: 1024px) {
    .hero-grid { grid-template-columns: 1fr; gap: 32px; min-height: auto; padding: 40px 0; }
    .hero-visual { max-width: 420px; margin: 0 auto; width: 100%; }
    .hero-product { font-size: 180px; }
    .drop-banner { grid-template-columns: 1fr; }
    .drop-visual { min-height: 300px; order: -1; }
    .drop-visual i { font-size: 150px; }
    .drop-content { padding: 40px 32px; }
    .footer-top { grid-template-columns: 1fr 1fr; gap: 40px; }
    nav.main-nav { display: none; }
  }
  @media (max-width: 760px) {
    .container { padding: 0 20px; }
    .hero h1 { letter-spacing: -3px; }
    .brand { font-size: 26px; }
    .product-grid { grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 16px; }
    .product-media i { font-size: 80px; }
    .section-head h2 { letter-spacing: -2px; }
    .strip-track { font-size: 22px; }
    .brands-track span { font-size: 28px; }
  }
  @media (max-width: 540px) {
    .header-inner { gap: 12px; padding: 14px 0; min-height: 68px; }
    .hero { padding: 24px 0; }
    .hero h1 { font-size: 52px; }
    .hero p { font-size: 14px; }
    .hero .actions { width: 100%; }
    .hero .btn { flex: 1; padding: 16px 20px; font-size: 12px; }
    .hero-tag { font-size: 11px; padding: 6px 12px; }
    .hero-product { font-size: 130px; }
    .hero-sticker { font-size: 11px; padding: 9px 14px; }
    .sticker-1 { top: 4%; right: 2%; }
    .sticker-3 { left: 0; }
    .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
    .product-info { padding: 14px 14px 16px; }
    .product-name { font-size: 14px; }
    .product-sub { font-size: 11px; }
    .product-brand { font-size: 10px; }
    .price { font-size: 18px; }
    .add-btn { width: 34px; height: 34px; font-size: 12px; }
    .section-head h2 { font-size: 32px; letter-spacing: -1.5px; }
    .footer-top { grid-template-columns: 1fr; gap: 32px; }
    .footer-bottom { flex-direction: column; text-align: center; }
    .drop-content { padding: 32px 24px; }
    .drop-visual i { font-size: 120px; }
    .drop-countdown { padding: 12px 14px; }
    .countdown-item .num { font-size: 20px; }
    .strip-track { font-size: 18px; gap: 24px; }
    .strip-track span { gap: 24px; }
  }
</style>
</head>
<body>

<!-- Ticker -->
<div class="topbar">
  <div class="topbar-track">
    <span>🔥 New drop live now <i class="fas fa-star"></i> Free shipping over $100 <i class="fas fa-star"></i> Authenticity guaranteed <i class="fas fa-star"></i> 60-day returns <i class="fas fa-star"></i></span>
    <span>🔥 New drop live now <i class="fas fa-star"></i> Free shipping over $100 <i class="fas fa-star"></i> Authenticity guaranteed <i class="fas fa-star"></i> 60-day returns <i class="fas fa-star"></i></span>
  </div>
</div>

<!-- Header -->
<header>
  <div class="container header-inner">
    <a href="#" class="brand">DROP<span class="exclaim">!</span></a>
   
