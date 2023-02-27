import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { postUrl, getUrlById } from '../controller/URL.js';
import { PostUrlSchema } from '../schema/URLSchema.js';

const urlRouter = Router();

urlRouter.post("/urls/shorten", validateSchema(PostUrlSchema), postUrl);
urlRouter.get("/urls/:id", getUrlById)

export default urlRouter;