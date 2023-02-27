import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { postUrl, getUrlById, redirectToUrl } from '../controller/URL.js';
import { PostUrlSchema } from '../schema/URLSchema.js';

const urlRouter = Router();

urlRouter.post("/urls/shorten", validateSchema(PostUrlSchema), postUrl);
urlRouter.get("/urls/:id", getUrlById)
urlRouter.get("/urls/open/:shortUrl", redirectToUrl)

export default urlRouter;