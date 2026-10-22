<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · Dark Mode · Shop</title>
  <!-- Fonts & Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Roboto+Mono:wght@400;600;700&display=swap" rel="stylesheet">
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
      --card-hover: #252525;
      --primary: #e0e0e0;
      --accent: #00bcd4;
      --accent-light: #004d5a;
      --accent-dark: #0097a7;
      --muted: #9e9e9e;
      --muted-light: #757575;
      --surface: #1a1a1a;
      --shadow: 0 0 12px rgba(0,188,212,0.15);
      --shadow-hover: 0 0 24px rgba(0,188,212,0.3);
      --radius: 20px;
      --radius-sm: 12px;
      --container: 1280px;
      --transition: 0.25s ease;
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 28px; }

    /* ===== BUTTONS ===== */
    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 14px 34px; border-radius: 40px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
      white-space: nowrap;
    }
    .btn-primary { background: var(--accent); color: #121212; border-color: var(--accent); }
    .btn-primary:hover { background: var(--accent-dark); border-color: var(--accent-dark); box-shadow: var(--shadow-hover); }
    .btn-outline { background: transparent; color: var(--accent); border-color: var(--accent); }
    .btn-outline:hover { background: var(--accent); color: #121212; }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(18,18,18,0.92);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid rgba(255,255,255,0.06);
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

    .header-actions { display: flex; align-items: center; gap: 4px; }
    .header-actions .icon-btn {
      width: 44px; height: 44px; display: grid; place-items: center;
      border-radius: 50%; font-size: 18px; color: var(--muted);
      transition: var(--transition); position: relative;
    }
    .header-actions .icon-btn:hover { background: var(--surface); color: var(--accent); }

    .cart-count {
      position: absolute; top: -2px; right: -2px;
      background: var(--accent); color: #121212;
      font-size: 11px; font-weight: 700;
      width: 20px; height: 20px; border-radius: 50%;
      display: grid; place-items: center;
      border: 2px solid #121212;
    }

    /* ===== HERO ===== */
    .hero {
      position: relative; display: flex; align-items: center;
      min-height: 380px; padding: 56px 0;
      border-radius: var(--radius); overflow: hidden;
      margin: 20px 28px 0;
      background: linear-gradient(145deg, #1a1a1a 0%, #121212 100%);
      border: 1px solid rgba(255,255,255,0.05);
    }
    .hero .container { position: relative; z-index: 2; }
    .hero h1 {
      font-family: 'Roboto Mono', monospace;
      font-size: 48px; font-weight: 700; color: var(--accent);
      line-height: 1.1; max-width: 640px; margin-bottom: 16px;
    }
    .hero p {
      color: var(--muted); font-size: 17px;
      max-width: 480px; margin-bottom: 28px; line-height: 1.6;
    }
    .hero .actions { display: flex; gap: 16px; flex-wrap: wrap; }

    /* ===== SECTION TITLES ===== */
    .section-title {
      display: flex; align-items: center; justify-content: space-between;
      margin: 48px 0 24px;
    }
    .section-title h2 {
      font-family: 'Roboto Mono', monospace;
      font-size: 28px; font-weight: 600; color: var(--primary);
      display: flex; align-items: center; gap: 12px;
    }
    .section-title h2 i { color: var(--accent); font-size: 24px; }
    .section-title .link-arrow {
      color: var(--accent); font-size: 14px; font-weight: 500;
      display: flex; align-items: center; gap: 6px;
      transition: var(--transition);
    }
    .section-title .link-arrow:hover { gap: 10px; }

    /* ===== PRODUCT GRID ===== */
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
      gap: 24px;
      margin-bottom: 16px;
    }
    .product-card {
      background: var(--card);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      transition: var(--transition);
      border: 1px solid rgba(255,255,255,0.05);
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }
    .product-card:hover {
      box-shadow: var(--shadow-hover);
      transform: translateY(-4px);
      border-color: rgba(0,188,212,0.3);
      background: var(--card-hover);
    }
    .product-img {
      width: 100%;
      height: 180px;
      background: linear-gradient(145deg, #2a2a2a, #1a1a1a);
      display: grid;
      place-items: center;
      color: var(--accent);
      font-size: 48px;
      position: relative;
      border-bottom: 1px solid rgba(255,255,255,0.05);
    }
    .product-img i { opacity: 0.8; }
    .product-badge {
      position: absolute; top: 12px; left: 12px;
      background: var(--accent); color: #121212;
      font-size: 11px; font-weight: 700;
      padding: 4px 12px; border-radius: 40px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }
    .product-info {
      padding: 18px 18px 20px;
      display: flex;
      flex-direction: column;
      flex: 1;
    }
    .product-category {
      font-size: 12px; color: var(--accent);
      font-weight: 600; text-transform: uppercase;
      letter-spacing: 0.5px; margin-bottom: 6px;
    }
    .product-name {
      font-weight: 600; font-size: 16px; color: var(--primary);
      margin-bottom: 6px; line-height: 1.3;
    }
    .product-desc {
      font-size: 13px; color: var(--muted);
      margin-bottom: 14px; flex: 1;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-bottom {
      display: flex; align-items: center; justify-content: space-between;
      margin-top: auto;
    }
    .product-price {
      font-family: 'Roboto Mono', monospace;
      font-weight: 700; font-size: 20px; color: var(--accent);
    }
    .product-price .old {
      font-size: 13px; color: var(--muted-light);
      text-decoration: line-through; margin-left: 6px; font-weight: 400;
    }
    .add-to-cart {
      width: 42px; height: 42px;
      border-radius: 50%;
      background: var(--surface);
      border: 1px solid rgba(255,255,255,0.08);
      display: grid; place-items: center;
      color: var(--muted);
      transition: var(--transition);
      font-size: 16px;
    }
    .add-to-cart:hover {
      background: var(--accent);
      color: #121212;
      border-color: var(--accent);
      box-shadow: 0 0 16px rgba(0,188,212,0.4);
    }

    /* ===== FOOTER ===== */
    footer { margin-top: 32px; padding: 48px 0 28px; border-top: 1px solid rgba(255,255,255,0.05); }
    .footer-bottom { text-align: center; padding-top: 20px; color: var(--muted); font-size: 13px; }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 900px) {
      nav.main-nav { display: none; }
      .hero h1 { font-size: 34px; }
      .hero { margin: 16px 16px 0; padding: 40px 0; }
      .container { padding: 0 16px; }
      .product-grid { grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 16px; }
    }
    @media (max-width: 520px) {
      .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
      .product-img { height: 140px; font-size: 36px; }
      .product-info { padding: 12px; }
      .product-name { font-size: 14px; }
      .product-price { font-size: 16px; }
      .add-to-cart { width: 34px; height: 34px; font-size: 13px; }
      .hero h1 { font-size: 28px; }
      .hero .actions .btn { padding: 12px 20px; font-size: 13px; }
      .section-title h2 { font-size: 20px; }
    }
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
        <span class="cart-count">3</span>
      </div>
    </div>
  </div>
</header>

<main>
  <!-- Hero -->
  <section class="hero">
    <div class="container">
      <h1>Curated essentials<br>for everyday.</h1>
      <p>Discover a handpicked selection with free shipping on your first order. Quality you can feel, prices you'll love.</p>
      <div class="actions">
        <button class="btn btn-primary"><i class="fas fa-arrow-right"></i> Start shopping</button>
        <button class="btn btn-outline"><i class="fas fa-clock"></i> Flash deals</button>
      </div>
    </div>
  </section>

  <!-- Products Section -->
  <section id="products" class="container">
    <div class="section-title">
      <h2><i class="fas fa-fire"></i> Trending now</h2>
      <a href="#" class="link-arrow">View all <i class="fas fa-arrow-right"></i></a>
    </div>

    <div class="product-grid">
      <!-- Product 1 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-headphones"></i>
          <span class="product-badge">-15%</span>
        </div>
        <div class="product-info">
          <div class="product-category">Audio</div>
          <h3 class="product-name">Aura Wireless Headphones</h3>
          <p class="product-desc">Immersive sound with active noise cancellation and 30h battery.</p>
          <div class="product-bottom">
            <div class="product-price">$129 <span class="old">$152</span></div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 2 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-laptop"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Computing</div>
          <h3 class="product-name">Nexus Slim Laptop Stand</h3>
          <p class="product-desc">Ergonomic aluminum stand, adjustable height, fits all laptops.</p>
          <div class="product-bottom">
            <div class="product-price">$49</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 3 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-watch"></i>
          <span class="product-badge">New</span>
        </div>
        <div class="product-info">
          <div class="product-category">Wearables</div>
          <h3 class="product-name">Pulse Smart Watch</h3>
          <p class="product-desc">Health tracking, AMOLED display, 7-day battery, waterproof.</p>
          <div class="product-bottom">
            <div class="product-price">$199</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 4 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-camera"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Photography</div>
          <h3 class="product-name">Lumina Compact Camera</h3>
          <p class="product-desc">4K video, 24MP sensor, lightweight design for creators.</p>
          <div class="product-bottom">
            <div class="product-price">$349</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 5 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-mobile-alt"></i>
          <span class="product-badge">Hot</span>
        </div>
        <div class="product-info">
          <div class="product-category">Accessories</div>
          <h3 class="product-name">MagCharge Power Bank</h3>
          <p class="product-desc">10,000mAh magnetic wireless charging, slim and fast.</p>
          <div class="product-bottom">
            <div class="product-price">$59 <span class="old">$79</span></div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 6 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-gamepad"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Gaming</div>
          <h3 class="product-name">ProGrip Controller</h3>
          <p class="product-desc">Wireless, low-latency, textured grip, 40h playtime.</p>
          <div class="product-bottom">
            <div class="product-price">$89</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 7 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-mug-hot"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Home</div>
          <h3 class="product-name">Ember Smart Mug</h3>
          <p class="product-desc">Keeps drinks at perfect temperature for 1.5 hours.</p>
          <div class="product-bottom">
            <div class="product-price">$99</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 8 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-backpack"></i>
          <span class="product-badge">Eco</span>
        </div>
        <div class="product-info">
          <div class="product-category">Bags</div>
          <h3 class="product-name">Urban Commuter Backpack</h3>
          <p class="product-desc">Water-resistant, laptop sleeve, recycled materials.</p>
          <div class="product-bottom">
            <div class="product-price">$79</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 9 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-keyboard"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Computing</div>
          <h3 class="product-name">Tactile Mechanical Keyboard</h3>
          <p class="product-desc">Hot-swappable switches, RGB backlight, compact 75%.</p>
          <div class="product-bottom">
            <div class="product-price">$119 <span class="old">$139</span></div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>

      <!-- Product 10 -->
      <article class="product-card">
        <div class="product-img">
          <i class="fas fa-sun"></i>
        </div>
        <div class="product-info">
          <div class="product-category">Wellness</div>
          <h3 class="product-name">Glow Sleep Lamp</h3>
          <p class="product-desc">Sunrise simulation, adjustable warmth, app-controlled.</p>
          <div class="product-bottom">
            <div class="product-price">$69</div>
            <button class="add-to-cart" aria-label="Add to cart"><i class="fas fa-plus"></i></button>
          </div>
        </div>
      </article>
    </div>
  </section>

  <!-- Optional small categories row for additional UI depth -->
  <section id="categories" class="container" style="margin-top: 40px;">
    <div class="section-title">
      <h2><i class="fas fa-th-large"></i> Shop by category</h2>
      <a href="#" class="link-arrow">All categories <i class="fas fa-arrow-right"></i></a>
    </div>
    <div style="display: flex; flex-wrap: wrap; gap: 14px;">
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-headphones"></i> Audio</button>
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-laptop"></i> Computing</button>
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-mobile-alt"></i> Accessories</button>
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-gamepad"></i> Gaming</button>
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-mug-hot"></i> Home</button>
      <button class="btn btn-outline" style="padding: 10px 22px; font-size: 14px;"><i class="fas fa-sun"></i> Wellness</button>
    </div>
  </section>
</main>

<footer>
  <div class="container">
    <div class="footer-bottom">
      <p>© 2025 Nexus · Dark mode store · Designed for effortless shopping.</p>
    </div>
  </div>
</footer>

</body>
</html>
