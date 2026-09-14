:root {
  --bg: #121212;
  --card: #1e1e1e;
  --primary: #e0e0e0;
  --accent: #00bcd4;
  --accent-light: #004d5a;
  --accent-dark: #0097a7;
  --muted: #9e9e9e;
  --surface: #1a1a1a;
  --shadow: 0 0 12px rgba(0,188,212,0.2);
  --shadow-hover: 0 0 20px rgba(0,188,212,0.4);
}

body {
  background: var(--bg);
  color: var(--primary);
}

header, footer {
  background: #1a1a1a;
  border-color: rgba(255,255,255,0.05);
}

.btn-primary {
  background: var(--accent);
  color: #121212;
  border-color: var(--accent);
}
.btn-primary:hover {
  background: var(--accent-dark);
  box-shadow: var(--shadow-hover);
}

.product-card, .cat-card, .deal-wrap, .testimonial-card {
  background: var(--card);
  border: 1px solid rgba(255,255,255,0.05);
}
.product-card:hover, .cat-card:hover {
  box-shadow: var(--shadow-hover);
  transform: translateY(-4px);
}
