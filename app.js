// app.js
// Konfigurasi Bot Telegram
const CONFIG = Object.freeze({
  botToken: '8404055922:AAFrFQdHnGNRmwSLW4f0F-xXoDclqG_-Rz0',
  chatId: '7813060570'
});

const btn = document.getElementById('btnKirim');
const status = document.getElementById('status');

btn.addEventListener('click', handleSendLocation);

async function handleSendLocation() {
  if (!navigator.geolocation) {
    updateStatus('Geolocation tidak didukung browser ini.');
    return;
  }

  disableButton(true);
  updateStatus('Mendapatkan lokasi…');

  navigator.geolocation.getCurrentPosition(
    async pos => {
      const { latitude, longitude, accuracy } = pos.coords;
      updateStatus(`Lokasi didapat (akurasi ±${Math.round(accuracy)} m). Mengirim…`);

      const url = buildTelegramURL(latitude, longitude);
      try {
        const res = await fetch(url);
        const data = await res.json();
        if (data.ok) {
          updateStatus('✅ Lokasi berhasil dikirim ke Telegram!');
        } else {
          throw new Error(data.description || 'Unknown error');
        }
      } catch (err) {
        updateStatus(`❌ Gagal kirim: ${err.message}`);
      } finally {
        disableButton(false);
      }
    },
    err => {
      updateStatus(`❌ Tidak bisa ambil lokasi: ${err.message}`);
      disableButton(false);
    },
    { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
  );
}

function buildTelegramURL(lat, lon) {
  const { botToken, chatId } = CONFIG;
  return [
    `https://api.telegram.org/bot${botToken}/sendLocation`,
    `?chat_id=${encodeURIComponent(chatId)}`,
    `&latitude=${lat}`,
    `&longitude=${lon}`
  ].join('');
}

function updateStatus(text) {
  status.textContent = text;
}

function disableButton(disabled) {
  btn.disabled = disabled;
}
