import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import usersRouter from "./routes/UserRouter.js";
import urlRouter from "./routes/URLRouter.js";

dotenv.config();

const server = express();
server.use(express.json());
server.use(cors());
server.use(usersRouter);
server.use(urlRouter);

const port = process.env.PORT || 5001;
server.listen(port, () => console.log(`Server running in port: ${port}`));