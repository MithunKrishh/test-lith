const http = require("http");
http.createServer((_, res) => res.end("ok")).listen(3000);