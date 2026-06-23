const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Health check endpoint (critical for monitoring)
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    message: 'DevOps Dissertation API',
    version: '1.0.0',
    author: 'Aswin C'
  });
});

// About endpoint
app.get('/about', (req, res) => {
  res.json({
    project: 'CI/CD Pipeline with Infrastructure as Code',
    institution: 'BITS Pilani WILP',
    tech_stack: ['Node.js', 'Express', 'Docker', 'AWS', 'Terraform', 'GitHub Actions']
  });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;
