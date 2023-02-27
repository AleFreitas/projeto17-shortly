import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { postUrl } from '../controller/URL.js';
import { PostUrlSchema } from '../schema/URLSchema.js';

const urlRouter = Router();

urlRouter.post("/urls/shorten", validateSchema(PostUrlSchema), postUrl);

export default urlRouter;