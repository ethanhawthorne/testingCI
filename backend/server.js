const express = require('express');

const app = express();
const port = process.env.PORT || 3001;

app.get('/api/health', (_req, res) => {
  res.json({ status: 'ok', service: 'testingci-backend' });
});

app.get('/', (_req, res) => {
  res.send('TestingCI backend is running');
});

app.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});
