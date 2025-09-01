const fs = require('fs');
const chalk = require('chalk');

/*
	* Create By Xyroo
	* Follow https://github.com/xyroodev
	* Whatsapp : https://whatsapp.com/channel/0029VaWOkNm7DAWtkvkJBK43
*/

//~~~~~~~~~~~~< GLOBAL SETTINGS >~~~~~~~~~~~~\\

global.owner = ['6289530227443'] //['628','628'] 2 owner atau lebih
global.author = 'Xyrootzz'
global.botname = 'xyroo-MD'
global.packname = 'Bot WhatsApp'
global.listprefix = ['+','!','.']

/*
- Setting Author, Packname, Botname sekarang pakai command
- Walau sudah diganti tidak berubah
- setbotauthor, setbotpackname, setbotname
*/

global.listv = ['•','●','■','✿','▲','➩','➢','➣','➤','✦','✧','△','❀','○','□','♤','♡','◇','♧','々','〆']
global.tempatDB = 'database.json' // Taruh url mongodb di sini jika menggunakan mongodb. Format : 'mongodb+srv://...'
global.tempatStore = 'baileys_store.json' // Taruh url mongodb di sini jika menggunakan mongodb. Format : 'mongodb+srv://...'
global.pairing_code = true
global.number_bot = '' // Kalo pake panel bisa masukin nomer di sini, jika belum ambil session. Format : '628xx'

global.fake = {
	anonim: 'https://telegra.ph/file/95670d63378f7f4210f03.png',
	thumbnailUrl: 'https://telegra.ph/file/fe4843a1261fc414542c4.jpg',
	thumbnail: fs.readFileSync('./src/media/xyroo.png'),
	docs: fs.readFileSync('./src/media/fake.pdf'),
	listfakedocs: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','application/vnd.openxmlformats-officedocument.presentationml.presentation','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/pdf'],
}

global.my = {
	yt: 'https://youtube.com/c/Xyroodev',
	gh: 'https://github.com/xyroodev',
	gc: 'https://chat.whatsapp.com/B5qJIwZHm4VEYZJQE6iMwy',
	ch: '120363401946548415@newsletter',
}

global.limit = {
	free: 20,
	premium: 999,
	vip: 9999
}

global.money = {
	free: 10000,
	premium: 1000000,
	vip: 10000000
}

global.mess = {
	key: 'Apikey mu telah habis silahkan kunjungi\nhttps://my.xyroo.pw',
	owner: 'Fitur Khusus Owner!',
	admin: 'Fitur Khusus Admin!',
	botAdmin: 'Bot Bukan Admin!',
	group: 'Gunakan Di Group!',
	private: 'Gunakan Di Privat Chat!',
	limit: 'Limit Anda Telah Habis!',
	prem: 'Khusus User Premium!',
	wait: 'Loading...',
	error: 'Error!',
	done: 'Done'
}

global.APIs = {
	hitori: 'https://api.hitori.pw',
}
global.APIKeys = {
	'https://api.hitori.pw': 'htrkey-77eb83c0eeb39d40',
	geminiApikey: ['AIzaSyC2DqQ74tI8Ei4DD3YuBGdGaEPoNcfNMiM','AIzaSyCL7gTsHyDPSc_VbJU1-KZ64Anp48Ud3xA','AIzaSyBSJKZm-SJ2BM5U8a7YB6gaVsNp4Mh045A','AIzaSyCvQSXTAI_h96_dy6QglOzvdtpgoDn4WZE','AIzaSyCxTMNH0pogASZ9jvc7frrRzdzg-xw77Os']
}

// Lainnya

global.badWords = ['tolol','goblok','asu','pantek','kampret','ngentot','jancok','kontol','memek','lonte']
global.chatLength = 1000

//~~~~~~~~~~~~~~~< PROCESS >~~~~~~~~~~~~~~~\\

let file = require.resolve(__filename)
fs.watchFile(file, () => {
	fs.unwatchFile(file)
	console.log(chalk.redBright(`Update ${__filename}`))
	delete require.cache[file]
	require(file)
});
