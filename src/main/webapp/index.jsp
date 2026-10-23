<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Nexus — Grand Object Store</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500&family=Manrope:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Manrope', system-ui, sans-serif;
    background: #0a0a0d;
    color: #f0ece2;
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
    --bg: #0a0a0d;
    --bg-2: #101014;
    --surface: #15151a;
    --surface-2: #1c1c23;
    --line: rgba(240,236,226,0.08);
    --line-2: rgba(240,236,226,0.14);
    --ink: #f0ece2;
    --ink-soft: #b5afa0;
    --muted: #7a7568;
    --muted-2: #4a463e;
    --gold: #d4af5c;
    --gold-2: #f5d98a;
    --gold-glow: rgba(212,175,92,0.35);
    --cream: #f6f1e4;
    --serif: 'Cormorant Garamond', Georgia, serif;
    --sans: 'Manrope', system-ui, sans-serif;
    --radius: 22px;
    --ease: 0.35s cubic-bezier(0.4,0,0.2,1);
    --container: 1360px;
  }

  .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 40px; }

  /* ===== TOP ANNOUNCEMENT ===== */
  .announce {
    background: linear-gradient(90deg, #0a0a0d, #1c1508, #0a0a0d);
    text-align: center;
    padding: 12px 20px;
    font-size: 12px;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--gold-2);
    border-bottom: 1px solid var(--line);
    font-weight: 500;
  }
  .announce i { margin: 0 8px; font-size: 10px; }

  /* ===== HEADER ===== */
  header {
    position: sticky; top: 0; z-index: 100;
    background: rgba(10,10,13,0.85);
    backdrop-filter: blur(24px) saturate(180%);
    border-bottom: 1px solid var(--line);
  }
  .header-inner {
    display: flex; align-items: center; justify-content: space-between;
    gap: 32px; padding: 20px 0; min-height: 84px;
  }
  .brand {
    font-family: var(--serif);
    font-size: 34px;
    font-weight: 500;
    letter-spacing: 1px;
    display: flex; align-items: center; gap: 6px;
    flex-shrink: 0;
  }
  .brand .spark {
    color: var(--gold);
    font-size: 12px;
    margin-bottom: 14px;
  }

  nav.main-nav ul { display: flex; gap: 40px; align-items: center; }
  nav.main-nav li a {
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--ink-soft);
    padding: 6px 0;
    position: relative;
    transition: var(--ease);
  }
  nav.main-nav li a::after {
    content: '';
    position: absolute;
    bottom: -2px; left: 0;
    width: 0; height: 1px;
    background: var(--gold);
    transition: width 0.3s ease;
  }
  nav.main-nav li a:hover,
  nav.main-nav li a.active { color: var(--gold-2); }
  nav.main-nav li a:hover::after,
  nav.main-nav li a.active::after { width: 100%; }

  .header-actions { display: flex; align-items: center; gap: 8px; flex-shrink: 0; }
  .icon-btn {
    width: 44px; height: 44px;
    border-radius: 50%;
    display: grid; place-items: center;
    font-size: 15px;
    color: var(--ink-soft);
    border: 1px solid var(--line);
    background: rgba(255,255,255,0.02);
    transition: var(--ease);
    position: relative;
  }
  .icon-btn:hover {
    color: var(--gold);
    border-color: var(--gold);
    background: rgba(212,175,92,0.06);
  }
  .cart-count {
    position: absolute;
    top: -4px; right: -4px;
    background: var(--gold);
    color: #0a0a0d;
    font-size: 10px;
    font-weight: 700;
    min-width: 18px; height: 18px;
    padding: 0 4px;
    border-radius: 20px;
    display: grid; place-items: center;
    border: 2px solid #0a0a0d;
  }

  /* ===== HERO ===== */
  .hero {
    position: relative;
    padding: 100px 0 120px;
    overflow: hidden;
    background: radial-gradient(ellipse at 50% 0%, rgba(212,175,92,0.08) 0%, transparent 55%);
  }
  .hero::before {
    content: '';
    position: absolute;
    top: -20%; left: 50%; transform: translateX(-50%);
    width: 1200px; height: 1200px;
    border-radius: 50%;
    border: 1px solid var(--line);
    pointer-events: none;
  }
  .hero::after {
    content: '';
    position: absolute;
    top: -10%; left: 50%; transform: translateX(-50%);
    width: 800px; height: 800px;
    border-radius: 50%;
    border: 1px solid var(--line);
    pointer-events: none;
  }
  .hero-grid {
    position: relative;
    display: grid;
    grid-template-columns: 1.05fr 0.95fr;
    gap: 80px;
    align-items: center;
    z-index: 1;
  }
  .hero-eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 14px;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--gold);
    margin-bottom: 32px;
  }
  .hero-eyebrow .line {
    width: 40px; height: 1px;
    background: var(--gold);
  }
  .hero h1 {
    font-family: var(--serif);
    font-size: clamp(56px, 6.5vw, 104px);
    font-weight: 400;
    line-height: 0.92;
    letter-spacing: -2px;
    margin-bottom: 32px;
  }
  .hero h1 em {
    font-style: italic;
    font-weight: 500;
    background: linear-gradient(120deg, #f5d98a, #d4af5c 60%, #b8943e);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .hero p {
    font-size: 16px;
    line-height: 1.8;
    color: var(--ink-soft);
    max-width: 460px;
    margin-bottom: 44px;
    font-weight: 300;
  }
  .hero-actions { display: flex; gap: 16px; flex-wrap: wrap; align-items: center; }

  .btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    padding: 18px 36px;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    border-radius: 999px;
    border: 1px solid transparent;
    transition: var(--ease);
    white-space: nowrap;
  }
  .btn-gold {
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    color: #0a0a0d;
    box-shadow: 0 12px 40px -12px var(--gold-glow);
  }
  .btn-gold:hover {
    transform: translateY(-2px);
    box-shadow: 0 20px 50px -12px var(--gold-glow);
  }
  .btn-ghost {
    background: transparent;
    color: var(--ink);
    border-color: var(--line-2);
  }
  .btn-ghost:hover {
    border-color: var(--gold);
    color: var(--gold-2);
  }

  /* Hero visual */
  .hero-visual {
    position: relative;
    aspect-ratio: 1 / 1.08;
    display: grid;
    place-items: center;
  }
  .hero-ring {
    position: absolute;
    border-radius: 50%;
    border: 1px solid var(--line-2);
  }
  .hero-ring.r1 { inset: 0; animation: rotate 50s linear infinite; }
  .hero-ring.r2 { inset: 10%; border-style: dashed; animation: rotate 40s linear infinite reverse; }
  .hero-ring.r3 { inset: 22%; border-color: rgba(212,175,92,0.2); animation: rotate 30s linear infinite; }
  @keyframes rotate { to { transform: rotate(360deg); } }
  .hero-ring::before {
    content: '';
    position: absolute;
    top: -4px; left: 50%;
    width: 8px; height: 8px;
    border-radius: 50%;
    background: var(--gold);
    box-shadow: 0 0 16px var(--gold);
    transform: translateX(-50%);
  }
  .hero-ring.r2::before { top: 50%; left: -4px; background: var(--gold-2); }
  .hero-ring.r3::before { display: none; }

  .hero-glow {
    position: absolute;
    width: 62%; height: 62%;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(212,175,92,0.35), transparent 65%);
    filter: blur(60px);
    animation: glowPulse 5s ease-in-out infinite;
  }
  @keyframes glowPulse {
    0%,100% { transform: scale(1); opacity: 0.8; }
    50% { transform: scale(1.15); opacity: 1; }
  }

  .hero-card {
    position: relative;
    width: 58%;
    aspect-ratio: 3 / 4;
    border-radius: 30px;
    background: linear-gradient(155deg, #1a1a20 0%, #0e0e12 100%);
    border: 1px solid var(--line-2);
    box-shadow:
      0 60px 100px -30px rgba(0,0,0,0.9),
      0 0 80px -20px rgba(212,175,92,0.15),
      inset 0 1px 0 rgba(240,236,226,0.06);
    display: flex; flex-direction: column;
    padding: 28px;
    transform: rotate(-4deg);
    z-index: 2;
    overflow: hidden;
  }
  .hero-card::before {
    content: '';
    position: absolute;
    top: -30%; right: -30%;
    width: 100%; height: 100%;
    background: radial-gradient(circle, rgba(212,175,92,0.18), transparent 65%);
  }
  .hero-card-top {
    display: flex; justify-content: space-between; align-items: center;
    position: relative; z-index: 1;
  }
  .hero-card-tag {
    font-size: 10px; font-weight: 700;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--gold);
  }
  .hero-card-dots { display: flex; gap: 4px; }
  .hero-card-dots span { width: 6px; height: 6px; border-radius: 50%; background: var(--line-2); }
  .hero-card-dots span:first-child { background: var(--gold); }
  .hero-icon {
    flex: 1;
    display: grid; place-items: center;
    font-size: 96px;
    color: var(--cream);
    position: relative; z-index: 1;
    filter: drop-shadow(0 12px 40px rgba(212,175,92,0.35));
  }
  .hero-card-label {
    font-size: 10px; font-weight: 600;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--muted); margin-bottom: 8px;
  }
  .hero-card-title {
    font-family: var(--serif);
    font-size: 24px;
    font-weight: 500;
    letter-spacing: -0.3px;
    line-height: 1.2;
    margin-bottom: 18px;
    position: relative; z-index: 1;
  }
  .hero-card-price {
    display: flex; justify-content: space-between; align-items: center;
    padding-top: 16px;
    border-top: 1px solid var(--line);
    position: relative; z-index: 1;
  }
  .hero-card-price .p {
    font-family: var(--serif);
    font-size: 26px;
    font-weight: 500;
    color: var(--gold-2);
  }
  .hero-card-cta {
    width: 40px; height: 40px;
    border-radius: 50%;
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    color: #0a0a0d;
    display: grid; place-items: center;
    font-size: 13px;
  }

  .float-chip {
    position: absolute;
    background: rgba(21,21,26,0.92);
    backdrop-filter: blur(16px);
    border: 1px solid var(--line-2);
    border-radius: 14px;
    padding: 14px 18px;
    display: flex; align-items: center; gap: 12px;
    z-index: 3;
    box-shadow: 0 24px 60px -12px rgba(0,0,0,0.7);
    animation: floatY 5s ease-in-out infinite;
  }
  .fc-icon {
    width: 38px; height: 38px;
    border-radius: 10px;
    display: grid; place-items: center;
    font-size: 15px;
  }
  .fc-num { font-size: 15px; font-weight: 700; line-height: 1.1; }
  .fc-label { font-size: 11px; color: var(--muted); }
  .fc-1 { top: 4%; right: -6%; }
  .fc-1 .fc-icon { background: rgba(212,175,92,0.12); color: var(--gold); }
  .fc-2 { bottom: 10%; left: -8%; animation-delay: 1.5s; }
  .fc-2 .fc-icon { background: rgba(0,214,143,0.12); color: #00d68f; }
  .fc-3 { top: 46%; left: -12%; animation-delay: 0.8s; }
  .fc-3 .fc-icon { background: rgba(139,92,246,0.12); color: #a78bfa; }
  @keyframes floatY {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(-14px); }
  }

  /* ===== MARQUEE ===== */
  .marquee {
    border-top: 1px solid var(--line);
    border-bottom: 1px solid var(--line);
    background: var(--bg-2);
    overflow: hidden;
    padding: 26px 0;
  }
  .marquee-track {
    display: flex;
    gap: 80px;
    width: max-content;
    animation: ticker 40s linear infinite;
  }
  .marquee-track span {
    font-family: var(--serif);
    font-size: 32px;
    font-weight: 400;
    letter-spacing: 1px;
    color: var(--ink-soft);
    display: flex;
    align-items: center;
    gap: 80px;
    white-space: nowrap;
  }
  .marquee-track span em {
    font-style: italic;
    color: var(--gold);
  }
  .marquee-track span i { color: var(--gold); font-size: 16px; }
  @keyframes ticker {
    from { transform: translateX(0); }
    to { transform: translateX(-50%); }
  }

  /* ===== SECTION HEAD ===== */
  section.block { padding-top: 100px; }
  .section-head {
    display: flex; justify-content: space-between; align-items: flex-end;
    gap: 40px; margin-bottom: 56px; flex-wrap: wrap;
  }
  .section-eyebrow {
    font-size: 11px; font-weight: 600;
    letter-spacing: 3px; text-transform: uppercase;
    color: var(--gold); margin-bottom: 18px;
    display: flex; align-items: center; gap: 14px;
  }
  .section-eyebrow::before {
    content: '';
    width: 40px; height: 1px;
    background: var(--gold);
  }
  .section-head h2 {
    font-family: var(--serif);
    font-size: clamp(38px, 4.5vw, 62px);
    font-weight: 400;
    line-height: 1.02;
    letter-spacing: -1.5px;
  }
  .section-head h2 em {
    font-style: italic;
    background: linear-gradient(120deg, #f5d98a, #d4af5c 60%, #b8943e);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .view-all {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--ink);
    display: inline-flex;
    align-items: center;
    gap: 12px;
    padding: 12px 26px;
    border: 1px solid var(--line-2);
    border-radius: 999px;
    transition: var(--ease);
  }
  .view-all:hover {
    border-color: var(--gold);
    color: var(--gold-2);
    gap: 16px;
  }

  /* ===== FILTERS ===== */
  .filters {
    display: flex; gap: 10px; flex-wrap: wrap;
    margin-bottom: 48px;
  }
  .filter-btn {
    padding: 11px 24px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    border: 1px solid var(--line);
    color: var(--ink-soft);
    background: transparent;
    transition: var(--ease);
  }
  .filter-btn:hover { color: var(--gold-2); border-color: var(--line-2); }
  .filter-btn.active {
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    color: #0a0a0d;
    border-color: transparent;
    box-shadow: 0 8px 24px -8px var(--gold-glow);
  }

  /* ===== PRODUCT GRID ===== */
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
    gap: 32px;
    padding-bottom: 20px;
  }
  .product {
    background: var(--surface);
    border-radius: var(--radius);
    border: 1px solid var(--line);
    overflow: hidden;
    display: flex; flex-direction: column;
    transition: var(--ease);
    position: relative;
  }
  .product:hover {
    transform: translateY(-8px);
    border-color: rgba(212,175,92,0.35);
    box-shadow:
      0 40px 80px -24px rgba(0,0,0,0.85),
      0 0 0 1px rgba(212,175,92,0.12),
      0 0 60px -20px rgba(212,175,92,0.15);
  }
  .product-media {
    aspect-ratio: 1 / 1;
    position: relative;
    display: grid; place-items: center;
    overflow: hidden;
    background: var(--media-bg, #16161c);
    border-bottom: 1px solid var(--line);
  }
  .product-media::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(circle at 50% 110%, var(--glow, rgba(212,175,92,0.2)), transparent 60%);
    opacity: 0.6;
    transition: var(--ease);
  }
  .product:hover .product-media::before { opacity: 1; }
  .product-media i {
    font-size: 88px;
    color: var(--cream);
    position: relative;
    z-index: 1;
    transition: transform 0.5s cubic-bezier(0.34,1.56,0.64,1);
    filter: drop-shadow(0 12px 32px rgba(0,0,0,0.5));
  }
  .product:hover .product-media i {
    transform: scale(1.1) rotate(-5deg);
  }

  .pm-1 { --media-bg: linear-gradient(160deg, #24202a, #14121a); --glow: rgba(212,175,92,0.28); }
  .pm-2 { --media-bg: linear-gradient(160deg, #1a1f2a, #101420); --glow: rgba(120,160,255,0.22); }
  .pm-3 { --media-bg: linear-gradient(160deg, #2a241a, #1a1610); --glow: rgba(245,217,138,0.28); }
  .pm-4 { --media-bg: linear-gradient(160deg, #1a2a24, #101a16); --glow: rgba(0,214,143,0.22); }
  .pm-5 { --media-bg: linear-gradient(160deg, #2a1a2a, #1a101a); --glow: rgba(167,139,250,0.24); }
  .pm-6 { --media-bg: linear-gradient(160deg, #2a1a1a, #1a1010); --glow: rgba(255,120,120,0.22); }
  .pm-7 { --media-bg: linear-gradient(160deg, #1a242a, #101418); --glow: rgba(120,200,220,0.22); }
  .pm-8 { --media-bg: linear-gradient(160deg, #24241a, #181810); --glow: rgba(212,175,92,0.24); }
  .pm-9 { --media-bg: linear-gradient(160deg, #2a1a24, #1a1016); --glow: rgba(255,150,200,0.22); }

  .badge {
    position: absolute;
    top: 16px; left: 16px;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 6px 14px;
    border-radius: 999px;
    z-index: 2;
    backdrop-filter: blur(8px);
  }
  .badge-sale { background: rgba(255,92,43,0.9); color: #fff; }
  .badge-new { background: rgba(212,175,92,0.9); color: #0a0a0d; }
  .badge-hot { background: rgba(240,236,226,0.95); color: #0a0a0d; }

  .wish-btn {
    position: absolute;
    top: 14px; right: 14px;
    width: 42px; height: 42px;
    border-radius: 50%;
    background: rgba(10,10,13,0.55);
    backdrop-filter: blur(12px);
    border: 1px solid var(--line-2);
    display: grid; place-items: center;
    color: var(--ink-soft);
    font-size: 14px;
    z-index: 2;
    transition: var(--ease);
  }
  .wish-btn:hover {
    color: var(--gold);
    border-color: var(--gold);
    background: rgba(212,175,92,0.15);
    transform: scale(1.08);
  }
  .wish-btn.active {
    color: var(--gold);
    background: rgba(212,175,92,0.2);
    border-color: var(--gold);
    box-shadow: 0 0 20px rgba(212,175,92,0.4);
  }

  .product-info {
    padding: 24px 24px 22px;
    display: flex; flex-direction: column; flex: 1;
  }
  .product-cat {
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--gold);
    margin-bottom: 10px;
  }
  .product-name {
    font-family: var(--serif);
    font-size: 24px;
    font-weight: 500;
    line-height: 1.2;
    letter-spacing: -0.3px;
    margin-bottom: 10px;
  }
  .product-desc {
    font-size: 13px;
    color: var(--ink-soft);
    line-height: 1.6;
    margin-bottom: 20px;
    flex: 1;
    display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
  }
  .product-bottom {
    display: flex; align-items: center; justify-content: space-between;
    padding-top: 18px;
    border-top: 1px solid var(--line);
    gap: 12px;
  }
  .price-wrap { display: flex; align-items: baseline; gap: 10px; }
  .price {
    font-family: var(--serif);
    font-size: 28px;
    font-weight: 500;
    letter-spacing: -0.5px;
    color: var(--cream);
  }
  .price .currency { font-size: 15px; opacity: 0.6; margin-right: 1px; }
  .price-old {
    font-size: 13px;
    color: var(--muted-2);
    text-decoration: line-through;
  }

  .add-btn {
    display: inline-flex; align-items: center; gap: 8px;
    padding: 12px 20px;
    border-radius: 999px;
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    color: #0a0a0d;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    transition: var(--ease);
    white-space: nowrap;
  }
  .add-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 28px -8px var(--gold-glow);
  }
  .add-btn.added {
    background: linear-gradient(135deg, #4ade80, #00d68f);
    box-shadow: 0 12px 28px -8px rgba(0,214,143,0.5);
  }
  .add-btn i { font-size: 10px; }

  /* ===== FEATURE BANNER ===== */
  .feature-banner {
    margin-top: 100px;
    border-radius: 28px;
    overflow: hidden;
    background: linear-gradient(120deg, #15151a 0%, #1c1608 50%, #15151a 100%);
    border: 1px solid var(--line-2);
    position: relative;
    padding: 72px;
    display: flex; align-items: center; justify-content: space-between;
    gap: 48px; flex-wrap: wrap;
  }
  .feature-banner::before {
    content: '';
    position: absolute;
    top: -50%; left: -10%;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(212,175,92,0.18), transparent 65%);
    pointer-events: none;
  }
  .feature-content { position: relative; z-index: 2; max-width: 620px; }
  .feature-tag {
    display: inline-flex; align-items: center; gap: 10px;
    padding: 8px 18px;
    background: rgba(212,175,92,0.1);
    border: 1px solid rgba(212,175,92,0.3);
    border-radius: 999px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--gold);
    margin-bottom: 24px;
  }
  .feature-content h3 {
    font-family: var(--serif);
    font-size: clamp(36px, 4.5vw, 60px);
    font-weight: 400;
    line-height: 1.02;
    letter-spacing: -1.5px;
    margin-bottom: 20px;
  }
  .feature-content h3 em {
    font-style: italic;
    background: linear-gradient(120deg, #f5d98a, #d4af5c 60%, #b8943e);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .feature-content p {
    color: var(--ink-soft);
    font-size: 15px;
    line-height: 1.8;
    margin-bottom: 32px;
    max-width: 500px;
    font-weight: 300;
  }
  .feature-badge {
    position: relative;
    z-index: 2;
    width: 200px; height: 200px;
    border-radius: 50%;
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    display: grid; place-items: center;
    color: #0a0a0d;
    text-align: center;
    box-shadow: 0 0 80px rgba(212,175,92,0.5);
    animation: floatY 6s ease-in-out infinite;
  }
  .feature-badge .fb-num {
    font-family: var(--serif);
    font-size: 64px;
    font-weight: 500;
    line-height: 1;
  }
  .feature-badge .fb-label {
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-top: 4px;
  }

  /* ===== FOOTER ===== */
  footer {
    margin-top: 100px;
    border-top: 1px solid var(--line);
    padding: 72px 0 32px;
    background: var(--bg-2);
  }
  .footer-top {
    display: grid;
    grid-template-columns: 1.6fr 1fr 1fr 1.4fr;
    gap: 56px;
    margin-bottom: 56px;
  }
  .footer-brand .brand { margin-bottom: 20px; font-size: 28px; }
  .footer-brand p {
    font-size: 13.5px;
    color: var(--ink-soft);
    line-height: 1.8;
    max-width: 300px;
    font-weight: 300;
  }
  .footer-col h4 {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2.5px;
    text-transform: uppercase;
    color: var(--gold);
    margin-bottom: 22px;
  }
  .footer-col ul li { margin-bottom: 14px; }
  .footer-col ul li a {
    font-size: 14px;
    color: var(--ink-soft);
    transition: var(--ease);
    font-weight: 300;
  }
  .footer-col ul li a:hover { color: var(--gold-2); }
  .newsletter { display: flex; gap: 8px; margin-top: 18px; }
  .newsletter input {
    flex: 1;
    padding: 13px 18px;
    border-radius: 999px;
    border: 1px solid var(--line-2);
    background: var(--surface);
    color: var(--ink);
    font-size: 13px;
    outline: none;
    transition: var(--ease);
  }
  .newsletter input::placeholder { color: var(--muted-2); }
  .newsletter input:focus { border-color: var(--gold); }
  .newsletter button {
    width: 46px; height: 46px;
    border-radius: 50%;
    background: linear-gradient(135deg, #f5d98a, #d4af5c);
    color: #0a0a0
