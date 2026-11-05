<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Certificate of Achievement — Taona Munikwa</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;700;900&family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.2/dist/confetti.browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
<style>
  :root {
    --ink: #1a1a1a;
    --gold: #b8962e;
    --gold-light: #e6c96a;
    --paper: #fdfbf5;
    --paper-edge: #f3ecd9;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background:
      radial-gradient(circle at 50% 0%, #2a2a2a 0%, #111 60%, #000 100%);
    padding: 32px 16px 96px;
    font-family: 'Cormorant Garamond', Georgia, serif;
    color: var(--ink);
  }

  /* ---------- CERTIFICATE ---------- */
  .certificate {
    position: relative;
    width: min(880px, 100%);
    aspect-ratio: 1.414 / 1; /* A4-ish landscape */
    background: var(--paper);
    padding: 26px;
    box-shadow:
      0 0 0 1px rgba(0,0,0,0.06),
      0 30px 80px -20px rgba(0,0,0,0.8),
      0 0 120px -30px rgba(184,150,46,0.35);
  }

  /* ornate double border */
  .certificate::before {
    content: "";
    position: absolute;
    inset: 14px;
    border: 2px solid var(--gold);
    pointer-events: none;
  }
  .certificate::after {
    content: "";
    position: absolute;
    inset: 22px;
    border: 1px solid var(--gold);
    opacity: 0.55;
    pointer-events: none;
  }

  /* corner flourishes */
  .corner {
    position: absolute;
    width: 54px;
    height: 54px;
    border-color: var(--gold);
    border-style: solid;
    opacity: 0.9;
  }
  .corner.tl { top: 30px; left: 30px; border-width: 2px 0 0 2px; }
  .corner.tr { top: 30px; right: 30px; border-width: 2px 2px 0 0; }
  .corner.bl { bottom: 30px; left: 30px; border-width: 0 0 2px 2px; }
  .corner.br { bottom: 30px; right: 30px; border-width: 0 2px 2px 0; }

  .corner::after {
    content: "✦";
    position: absolute;
    color: var(--gold);
    font-size: 14px;
  }
  .corner.tl::after { top: -8px; left: -6px; }
  .corner.tr::after { top: -8px; right: -6px; }
  .corner.bl::after { bottom: -8px; left: -6px; }
  .corner.br::after { bottom: -8px; right: -6px; }

  /* watermark texture */
  .watermark {
    position: absolute;
    inset: 0;
    background-image:
      repeating-linear-gradient(45deg, rgba(184,150,46,0.03) 0 2px, transparent 2px 12px);
    pointer-events: none;
  }

  /* ---------- CONTENT ---------- */
  .content {
    position: relative;
    z-index: 2;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 34px 56px 30px;
  }

  .header-rule {
    display: flex;
    align-items: center;
    gap: 14px;
    width: 100%;
    max-width: 460px;
    margin-bottom: 14px;
  }
  .header-rule .line { flex: 1; height: 1px; background: var(--gold); opacity: 0.7; }
  .header-rule .diamond {
    width: 7px; height: 7px;
    background: var(--gold);
    transform: rotate(45deg);
  }

  .title {
    font-family: 'Cinzel', serif;
    font-weight: 900;
    font-size: clamp(16px, 3.1vw, 30px);
    letter-spacing: 0.22em;
    color: var(--ink);
    text-transform: uppercase;
    margin-bottom: 4px;
  }

  .subtitle {
    font-family: 'Cormorant Garamond', serif;
    font-style: italic;
    font-size: clamp(11px, 1.6vw, 15px);
    letter-spacing: 0.14em;
    color: #6b5b2e;
    margin-bottom: 18px;
  }

  .awarded-to {
    font-family: 'Cinzel', serif;
    font-size: clamp(9px, 1.3vw, 12px);
    letter-spacing: 0.3em;
    color: #7a6a45;
    text-transform: uppercase;
    margin-bottom: 6px;
  }

  .recipient {
    font-family: 'Cinzel', serif;
    font-weight: 700;
    font-size: clamp(26px, 5.2vw, 52px);
    letter-spacing: 0.06em;
    line-height: 1.1;
    margin-bottom: 4px;
    background: linear-gradient(180deg, #1a1a1a 0%, #3a3220 100%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .recipient-rule {
    width: 60%;
    max-width: 320px;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--gold), transparent);
    margin: 10px 0 18px;
  }

  .achievement {
    font-size: clamp(13px, 1.9vw, 18px);
    line-height: 1.55;
    max-width: 640px;
    color: #2a2a2a;
  }
  .achievement strong {
    font-weight: 600;
    color: #000;
    letter-spacing: 0.02em;
  }

  .oneliner {
    font-style: italic;
    font-size: clamp(11px, 1.55vw, 14.5px);
    color: #5c4f30;
    max-width: 600px;
    margin-top: 6px;
    line-height: 1.5;
  }

  .citation {
    font-size: clamp(11px, 1.6vw, 14.5px);
    line-height: 1.6;
    max-width: 620px;
    margin-top: 22px;
    color: #3a3528;
  }

  /* ---------- FOOTER: signature + seal ---------- */
  .footer {
    margin-top: auto;
    width: 100%;
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    gap: 24px;
    padding: 0 4px;
  }

  .signature-block {
    text-align: center;
    min-width: 180px;
  }
  .sig-line {
    height: 1px;
    background: #333;
    margin-bottom: 8px;
  }
  .sig-name {
    font-family: 'Cinzel', serif;
    font-size: clamp(10px, 1.4vw, 13px);
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: #1a1a1a;
  }
  .sig-title {
    font-style: italic;
    font-size: clamp(9px, 1.2vw, 11.5px);
    color: #6b5b2e;
    margin-top: 3px;
  }

  .date-block {
    text-align: center;
    min-width: 180px;
    padding-bottom: 4px;
  }
  .date-line {
    height: 1px;
    background: #333;
    margin-bottom: 8px;
  }
  .date-label {
    font-family: 'Cinzel', serif;
    font-size: clamp(9px, 1.2vw, 11px);
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: #1a1a1a;
  }
  .date-sub {
    font-style: italic;
    font-size: clamp(9px, 1.2vw, 11.5px);
    color: #6b5b2e;
    margin-top: 3px;
  }

  /* ---------- SEAL with QR ---------- */
  .seal-wrap {
    position: relative;
    flex-shrink: 0;
    width: clamp(96px, 15vw, 132px);
    aspect-ratio: 1;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .seal-ring {
    position: absolute;
    inset: 0;
    border-radius: 50%;
    background:
      radial-gradient(circle at 30% 25%, var(--gold-light) 0%, var(--gold) 45%, #7a621c 100%);
    box-shadow:
      inset 0 0 0 3px rgba(255,255,255,0.35),
      inset 0 0 18px rgba(0,0,0,0.25),
      0 6px 16px rgba(0,0,0,0.35);
  }

  .seal-ring::before {
    content: "";
    position: absolute;
    inset: 9px;
    border-radius: 50%;
    border: 1.5px dashed rgba(255,255,255,0.6);
  }

  .seal-inner {
    position: relative;
    z-index: 2;
    width: 62%;
    height: 62%;
    background: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.25), inset 0 0 0 2px #fff;
    overflow: hidden;
  }
  .seal-inner img {
    width: 88%;
    height: 88%;
    object-fit: contain;
    display: block;
  }

  .seal-text {
    position: absolute;
    inset: 0;
    z-index: 1;
    font-family: 'Cinzel', serif;
    font-size: clamp(6px, 0.9vw, 7.5px);
    letter-spacing: 0.24em;
    color: rgba(255,255,255,0.85);
    text-transform: uppercase;
    pointer-events: none;
  }
  .seal-text span {
    position: absolute;
    top: 50%;
    left: 50%;
    transform-origin: 0 0;
  }

  /* ---------- CONTROLS ---------- */
  .controls {
    position: fixed;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 12px;
    z-index: 100;
  }

  .btn {
    font-family: 'Cinzel', serif;
    font-size: 12px;
    letter-spacing: 0.16em;
    text-transform: uppercase;
    padding: 12px 26px;
    border: 1px solid var(--gold);
    background: rgba(20,20,20,0.92);
    color: var(--gold-light);
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(8px);
  }
  .btn:hover {
    background: var(--gold);
    color: #111;
    box-shadow: 0 0 24px rgba(184,150,46,0.5);
  }
  .btn:active { transform: translateY(1px); }

  /* ---------- Responsive ---------- */
  @media (max-width: 700px) {
    .certificate { aspect-ratio: auto; min-height: 620px; padding: 18px; }
    .content { padding: 28px 24px 24px; }
    .footer { flex-direction: column; align-items: center; gap: 18px; margin-top: 24px; }
    .signature-block, .date-block { width: 70%; }
    .seal-wrap { order: -1; }
    .btn { padding: 10px 18px; font-size: 11px; }
  }

  @media print {
    body { background: #fff; padding: 0; }
    .controls { display: none; }
    .certificate { box-shadow: none; width: 100%; }
  }
</style>
</head>
<body>

<div class="certificate" id="certificate">
  <div class="watermark"></div>
  <div class="corner tl"></div>
  <div class="corner tr"></div>
  <div class="corner bl"></div>
  <div class="corner br"></div>

  <div class="content">
    <div class="header-rule">
      <div class="line"></div>
      <div class="diamond"></div>
      <div class="line"></div>
    </div>

    <h1 class="title">Certificate of Achievement</h1>
    <div class="subtitle">Presented in recognition of a first launch</div>

    <div class="awarded-to">Awarded to</div>
    <div class="recipient">Taona Munikwa</div>
    <div class="recipient-rule"></div>

    <p class="achievement">
      For successfully distributing <strong>MOVO Couriers</strong> — their first application — to the world.
    </p>
    <p class="oneliner">
      "Redefining urban logistics with precision, velocity, and absolute security across Zimbabwe."
    </p>

    <p class="citation">
      Whereas the recipient did stare down bugs, build errors, and at least one <em>very</em> late night —
      and did nonetheless ship — let it be known that an idea has officially become something real.
      Their friends are, quite frankly, obnoxiously proud. Here's to the first of many.
    </p>

    <div class="footer">
      <div class="signature-block">
        <div class="sig-line"></div>
        <div class="sig-name">Your Name Here</div>
        <div class="sig-title">Chief Friendship Officer</div>
      </div>

      <div class="seal-wrap">
        <div class="seal-ring"></div>
        <div class="seal-text" id="sealText"></div>
        <div class="seal-inner">
          <img id="qrImg" alt="QR code to MOVO Couriers on the App Store">
        </div>
      </div>

      <div class="date-block">
        <div class="date-line"></div>
        <div class="date-label">Thursday, 5 November 2026</div>
        <div class="date-sub">Date of First Ship</div>
      </div>
    </div>
  </div>
</div>

<div class="controls">
  <button class="btn" onclick="downloadPNG()">Download as PNG</button>
  <button class="btn" onclick="celebrate()">Celebrate 🎉</button>
</div>

<script>
  // ---- EDIT ME ----
  const APP_STORE_URL = "https://apps.apple.com/us/app/movo-couriers/id6823096157";
  // ----------------

  // Generate QR code via a free API (no key needed)
  const qrImg = document.getElementById('qrImg');
  qrImg.src = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=0&data=" + encodeURIComponent(APP_STORE_URL);

  // ---- Circular text around the seal ----
  (function buildSealText() {
    const text = "★ CERTIFIED SHIPPED ★ MOVO COURIERS ★";
    const container = document.getElementById('sealText');
    const chars = text.split('');
    const radius = 46; // percent-ish
    const step = 360 / chars.length;
    chars.forEach((ch, i) => {
      const span = document.createElement('span');
      span.textContent = ch;
      span.style.transform =
        `translate(-50%, -50%) rotate(${i * step}deg) translateY(-${radius}%)`;
      container.appendChild(span);
    });
  })();

  // ---- Confetti ----
  function celebrate() {
    const duration = 2200;
    const end = Date.now() + duration;
    const colors = ['#b8962e', '#e6c96a', '#ffffff', '#1a1a1a'];

    (function frame() {
      confetti({
        particleCount: 4,
        angle: 60,
        spread: 70,
        origin: { x: 0, y: 0.7 },
        colors
      });
      confetti({
        particleCount: 4,
        angle: 120,
        spread: 70,
        origin: { x: 1, y: 0.7 },
        colors
      });
      if (Date.now() < end) requestAnimationFrame(frame);
    })();

    // center burst
    confetti({
      particleCount: 120,
      spread: 100,
      origin: { y: 0.55 },
      colors,
      scalar: 1.1
    });
  }

  // Fire on load (with a little delay for effect)
  window.addEventListener('load', () => setTimeout(celebrate, 350));

  // ---- Download as PNG ----
  async function downloadPNG() {
    const btn = event.target;
    const original = btn.textContent;
    btn.textContent = 'Preparing…';
    btn.disabled = true;

    try {
      // Hide the confetti canvas and prep element
      const cert = document.getElementById('certificate');
      const canvas = await html2canvas(cert, {
        scale: 3,
        backgroundColor: '#fdfbf5',
        useCORS: true,
        allowTaint: false,
        logging: false
      });

      const link = document.createElement('a');
      link.download = 'MOVO-Certificate-Taona-Munikwa.png';
      link.href = canvas.toDataURL('image/png');
      link.click();
    } catch (err) {
      console.error(err);
      alert('Could not generate the image automatically. You can also right-click the certificate and choose "Save image", or press Ctrl/Cmd+P to print to PDF.');
    } finally {
      btn.textContent = original;
      btn.disabled = false;
    }
  }

  // Keyboard shortcut: press "C" to celebrate
  document.addEventListener('keydown', (e) => {
    if (e.key.toLowerCase() === 'c' && !e.metaKey && !e.ctrlKey) celebrate();
  });
</script>

</body>
</html>
