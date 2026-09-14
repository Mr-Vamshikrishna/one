<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · Dark Mode</title>
  <!-- Fonts & Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <style>
    /* ===== RESET & BASE ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Inter', system-ui, sans-serif;
      background: #121212;
      color: #e0e0e0;
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
    }
    a { text-decoration: none; color: inherit; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }

    :root {
      --bg: #121212;
      --card: #1e1e1e;
      --primary: #e0e0e0;
      --accent: #00bcd4;
      --accent-light: #004d5a;
      --accent-dark: #0097a7;
      --muted: #9e9e9e;
      --muted-light: #757575;
      --surface: #1a1a1a;
      --shadow: 0 0 12px rgba(0,188,212,0.2);
      --shadow-hover: 0 0 20px rgba(0,188,212,0.4);
      --radius: 20px;
      --radius-sm: 10px;
      --container: 1280px;
      --transition: 0.25s ease;
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 28px; }

    /* ===== BUTTONS ===== */
    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 14px 34px; border-radius: 40px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
    }
    .btn-primary { background: var(--accent); color: #121212; border-color: var(--accent); }
    .btn-primary:hover { background: var(--accent-dark); border-color: var(--accent-dark); box-shadow: var(--shadow-hover); }
    .btn-outline { background: transparent; color: var(--accent); border-color: var(--accent); }
    .btn-outline:hover { background: var(--accent); color: #121212; }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(26,26,26,0.95);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid rgba(255,255,255,0.05);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 16px;
      padding: 12px 0; min-height: 72px;
    }
    .brand {
      display: flex; align-items: center; gap: 10px;
      font-weight: 700; font-size: 22px; letter-spacing: -0.4px;
      color: var(--accent);
      font-family: 'Roboto Mono', monospace;
    }
    .brand i { font-size: 26px; color: var(--accent); }

    nav.main-nav ul {
      display: flex; gap: 6px; list-style: none; align-items: center;
    }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 8px;
      padding: 8px 20px; border-radius: 40px;
      font-weight: 500; font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      background: var(--surface); color: var(--accent);
    }

    .header-actions .icon-btn {
      width: 44px; height: 44px; display: grid; place-items: center;
      border-radius: 50%; font-size: 18px; color: var(--muted);
      transition: var(--transition);
    }
    .header-actions .icon-btn:hover { background: var(--surface); color: var(--accent); }

    .cart-count {
      position: absolute; top: -4px; right: -4px;
      background: var(--accent); color: #121212;
      font-size: 11px; font-weight: 700;
      width: 22px; height: 22px; border-radius: 50%;
      display: grid; place-items: center;
      border: 2px solid #121212;
    }

    /* ===== HERO ===== */
    .hero {
      position: relative; display: flex; align-items: center;
      min-height: 480px; padding: 64px 0;
      border-radius: var(--radius); overflow: hidden;
      margin: 20px 28px 0;
      background: linear-gradient(145deg, #1a1a1a 0%, #121212 100%);
    }
    .hero h1 {
      font-family: 'Roboto Mono', monospace;
      font-size: 48px; font-weight: 700; color: var(--accent);
      line-height: 1.1; max-width: 640px; margin-bottom: 16px;
    }
    .hero p {
      color: var(--muted); font-size: 17px;
      max-width: 480px; margin-bottom: 28px; line-height: 1.6;
    }

    /* ===== CARDS ===== */
    .product-card, .cat-card, .deal-wrap, .testimonial-card {
      background: var(--card); border-radius: var(--radius);
      box-shadow: var(--shadow); transition: var(--transition);
      border: 1px solid rgba(255,255,255,0.05);
    }
    .product-card:hover, .cat-card:hover {
      box-shadow: var(--shadow-hover);
      transform: translateY(-4px);
    }

    /* ===== FOOTER ===== */
    footer { margin-top: 16px; padding: 48px 0 28px; border-top: 1px solid rgba(255,255,255,0.05); }
    .footer-bottom { text-align: center; padding-top: 20px; color: var(--muted); font-size: 13px; }
  </style>
</head>
<body>

<header>
  <div class="container header-inner">
    <a class="brand" href="#"><i class="fas fa-store-alt"></i> Nexus</a>
    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active"><i class="fas fa-compass"></i> Explore</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-bolt"></i> Flash</a></li>
        <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
      </ul>
    </nav>
    <div class="header-actions">
      <button class="icon-btn"><i class="far fa-user"></i></button>
      <button class="icon-btn"><i class="far fa-heart"></i></button>
      <div class="cart-wrap">
        <button class="icon-btn"><i class="fas fa-shopping-bag"></i></button>
        <span class="cart-count">0</span>
      </div>
    </div>
  </div>
</header>

<main>
  <section class="hero">
    <div class="container">
      <h1>Curated essentials<br>for everyday.</h1>
      <p>Discover a handpicked selection with free shipping on your first order.</p>
      <div class="actions">
        <button class="btn btn-primary"><i class="fas fa-arrow-right"></i> Start shopping</button>
        <button class="btn btn-outline"><i class="fas fa-clock"></i> Flash deals</button>
      </div>
    </div>
  </section>
</main>

<footer>
  <div class
