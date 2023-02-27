import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { postUrl, getUrlById, redirectToUrl, deleteShortUrl, getUserData } from '../controller/URL.js';
import { PostUrlSchema } from '../schema/URLSchema.js';

const urlRouter = Router();

urlRouter.post("/urls/shorten", validateSchema(PostUrlSchema), postUrl);
urlRouter.get("/urls/:id", getUrlById)
urlRouter.get("/urls/open/:shortUrl", redirectToUrl)
urlRouter.delete("/urls/:id", deleteShortUrl)
urlRouter.get("/users/me", getUserData)

export default urlRouter;