// Render the HTML composition and retain reproducible visual QA artifacts.
const fs = require('fs');
const path = require('path');
const http = require('http');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
(async () => {
  const server = http.createServer((req,res) => {
    const file = path.join(__dirname, path.basename(new URL(req.url,'http://localhost').pathname) || 'preview.html');
    if (!fs.existsSync(file)) { res.writeHead(404); res.end(); return; }
    res.setHeader('Content-Type', file.endsWith('.json') ? 'application/json' : file.endsWith('.png') ? 'image/png' : 'text/html; charset=utf-8');
    res.end(fs.readFileSync(file));
  });
  await new Promise(resolve => server.listen(0,'127.0.0.1',resolve));
  let browser;
  try {
    browser = await chromium.launch({channel:'chrome',headless:true});
    const page = await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
    const url = `http://127.0.0.1:${server.address().port}/preview.html`;
    for (const [mode,file] of [['','../Mod/About/Preview.png'],['source','Preview.png'],['background','preview-background.png']]) {
      await page.goto(url+'?mode='+mode);
      await page.evaluate(() => window.ready);
      await page.screenshot({path:path.join(__dirname,file)});
      if (!mode) console.log(JSON.stringify(await page.evaluate(() => ({font:document.fonts.check('46px "Segoe UI"'),boxes:[...document.querySelectorAll('h1,h1 span,.tag,p,.version')].map(e => ({selector:e.tagName+'.'+e.className,text:e.textContent,color:getComputedStyle(e).color,box:e.getBoundingClientRect().toJSON()}))})),null,2));
    }
  } finally { if(browser) await browser.close(); server.close(); }
})().catch(e => { console.error(e); process.exitCode=1; });
