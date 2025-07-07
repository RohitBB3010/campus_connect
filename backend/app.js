import express from 'express';
import mongoose from 'mongoose';
import bodyParser from 'body-parser';
import authRoutes from './routes/auth_routes.js';
import homeRoutes from './routes/home_routes.js';
import dataRoutes from './data-filling/data_filler_route.js';
import committeeRoutes from './routes/committee_routes.js';
import path from 'path';
import parentDir from './utils/path_locals.js';

const app = express();

app.use(bodyParser.urlencoded({extended : false}));
app.use(express.json());
app.use('/images', express.static(path.join(parentDir, 'images')));

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, PATCH');
  next();
})

app.use('/data-filler', dataRoutes);
app.use('/auth', authRoutes);
app.use('/home', homeRoutes);
app.use('/committee', committeeRoutes);

app.use((req, res, next) => {
    mongoose.connection.on('connected', () => {
        console.log('MongoDB is connected');
      });
      
      mongoose.connection.on('error', (error) => {
        console.error('MongoDB connection error:', error);
      });
});

mongoose.connect(process.env.MongoUrl).then((result) => {
    app.listen(8000);
    console.log("Connected to mongodb");

}).catch(err => {
    console.log(err);
});
