<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nexus · reimagined</title>
  <!-- Fonts & Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400..700&family=Outfit:wght@400;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <style>
    /* ===== RESET & BASE ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Outfit', 'Inter', system-ui, sans-serif;
      background: #f6f4f0;
      color: #1e1e2a;
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
    }
    a { text-decoration: none; color: inherit; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }

    :root {
      --bg: #f6f4f0;
      --card: #ffffff;
      --primary: #1e1e2a;
      --accent: #f27a5e;
      --accent-light: #fce3db;
      --accent-dark: #d45e42;
      --muted: #6b6b7a;
      --muted-light: #b6b6c4;
      --surface: #efede8;
      --shadow: 0 8px 28px rgba(0,0,0,0.04);
      --shadow-hover: 0 16px 48px rgba(0,0,0,0.08);
      --radius: 24px;
      --radius-sm: 12px;
      --container: 1280px;
      --transition: 0.25s cubic-bezier(0.2, 0, 0, 1);
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 28px; }

    /* ===== BUTTONS ===== */
    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 10px;
      padding: 14px 34px; border-radius: 60px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
    }
    .btn-primary { background: var(--accent); color: #fff; border-color: var(--accent); }
    .btn-primary:hover { background: var(--accent-dark); border-color: var(--accent-dark); transform: scale(1.02); box-shadow: 0 12px 28px rgba(242,122,94,0.25); }
    .btn-secondary { background: var(--primary); color: #fff; border-color: var(--primary); }
    .btn-secondary:hover { background: #2e2e40; border-color: #2e2e40; transform: scale(1.02); }
    .btn-outline { background: transparent; color: var(--primary); border-color: rgba(30,30,42,0.15); }
    .btn-outline:hover { background: var(--primary); color: #fff; border-color: var(--primary); }
    .btn-ghost { background: rgba(255,255,255,0.12); color: #fff; border-color: rgba(255,255,255,0.2); }
    .btn-ghost:hover { background: rgba(255,255,255,0.25); transform: scale(1.02); }
    .btn-sm { padding: 8px 20px; font-size: 13px; }

    /* ===== TOP PROMO BANNER — LARGER FONT ===== */
    .top-promo {
      background: var(--accent);
      color: #fff;
      text-align: center;
      padding: 16px 20px;
      font-weight: 700;
      font-size: 22px;
      letter-spacing: 0.5px;
      border-bottom: 3px solid rgba(255,255,255,0.15);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 14px;
      flex-wrap: wrap;
    }
    .top-promo i {
      font-size: 24px;
      opacity: 0.9;
    }
    .top-promo span {
      background: rgba(255,255,255,0.2);
      padding: 4px 20px;
      border-radius: 60px;
      font-weight: 800;
      font-size: 24px;
      margin: 0 6px;
    }
    .top-promo .arrow {
      font-size: 22px;
      margin-left: 6px;
    }

    /* ===== HEADER ===== */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(255,255,255,0.88);
      backdrop-filter: blur(16px);
      border-bottom: 1px solid rgba(30,30,42,0.04);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 16px;
      padding: 12px 0; min-height: 72px;
    }
    .brand {
      display: flex; align-items: center; gap: 10px;
      font-weight: 800; font-size: 24px; letter-spacing: -0.4px;
      color: var(--primary);
    }
    .brand .accent { color: var(--accent); }
    .brand i { font-size: 28px; color: var(--accent); }

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
      background: var(--surface); color: var(--primary);
    }
    nav.main-nav li a i { font-size: 15px; }

    .header-actions {
      display: flex; align-items: center; gap: 8px;
    }
    .header-actions .icon-btn {
      width: 44px; height: 44px; display: grid; place-items: center;
      border-radius: 50%; font-size: 18px; color: var(--muted);
      transition: var(--transition); position: relative;
    }
    .header-actions .icon-btn:hover { background: var(--surface); color: var(--primary); }
    .cart-wrap { position: relative; }
    .cart-count {
      position: absolute; top: -4px; right: -4px;
      background: var(--accent); color: #fff;
      font-size: 11px; font-weight: 700;
      width: 22px; height: 22px; border-radius: 50%;
      display: grid; place-items: center;
      border: 2px solid #fff;
    }

    .search-wrap {
      display: flex; align-items: center;
      background: var(--surface); border-radius: 60px;
      padding: 0 18px 0 22px;
      transition: var(--transition);
      border: 2px solid transparent;
      min-width: 220px;
    }
    .search-wrap:focus-within {
      border-color: var(--accent); background: #fff;
      box-shadow: 0 0 0 6px rgba(242,122,94,0.08);
    }
    .search-wrap input {
      border: 0; background: transparent; outline: none;
      width: 100%; padding: 10px 0;
      font-size: 14px; color: var(--primary);
    }
    .search-wrap input::placeholder { color: var(--muted-light); }
    .search-wrap button { padding: 8px 0 8px 12px; color: var(--muted); transition: var(--transition); }
    .search-wrap button:hover { color: var(--accent); }

    .mobile-toggle {
      display: none; width: 44px; height: 44px;
      border-radius: 50%; background: var(--surface);
      font-size: 20px; color: var(--primary);
    }
    #mobileMenu {
      display: none; background: #fff;
      border-top: 1px solid rgba(30,30,42,0.04);
      padding: 12px 0 20px;
    }
    #mobileMenu ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
    #mobileMenu ul li a {
      display: flex; align-items: center; gap: 14px;
      padding: 12px 20px; border-radius: var(--radius-sm);
      font-weight: 500; color: var(--primary);
    }
    #mobileMenu ul li a:hover { background: var(--surface); }
    #mobileMenu ul li a i { width: 24px; color: var(--muted); }

    /* ===== HERO ===== */
    .hero {
      position: relative; display: flex; align-items: center;
      min-height: 480px; padding: 64px 0;
      border-radius: var(--radius); overflow: hidden;
      margin: 20px 28px 0;
      background: linear-gradient(145deg, #f9f3ed 0%, #f0e8e0 100%);
    }
    .hero::after {
      content: ''; position: absolute; inset: 0;
      background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
      opacity: 0.15; z-index: 0;
    }
    .hero .container { position: relative; z-index: 1; }
    .hero .badge {
      display: inline-block; background: var(--accent-light);
      color: var(--accent-dark); padding: 6px 20px;
      border-radius: 60px; font-weight: 700; font-size: 13px;
      margin-bottom: 16px;
    }
    .hero h1 {
      font-family: 'Outfit', sans-serif;
      font-size: 52px; font-weight: 800; color: var(--primary);
      line-height: 1.1; max-width: 640px; margin-bottom: 16px;
    }
    .hero h1 span { color: var(--accent); }
    .hero p {
      color: var(--muted); font-size: 17px;
      max-width: 480px; margin-bottom: 28px; line-height: 1.6;
    }
    .hero .actions { display: flex; gap: 14px; flex-wrap: wrap; }

    /* ===== SECTIONS ===== */
    .section { padding: 56px 0; }
    .section-header {
      display: flex; align-items: flex-end; justify-content: space-between;
      gap: 16px; margin-bottom: 32px; flex-wrap: wrap;
    }
    .section-header .title-group h2 {
      font-size: 30px; font-weight: 700; letter-spacing: -0.3px;
    }
    .section-header .title-group p {
      color: var(--muted); margin-top: 4px; font-size: 15px;
    }
    .section-header .view-all {
      font-weight: 600; color: var(--accent);
      display: flex; align-items: center; gap: 8px;
      font-size: 14px; transition: var(--transition);
      white-space: nowrap;
    }
    .section-header .view-all:hover { gap: 14px; color: var(--accent-dark); }

    /* ===== CATEGORIES ===== */
    .categories-grid {
      display: grid; grid-template-columns: repeat(6,1fr); gap: 18px;
    }
    .cat-card {
      background: var(--card); border-radius: var(--radius);
      padding: 28px 12px; text-align: center;
      box-shadow: var(--shadow); transition: var(--transition);
      cursor: pointer; border: 2px solid transparent;
    }
    .cat-card:hover {
      transform: translateY(-8px); box-shadow: var(--shadow-hover);
      border-color: var(--accent-light);
    }
    .cat-card .icon-wrap {
      width: 64px; height: 64px; border-radius: 50%;
      background: var(--accent-light); display: grid; place-items: center;
      margin: 0 auto 14px; font-size: 26px; color: var(--accent);
      transition: var(--transition);
    }
    .cat-card:hover .icon-wrap { background: var(--accent); color: #fff; }
    .cat-card h4 { font-size: 16px; font-weight: 600; }
    .cat-card .count { font-size: 13px; color: var(--muted); margin-top: 4px; }

    /* ===== PRODUCTS ===== */
    .products-grid {
      display: grid; grid-template-columns: repeat(4,1fr); gap: 24px;
    }
    .product-card {
      background: var(--card); border-radius: var(--radius);
      overflow: hidden; box-shadow: var(--shadow);
      transition: var(--transition); border: 2px solid transparent;
      display: flex; flex-direction: column;
    }
    .product-card:hover {
      transform: translateY(-8px); box-shadow: var(--shadow-hover);
      border-color: var(--accent-light);
    }
    .product-card .img-wrap {
      position: relative; overflow: hidden; background: var(--surface);
      aspect-ratio: 1/1;
    }
    .product-card .img-wrap img {
      width: 100%; height: 100%; object-fit: cover;
      transition: var(--transition);
    }
    .product-card:hover .img-wrap img { transform: scale(1.04); }
    .product-card .badge {
      position: absolute; top: 14px; left: 14px;
      background: var(--accent); color: #fff;
      padding: 4px 16px; border-radius: 60px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.3px;
    }
    .product-card .badge.sale { background: #f4c542; color: var(--primary); }
    .product-card .wish-btn {
      position: absolute; top: 14px; right: 14px;
      width: 38px; height: 38px; border-radius: 50%;
      background: rgba(255,255,255,0.92);
      display: grid; place-items: center;
      font-size: 16px; color: var(--muted);
      backdrop-filter: blur(4px);
    }
    .product-card .wish-btn:hover { background: #fff; color: var(--accent); transform: scale(1.1); }
    .product-card .body { padding: 18px 20px 12px; flex: 1; display: flex; flex-direction: column; gap: 4px; }
    .product-card .body .category-tag {
      font-size: 12px; color: var(--muted-light);
      text-transform: uppercase; letter-spacing: 0.5px; font-weight: 600;
    }
    .product-card .body h5 { font-size: 16px; font-weight: 600; line-height: 1.3; }
    .product-card .body .price-row {
      display: flex; align-items: center; gap: 12px; margin-top: 4px;
    }
    .product-card .body .price { font-weight: 700; font-size: 19px; color: var(--primary); }
    .product-card .body .old-price { color: var(--muted-light); text-decoration: line-through; font-size: 14px; }
    .product-card .body .rating { display: flex; align-items: center; gap: 4px; font-size: 13px; color: #f5a623; }
    .product-card .body .rating span { color: var(--muted); font-weight: 400; }
    .product-card .footer { padding: 0 20px 20px; display: flex; gap: 10px; }
    .product-card .footer .add-btn {
      flex: 1; padding: 12px; border-radius: var(--radius-sm);
      background: var(--primary); color: #fff;
      font-weight: 600; font-size: 14px;
      transition: var(--transition); display: flex; align-items: center; justify-content: center; gap: 8px;
    }
    .product-card .footer .add-btn:hover { background: var(--accent); transform: scale(1.02); }
    .product-card .footer .add-btn.added { background: #2a9d8f; }

    /* ===== DEAL ===== */
    .deal-wrap {
      display: flex; gap: 0; background: var(--card);
      border-radius: var(--radius); overflow: hidden;
      box-shadow: var(--shadow);
    }
    .deal-wrap .deal-img { flex: 0 0 46%; background: var(--surface); min-height: 280px; }
    .deal-wrap .deal-img img { width: 100%; height: 100%; object-fit: cover; }
    .deal-wrap .deal-content { flex: 1; padding: 44px 48px; display: flex; flex-direction: column; justify-content: center; }
    .deal-wrap .deal-content .tag {
      display: inline-block; background: #f4c542;
      color: var(--primary); padding: 6px 18px; border-radius: 60px;
      font-size: 12px; font-weight: 700; text-transform: uppercase;
      align-self: flex-start; margin-bottom: 12px;
    }
    .deal-wrap .deal-content h3 { font-size: 30px; font-weight: 700; margin-bottom: 6px; }
    .deal-wrap .deal-content .desc { color: var(--muted); margin-bottom: 18px; }
    .deal-wrap .deal-content .price-big { font-size: 34px; font-weight: 800; color: var(--primary); }
    .deal-wrap .deal-content .price-big .old {
      font-size: 20px; font-weight: 400; color: var(--muted-light);
      text-decoration: line-through; margin-left: 12px;
    }
    .deal-wrap .deal-content .stock { font-size: 14px; color: var(--muted); margin: 4px 0 16px; }
    .deal-wrap .deal-content .stock strong { color: var(--accent); }

    .timer-grid {
      display: flex; gap: 14px; margin: 16px 0 22px;
    }
    .timer-box {
      background: var(--primary); color: #fff;
      padding: 12px 18px; border-radius: var(--radius-sm);
      min-width: 72px; text-align: center;
    }
    .timer-box .num { font-size: 28px; font-weight: 700; line-height: 1.2; }
    .timer-box .label { font-size: 11px; opacity: 0.7; text-transform: uppercase; letter-spacing: 0.5px; }

    /* ===== TESTIMONIALS ===== */
    .testimonials-scroll {
      display: flex; gap: 24px; overflow-x: auto;
      padding: 8px 4px 16px; scroll-snap-type: x mandatory;
    }
    .testimonials-scroll::-webkit-scrollbar { height: 4px; }
    .testimonials-scroll::-webkit-scrollbar-thumb { background: var(--accent-light); border-radius: 60px; }
    .testimonial-card {
      flex: 0 0 360px; background: var(--card); border-radius: var(--radius);
      padding: 28px 30px; box-shadow: var(--shadow); scroll-snap-align: start;
      transition: var(--transition);
    }
    .testimonial-card:hover { box-shadow: var(--shadow-hover); }
    .testimonial-card .stars { color: #f5a623; font-size: 16px; letter-spacing: 2px; margin-bottom: 10px; }
    .testimonial-card blockquote { font-size: 15px; line-height: 1.6; color: var(--primary); margin-bottom: 14px; font-style: italic; }
    .testimonial-card .author { display: flex; align-items: center; gap: 14px; }
    .testimonial-card .author .avatar { width: 48px; height: 48px; border-radius: 50%; object-fit: cover; background: var(--surface); }
    .testimonial-card .author .name { font-weight: 600; font-size: 15px; }
    .testimonial-card .author .role { font-size: 13px; color: var(--muted); }

    /* ===== NEWSLETTER ===== */
    .newsletter-wrap {
      background: linear-gradient(145deg, #f9f3ed 0%, #f0e8e0 100%);
      border-radius: var(--radius); padding: 48px 56px;
      color: var(--primary); display: flex; align-items: center;
      justify-content: space-between; gap: 32px; flex-wrap: wrap;
      border: 1px solid rgba(30,30,42,0.04);
    }
    .newsletter-wrap .text h3 { font-size: 28px; font-weight: 700; margin-bottom: 4px; }
    .newsletter-wrap .text p { color: var(--muted); font-size: 15px; }
    .newsletter-wrap form {
      display: flex; gap: 12px; flex-wrap: wrap;
      flex: 1; max-width: 500px;
    }
    .newsletter-wrap form input {
      flex: 1; min-width: 200px; padding: 14px 24px;
      border-radius: 60px; border: 2px solid var(--surface);
      font-size: 15px; background: #fff;
      transition: var(--transition); outline: none;
    }
    .newsletter-wrap form input:focus { border-color: var(--accent); box-shadow: 0 0 0 4px rgba(242,122,94,0.08); }
    .newsletter-wrap form .btn { background: var(--accent); color: #fff; border-color: var(--accent); padding: 14px 34px; }
    .newsletter-wrap form .btn:hover { background: var(--accent-dark); border-color: var(--accent-dark); }
    #newsletterMsg { margin-top: 12px; font-size: 14px; width: 100%; }

    /* ===== FOOTER ===== */
    footer { margin-top: 16px; padding: 48px 0 28px; border-top: 1px solid rgba(30,30,42,0.04); }
    .footer-grid {
      display: grid; grid-template-columns: 2.2fr 1fr 1fr 1fr; gap: 44px; margin-bottom: 32px;
    }
    .footer-grid .brand-col .brand { font-size: 22px; margin-bottom: 8px; }
    .footer-grid .brand-col p { color: var(--muted); font-size: 14px; max-width: 300px; line-height: 1.6; }
    .footer-grid .brand-col .socials { display: flex; gap: 12px; margin-top: 16px; }
    .footer-grid .brand-col .socials a {
      width: 42px; height: 42px; border-radius: 50%;
      background: var(--surface); display: grid; place-items: center;
      color: var(--muted); transition: var(--transition); font-size: 16px;
    }
    .footer-grid .brand-col .socials a:hover { background: var(--accent); color: #fff; }
    .footer-grid .col h5 { font-weight: 700; font-size: 15px; margin-bottom: 14px; }
    .footer-grid .col ul { list-style: none; display: flex; flex-direction: column; gap: 8px; }
    .footer-grid .col ul li a { color: var(--muted); font-size: 14px; transition: var(--transition); }
    .footer-grid .col ul li a:hover { color: var(--accent); }
    .footer-bottom { text-align: center; padding-top: 20px; border-top: 1px solid rgba(30,30,42,0.04); color: var(--muted-light); font-size: 13px; }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 1200px) {
      .products-grid { grid-template-columns: repeat(3,1fr); }
      .categories-grid { grid-template-columns: repeat(3,1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr; gap: 28px; }
    }
    @media (max-width: 992px) {
      .hero h1 { font-size: 40px; }
      .hero { min-height: 380px; margin: 16px 20px 0; padding: 40px 0; }
      .deal-wrap { flex-direction: column; }
      .deal-wrap .deal-img { flex: 0 0 200px; }
      .deal-wrap .deal-content { padding: 28px 32px; }
      .newsletter-wrap { padding: 32px 28px; flex-direction: column; text-align: center; }
      .newsletter-wrap form { max-width: 100%; }
      .search-wrap { min-width: 150px; }
      .top-promo { font-size: 19px; padding: 14px 16px; }
      .top-promo span { font-size: 20px; }
    }
    @media (max-width: 768px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: grid; place-items: center; }
      .products-grid { grid-template-columns: repeat(2,1fr); gap: 16px; }
      .categories-grid { grid-template-columns: repeat(2,1fr); gap: 12px; }
      .hero h1 { font-size: 30px; }
      .hero p { font-size: 15px; }
      .section-header h2 { font-size: 24px; }
      .deal-wrap .deal-content h3 { font-size: 24px; }
      .deal-wrap .deal-content .price-big { font-size: 28px; }
      .timer-box { min-width: 58px; padding: 8px 12px; }
      .timer-box .num { font-size: 20px; }
      .footer-grid { grid-template-columns: 1fr; gap: 24px; }
      .header-inner { flex-wrap: nowrap; }
      .brand { font-size: 20px; }
      .search-wrap { min-width: 100px; padding: 0 8px 0 14px; }
      .search-wrap input { font-size: 13px; padding: 8px 0; }
      .header-actions .icon-btn { width: 38px; height: 38px; font-size: 15px; }
      .cart-count { width: 18px; height: 18px; font-size: 10px; }
      .testimonial-card { flex: 0 0 280px; }
      .hero .actions .btn { padding: 10px 22px; font-size: 14px; }
      .section { padding: 36px 0; }
      .top-promo { font-size: 17px; padding: 12px 14px; gap: 8px; }
      .top-promo span { font-size: 18px; padding: 2px 14px; }
      .top-promo i { font-size: 18px; }
    }
    @media (max-width: 480px) {
      .products-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
      .categories-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
      .hero { margin: 10px 12px 0; min-height: 260px; padding: 24px 0; border-radius: var(--radius-sm); }
      .hero h1 { font-size: 24px; }
      .container { padding: 0 14px; }
      .deal-wrap .deal-content { padding: 20px 18px; }
      .deal-wrap .deal-img { flex: 0 0 140px; }
      .newsletter-wrap { padding: 20px 16px; }
      .newsletter-wrap .text h3 { font-size: 20px; }
      .product-card .body { padding: 12px 12px 8px; }
      .product-card .body h5 { font-size: 13px; }
      .product-card .body .price { font-size: 15px; }
      .product-card .footer { padding: 0 12px 12px; }
      .product-card .footer .add-btn { font-size: 12px; padding: 8px; }
      .timer-box { min-width: 44px; padding: 6px 8px; }
      .timer-box .num { font-size: 16px; }
      .timer-box .label { font-size: 9px; }
      .cat-card { padding: 16px 10px; }
      .cat-card .icon-wrap { width: 48px; height: 48px; font-size: 20px; }
      .cat-card h4 { font-size: 13px; }
      .top-promo { font-size: 15px; padding: 10px 12px; gap: 6px; }
      .top-promo span { font-size: 16px; padding: 2px 12px; }
      .top-promo i { font-size: 16px; }
      .top-promo .arrow { font-size: 16px; }
    }
  </style>
</head>
<body>

<!-- ===== TOP PROMO BANNER — LARGER FONT ===== -->
<div class="top-promo">
  <i class="fas fa-gift"></i>
  Hi Alekya, Shop for three tops just for <span>999 R/s</span>
  <i class="fas fa-arrow-right arrow"></i>
</div>

<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:12px;">
      <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">
        <i class="fas fa-bars"></i>
      </button>
      <a class="brand" href="#">
        <i class="fas fa-store-alt"></i>
        <span>Nexus<span class="accent">.</span></span>
      </a>
    </div>

    <nav class="main-nav" id="mainNav" aria-label="Main navigation">
      <ul>
        <li><a href="#" class="active"><i class="fas fa-compass"></i> Explore</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-bolt"></i> Flash</a></li>
        <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
      </ul>
    </nav>

    <div style="display:flex;align-items:center;gap:12px;">
      <div class="search-wrap" role="search">
        <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search" />
        <button id="searchBtn" aria-label="Submit search"><i class="fas fa-search"></i></button>
      </div>

      <div class="header-actions">
        <button class="icon-btn" title="Account" aria-label="Account"><i class="far fa-user"></i></button>
        <button class="icon-btn" title="Wishlist" aria-label="Wishlist"><i class="far fa-heart"></i></button>
        <div class="cart-wrap">
          <button class="icon-btn" id="cartBtn" title="Cart" aria-label="Cart">
            <i class="fas fa-shopping-bag"></i>
          </button>
          <span class="cart-count" id="cartCount">0</span>
        </div>
      </div>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a href="#"><i class="fas fa-compass"></i> Explore</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-bolt"></i> Flash</a></li>
        <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
        <li><a href="#"><i class="far fa-user"></i> Account</a></li>
        <li><a href="#"><i class="far fa-heart"></i> Wishlist</a></li>
      </ul>
    </div>
  </div>
</header>

<main>
  <!-- HERO -->
  <section class="hero" aria-label="Hero banner">
    <div class="container">
      <div class="badge"><i class="fas fa-sparkles"></i> Fresh drops · 2026</div>
      <h1>Curated <span>essentials</span><br>for everyday.</h1>
      <p>From tech to threads — discover a handpicked selection with free shipping on your first order.</p>
      <div class="actions">
        <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Start shopping</button>
        <button class="btn btn-outline" id="exploreDeals"><i class="fas fa-clock"></i> Flash deals</button>
      </div>
    </div>
  </section>

  <!-- CATEGORIES -->
  <section class="section" id="categories" aria-labelledby="cat-title">
    <div class="container">
      <div class="section-header">
        <div class="title-group">
          <h2 id="cat-title
