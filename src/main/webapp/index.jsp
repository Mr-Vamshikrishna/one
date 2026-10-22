<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>LUXE — Curated Essentials</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Inter', system-ui, sans-serif;
    background: #0a0a10;
    color: #eaeaf2;
    line-height: 1.55;
    -webkit-font-smoothing: antialiased;
    overflow-x: hidden;
  }
  a { text-decoration: none; color: inherit; }
  button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
  input { font: inherit; }
  ul { list-style: none; }

  :root {
    --bg: #0a0a10;
    --bg-2: #101018;
    --card: #15151f;
    --card-2: #1c1c2a;
    --line: rgba(255,255,255,0.07);
    --line-2: rgba(255,255,255,0.12);
    --ink: #eaeaf2;
    --muted: #8a8aa0;
    --muted-2: #5a5a70;
    --pink: #ff3d8b;
    --violet: #8b5cf6;
    --cyan: #22d3ee;
    --gold: #f5c542;
    --green: #00d68f;
    --serif: 'Syne', sans-serif;
    --radius: 20px;
    --ease: 0.3s cubic-bezier(0.4,0,0.2,1);
  }

  .container { width: 100%; max-width: 1320px; margin: 0 auto; padding: 0 32px; }

  /* TOPBAR */
  .topbar {
    background: linear-gradient(90deg, #ff3d8b, #8b5cf6, #22d3ee, #ff3d8b);
    background-size: 300% 100%;
    animation: gradientShift 8s linear infinite;
    text-align: center;
    padding: 10px 16px;
    font-size: 12.5px;
    font-weight: 600;
    letter-spacing: 0.4px;
    color: #fff;
  }
  @keyframes gradientShift { 0% { background-position: 0% 50%; } 100% { background-position: 300% 50%; } }

  /* HEADER */
  header {
    position: sticky; top: 0; z-index: 100;
    background: rgba(10,10,16,0.85);
    backdrop-filter: blur(24px) saturate(180%);
    border-bottom: 1px solid var(--line);
  }
  .header-inner {
    display: flex; align-items: center; justify-content: space-between;
    gap: 28px; padding: 18px 0; min-height: 78px;
  }
  .brand {
    font-family: var(--serif);
    font-weight: 800; font-size: 26px; letter-spacing: -1px;
    display: flex; align-items: center; gap: 3px; flex-shrink: 0;
  }
  .brand .spark {
    display: inline-block;
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6, #22d3ee);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: spinSpark 6s linear infinite;
  }
  @keyframes spinSpark { to { transform: rotate(360deg); } }

  nav.main-nav ul { display: flex; gap: 4px; align-items: center; }
  nav.main-nav li a {
    padding: 9px 18px; border-radius: 40px;
    font-weight: 500; font-size: 14px; color: var(--muted);
    transition: var(--ease);
  }
  nav.main-nav li a:hover, nav.main-nav li a.active {
    color: var(--ink); background: var(--card);
  }

  .header-actions { display: flex; align-items: center; gap: 6px; flex-shrink: 0; }
  .icon-btn {
    width: 44px; height: 44px; border-radius: 12px;
    display: grid; place-items: center;
    font-size: 16px; color: var(--muted);
    border: 1px solid var(--line);
    background: var(--card);
    transition: var(--ease); position: relative;
  }
  .icon-btn:hover { color: var(--ink); border-color: var(--line-2); background: var(--card-2); transform: translateY(-1px); }
  .cart-count {
    position: absolute; top: -6px; right: -6px;
    background: var(--pink); color: #fff;
    font-size: 10px; font-weight: 700;
    min-width: 19px; height: 19px; padding: 0 5px;
    border-radius: 20px; display: grid; place-items: center;
    border: 2px solid var(--bg);
  }

  /* HERO */
  .hero { position: relative; padding: 88px 0 100px; overflow: hidden; }
  .hero::before {
    content: ''; position: absolute; top: -30%; left: 50%; transform: translateX(-50%);
    width: 900px; height: 900px;
    background: radial-gradient(circle, rgba(139,92,246,0.22), transparent 55%);
    pointer-events: none;
  }
  .hero::after {
    content: ''; position: absolute; top: 20%; right: -10%;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(255,61,139,0.15), transparent 55%);
    pointer-events: none;
  }
  .hero-grid {
    position: relative; display: grid;
    grid-template-columns: 1.05fr 0.95fr; gap: 64px;
    align-items: center; z-index: 1;
  }
  .hero-badge {
    display: inline-flex; align-items: center; gap: 10px;
    padding: 8px 18px;
    background: rgba(139,92,246,0.12);
    border: 1px solid rgba(139,92,246,0.35);
    border-radius: 40px;
    font-size: 12px; font-weight: 600;
    letter-spacing: 0.5px; text-transform: uppercase;
    color: #c4b5fd; margin-bottom: 28px;
  }
  .hero-badge .pulse {
    width: 6px; height: 6px; border-radius: 50%;
    background: var(--green); box-shadow: 0 0 10px var(--green);
    animation: pulseDot 2s infinite;
  }
  @keyframes pulseDot {
    0%,100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.5; transform: scale(1.3); }
  }
  .hero h1 {
    font-family: var(--serif);
    font-size: clamp(52px, 6vw, 88px);
    font-weight: 800; line-height: 0.95;
    letter-spacing: -3px; margin-bottom: 28px;
  }
  .hero h1 .grad {
    background: linear-gradient(120deg, #ff3d8b 0%, #8b5cf6 50%, #22d3ee 100%);
    -webkit-background-clip: text; background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .hero p {
    font-size: 17px; line-height: 1.7; color: var(--muted);
    max-width: 460px; margin-bottom: 38px;
  }
  .hero-actions { display: flex; gap: 14px; flex-wrap: wrap; }

  .btn {
    display: inline-flex; align-items: center; justify-content: center; gap: 10px;
    padding: 16px 32px; border-radius: 12px;
    font-weight: 600; font-size: 14.5px;
    transition: var(--ease);
    border: 1.5px solid transparent;
    white-space: nowrap;
  }
  .btn-primary {
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; border-color: transparent;
    box-shadow: 0 12px 32px -8px rgba(255,61,139,0.5);
  }
  .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 18px 40px -8px rgba(255,61,139,0.6); }
  .btn-ghost {
    background: var(--card); color: var(--ink);
    border-color: var(--line-2);
  }
  .btn-ghost:hover { background: var(--card-2); border-color: var(--violet); }

  .hero-visual { position: relative; aspect-ratio: 1; display: grid; place-items: center; }
  .hero-orbit {
    position: absolute; inset: 0; border-radius: 50%;
    border: 1px dashed rgba(255,255,255,0.1);
    animation: rotate 40s linear infinite;
  }
  .hero-orbit-2 {
    inset: 12%; border: 1px solid rgba(139,92,246,0.2);
    animation: rotate 30s linear infinite reverse;
  }
  @keyframes rotate { to { transform: rotate(360deg); } }
  .hero-glow {
    position: absolute; width: 55%; height: 55%;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(139,92,246,0.5), rgba(255,61,139,0.2) 50%, transparent 75%);
    filter: blur(50px); animation: glowPulse 5s ease-in-out infinite;
  }
  @keyframes glowPulse {
    0%,100% { transform: scale(1); opacity: 0.9; }
    50% { transform: scale(1.15); opacity: 1; }
  }
  .hero-card {
    position: relative; width: 62%; aspect-ratio: 3 / 4;
    border-radius: 28px;
    background: linear-gradient(155deg, #1c1c2a 0%, #12121a 100%);
    border: 1px solid var(--line-2);
    box-shadow: 0 60px 100px -30px rgba(0,0,0,0.9), inset 0 1px 0 rgba(255,255,255,0.06);
    display: flex; flex-direction: column; padding: 26px;
    transform: rotate(-6deg); z-index: 2; overflow: hidden;
  }
  .hero-card-top {
    display: flex; justify-content: space-between; align-items: center;
    position: relative; z-index: 1;
  }
  .hero-card-tag { font-size: 10px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; color: var(--muted); }
  .hero-card-dots { display: flex; gap: 4px; }
  .hero-card-dots span { width: 6px; height: 6px; border-radius: 50%; background: var(--line-2); }
  .hero-card-dots span:first-child { background: var(--pink); }
  .hero-icon {
    flex: 1; display: grid; place-items: center;
    font-size: 90px; color: var(--ink);
    position: relative; z-index: 1;
    filter: drop-shadow(0 10px 40px rgba(139,92,246,0.4));
  }
  .hero-card-bottom { position: relative; z-index: 1; }
  .hero-card-label { font-size: 10px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; color: var(--muted); margin-bottom: 6px; }
  .hero-card-title { font-family: var(--serif); font-size: 22px; font-weight: 700; letter-spacing: -0.5px; line-height: 1.15; margin-bottom: 14px; }
  .hero-card-price {
    display: flex; justify-content: space-between; align-items: center;
    padding-top: 14px; border-top: 1px solid var(--line);
  }
  .hero-card-price .p {
    font-size: 22px; font-weight: 700;
    background: linear-gradient(120deg, #ff3d8b, #8b5cf6);
    -webkit-background-clip: text; background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .hero-card-cta {
    width: 38px; height: 38px; border-radius: 50%;
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; display: grid; place-items: center; font-size: 13px;
  }

  .float-chip {
    position: absolute;
    background: rgba(21,21,31,0.9);
    backdrop-filter: blur(16px);
    border: 1px solid var(--line-2);
    border-radius: 14px;
    padding: 12px 18px;
    display: flex; align-items: center; gap: 12px;
    z-index: 3;
    box-shadow: 0 20px 50px -10px rgba(0,0,0,0.7);
    animation: floatY 5s ease-in-out infinite;
  }
  .fc-icon { width: 36px; height: 36px; border-radius: 10px; display: grid; place-items: center; font-size: 15px; }
  .fc-num { font-size: 15px; font-weight: 700; line-height: 1.1; }
  .fc-label { font-size: 11px; color: var(--muted); }
  .fc-1 { top: 6%; right: 0; }
  .fc-1 .fc-icon { background: rgba(0,214,143,0.15); color: var(--green); }
  .fc-2 { bottom: 14%; left: -6%; animation-delay: 1.5s; }
  .fc-2 .fc-icon { background: rgba(245,197,66,0.15); color: var(--gold); }
  .fc-3 { top: 42%; left: -10%; animation-delay: 0.8s; }
  .fc-3 .fc-icon { background: rgba(255,61,139,0.15); color: var(--pink); }
  @keyframes floatY {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(-14px); }
  }

  /* TRUST */
  .trust { border-top: 1px solid var(--line); border-bottom: 1px solid var(--line); background: var(--bg-2); padding: 24px 0; }
  .trust-inner { display: flex; justify-content: space-between; align-items: center; gap: 32px; flex-wrap: wrap; }
  .trust-item { display: flex; align-items: center; gap: 12px; font-size: 13.5px; font-weight: 500; color: var(--muted); }
  .trust-item i { color: var(--violet); font-size: 16px; }

  /* SECTION HEAD */
  section.block { padding-top: 90px; }
  .section-head {
    display: flex; justify-content: space-between; align-items: flex-end;
    gap: 24px; margin-bottom: 44px; flex-wrap: wrap;
  }
  .eyebrow {
    font-size: 12px; font-weight: 600;
    letter-spacing: 1.5px; text-transform: uppercase;
    color: var(--pink); margin-bottom: 14px;
    display: flex; align-items: center; gap: 10px;
  }
  .eyebrow::before { content: ''; width: 28px; height: 2px; background: var(--pink); border-radius: 2px; }
  .section-head h2 {
    font-family: var(--serif);
    font-size: clamp(34px, 4vw, 52px);
    font-weight: 800; letter-spacing: -2px; line-height: 1;
  }
  .section-head h2 .grad {
    background: linear-gradient(120deg, #ff3d8b, #8b5cf6, #22d3ee);
    -webkit-background-clip: text; background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .view-all {
    font-size: 14px; font-weight: 600; color: var(--ink);
    display: inline-flex; align-items: center; gap: 8px;
    padding: 11px 22px;
    border: 1px solid var(--line-2); border-radius: 40px;
    transition: var(--ease);
  }
  .view-all:hover { border-color: var(--violet); color: #c4b5fd; gap: 12px; }

  /* FILTERS */
  .filters { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 40px; }
  .filter-btn {
    padding: 10px 22px; border-radius: 40px;
    font-size: 13px; font-weight: 600;
    border: 1px solid var(--line); color: var(--muted);
    transition: var(--ease);
  }
  .filter-btn:hover { color: var(--ink); border-color: var(--line-2); }
  .filter-btn.active {
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; border-color: transparent;
    box-shadow: 0 6px 20px -4px rgba(255,61,139,0.5);
  }

  /* PRODUCT GRID */
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
    gap: 24px; padding-bottom: 20px;
  }
  .product {
    background: var(--card);
    border-radius: var(--radius);
    border: 1px solid var(--line);
    overflow: hidden;
    display: flex; flex-direction: column;
    transition: var(--ease); position: relative;
  }
  .product:hover {
    transform: translateY(-6px);
    border-color: rgba(139,92,246,0.4);
    box-shadow: 0 30px 60px -20px rgba(0,0,0,0.8), 0 0 0 1px rgba(139,92,246,0.25);
  }
  .product-media {
    aspect-ratio: 1 / 0.95;
    position: relative; display: grid; place-items: center;
    overflow: hidden; background: var(--media-bg, #1a1a26);
  }
  .product-media::before {
    content: ''; position: absolute; inset: 0;
    background: radial-gradient(circle at 50% 105%, var(--glow, rgba(139,92,246,0.25)), transparent 60%);
    opacity: 0.7; transition: var(--ease);
  }
  .product:hover .product-media::before { opacity: 1; }
  .product-media i {
    font-size: 82px; color: var(--ink);
    position: relative; z-index: 1;
    transition: transform 0.5s cubic-bezier(0.34,1.56,0.64,1);
    filter: drop-shadow(0 12px 30px rgba(0,0,0,0.5));
  }
  .product:hover .product-media i { transform: scale(1.12) rotate(-6deg); }

  .pm-1 { --media-bg: linear-gradient(160deg, #241a30, #15101e); --glow: rgba(255,61,139,0.3); }
  .pm-2 { --media-bg: linear-gradient(160deg, #1a2430, #101820); --glow: rgba(34,211,238,0.3); }
  .pm-3 { --media-bg: linear-gradient(160deg, #302a1a, #1e1810); --glow: rgba(245,197,66,0.3); }
  .pm-4 { --media-bg: linear-gradient(160deg, #1a3024, #101e16); --glow: rgba(0,214,143,0.3); }
  .pm-5 { --media-bg: linear-gradient(160deg, #2a1a30, #1a101e); --glow: rgba(139,92,246,0.3); }
  .pm-6 { --media-bg: linear-gradient(160deg, #301a1a, #1e1010); --glow: rgba(255,61,139,0.3); }
  .pm-7 { --media-bg: linear-gradient(160deg, #1a2430, #101820); --glow: rgba(139,92,246,0.3); }
  .pm-8 { --media-bg: linear-gradient(160deg, #24241a, #181810); --glow: rgba(245,197,66,0.3); }

  .badge {
    position: absolute; top: 14px; left: 14px;
    font-size: 10px; font-weight: 700;
    letter-spacing: 1px; text-transform: uppercase;
    padding: 6px 12px; border-radius: 40px; z-index: 2;
  }
  .badge-sale { background: var(--pink); color: #fff; }
  .badge-new { background: var(--green); color: #0a0a10; }
  .badge-hot { background: var(--gold); color: #0a0a10; }

  .wish-btn {
    position: absolute; top: 12px; right: 12px;
    width: 40px; height: 40px; border-radius: 50%;
    background: rgba(10,10,16,0.55);
    backdrop-filter: blur(10px);
    border: 1px solid var(--line-2);
    display: grid; place-items: center;
    color: var(--muted); font-size: 14px;
    z-index: 2; transition: var(--ease);
  }
  .wish-btn:hover {
    color: var(--pink); border-color: var(--pink);
    background: rgba(255,61,139,0.15); transform: scale(1.1);
  }
  .wish-btn.active {
    color: var(--pink);
    background: rgba(255,61,139,0.2);
    border-color: var(--pink);
    box-shadow: 0 0 16px rgba(255,61,139,0.4);
  }

  .product-info { padding: 20px 20px 22px; display: flex; flex-direction: column; flex: 1; }
  .product-cat {
    font-size: 10.5px; font-weight: 700;
    letter-spacing: 1.2px; text-transform: uppercase;
    color: var(--violet); margin-bottom: 8px;
  }
  .product-name { font-size: 16.5px; font-weight: 600; line-height: 1.3; margin-bottom: 8px; letter-spacing: -0.2px; }
  .product-desc {
    font-size: 13px; color: var(--muted); line-height: 1.55;
    margin-bottom: 18px; flex: 1;
    display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
  }
  .product-bottom {
    display: flex; align-items: center; justify-content: space-between;
    padding-top: 16px; border-top: 1px solid var(--line); gap: 12px;
  }
  .price-wrap { display: flex; align-items: baseline; gap: 8px; }
  .price { font-size: 22px; font-weight: 700; letter-spacing: -0.5px; }
  .price .currency { font-size: 14px; opacity: 0.7; margin-right: 1px; }
  .price-old { font-size: 13px; color: var(--muted-2); text-decoration: line-through; }

  .add-btn {
    display: inline-flex; align-items: center; gap: 7px;
    padding: 10px 16px; border-radius: 40px;
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; font-size: 12.5px; font-weight: 600;
    transition: var(--ease); white-space: nowrap;
  }
  .add-btn:hover { transform: translateY(-2px); box-shadow: 0 10px 24px -6px rgba(255,61,139,0.6); }
  .add-btn.added { background: var(--green); box-shadow: 0 10px 24px -6px rgba(0,214,143,0.5); }
  .add-btn i { font-size: 11px; }

  /* FEATURE BANNER */
  .feature-banner {
    margin-top: 96px; border-radius: 28px; overflow: hidden;
    background: linear-gradient(120deg, #15151f 0%, #1c1c2a 50%, #15151f 100%);
    border: 1px solid var(--line-2);
    position: relative; padding: 64px;
    display: flex; align-items: center; justify-content: space-between;
    gap: 40px; flex-wrap: wrap;
  }
  .feature-banner::before {
    content: ''; position: absolute; top: -50%; left: -10%;
    width: 500px; height: 500px;
    background: radial-gradient(circle, rgba(139,92,246,0.28), transparent 65%);
    pointer-events: none;
  }
  .feature-banner::after {
    content: ''; position: absolute; bottom: -50%; right: -10%;
    width: 500px; height: 500px;
    background: radial-gradient(circle, rgba(255,61,139,0.2), transparent 65%);
    pointer-events: none;
  }
  .feature-content { position: relative; z-index: 2; max-width: 560px; }
  .feature-tag {
    display: inline-flex; align-items: center; gap: 8px;
    padding: 7px 16px;
    background: rgba(255,61,139,0.12);
    border: 1px solid rgba(255,61,139,0.3);
    border-radius: 40px;
    font-size: 12px; font-weight: 600; color: var(--pink);
    letter-spacing: 0.5px; text-transform: uppercase;
    margin-bottom: 20px;
  }
  .feature-content h3 {
    font-family: var(--serif);
    font-size: clamp(34px, 4vw, 52px);
    font-weight: 800; line-height: 1.02;
    letter-spacing: -2px; margin-bottom: 18px;
  }
  .feature-content h3 .grad {
    background: linear-gradient(120deg, #ff3d8b, #8b5cf6, #22d3ee);
    -webkit-background-clip: text; background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .feature-content p { color: var(--muted); font-size: 15px; line-height: 1.7; margin-bottom: 30px; }
  .feature-badge {
    position: relative; z-index: 2;
    width: 180px; height: 180px; border-radius: 50%;
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    display: grid; place-items: center;
    color: #fff; text-align: center;
    box-shadow: 0 0 60px rgba(255,61,139,0.5);
    animation: floatY 6s ease-in-out infinite;
  }
  .feature-badge .fb-num { font-family: var(--serif); font-size: 56px; line-height: 1; font-weight: 800; }
  .feature-badge .fb-label { font-size: 11px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; }

  /* FOOTER */
  footer { margin-top: 96px; border-top: 1px solid var(--line); padding: 64px 0 32px; background: var(--bg-2); }
  .footer-top { display: grid; grid-template-columns: 1.6fr 1fr 1fr 1.4fr; gap: 48px; margin-bottom: 56px; }
  .footer-brand .brand { margin-bottom: 20px; }
  .footer-brand p { font-size: 14px; color: var(--muted); max-width: 280px; line-height: 1.7; }
  .footer-col h4 { font-size: 12px; font-weight: 700; letter-spacing: 1.2px; text-transform: uppercase; margin-bottom: 20px; }
  .footer-col ul li { margin-bottom: 12px; }
  .footer-col ul li a { font-size: 14px; color: var(--muted); transition: var(--ease); }
  .footer-col ul li a:hover { color: var(--pink); }
  .newsletter { display: flex; gap: 8px; margin-top: 16px; }
  .newsletter input {
    flex: 1; padding: 12px 16px; border-radius: 40px;
    border: 1px solid var(--line-2); background: var(--card);
    color: var(--ink); font-size: 13px; outline: none;
    transition: var(--ease);
  }
  .newsletter input::placeholder { color: var(--muted-2); }
  .newsletter input:focus { border-color: var(--violet); }
  .newsletter button {
    width: 44px; height: 44px; border-radius: 50%;
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; display: grid; place-items: center;
    font-size: 14px; transition: var(--ease); flex-shrink: 0;
  }
  .newsletter button:hover { transform: scale(1.08); }
  .footer-bottom {
    border-top: 1px solid var(--line); padding-top: 28px;
    display: flex; align-items: center; justify-content: space-between;
    flex-wrap: wrap; gap: 16px; font-size: 13px; color: var(--muted-2);
  }
  .footer-bottom .socials { display: flex; gap: 10px; }
  .footer-bottom .socials a {
    width: 38px; height: 38px; border-radius: 10px;
    border: 1px solid var(--line);
    display: grid; place-items: center;
    font-size: 14px; color: var(--muted);
    transition: var(--ease);
  }
  .footer-bottom .socials a:hover {
    background: linear-gradient(135deg, #ff3d8b, #8b5cf6);
    color: #fff; border-color: transparent; transform: translateY(-3px);
  }

  /* TOAST */
  .toast {
    position: fixed; bottom: 28px; left: 50%;
    transform: translate(-50%, 100px);
    background: var(--card);
    border: 1px solid var(--line-2);
    border-radius: 14px;
    padding: 14px 22px;
    display: flex; align-items: center; gap: 12px;
    font-size: 14px; font-weight: 500;
    box-shadow: 0 20px 50px -10px rgba(0,0,0,0.9);
    z-index: 1000; opacity: 0;
    transition: all 0.4s cubic-bezier(0.34,1.56,0.64,1);
    pointer-events: none;
  }
  .toast.show { transform: translate(-50%, 0); opacity: 1; }
  .toast i { color: var(--green); font-size: 16px; }

  /* RESPONSIVE */
  @media (max-width: 1080px) {
    .hero-grid { grid-template-columns: 1fr; gap: 56px; }
    .hero-visual { max-width: 460px; margin: 0 auto; width: 100%; }
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
    .hero { padding: 48px 0 56px; }
    .hero h1 { font-size: 44px; letter-spacing: -1
