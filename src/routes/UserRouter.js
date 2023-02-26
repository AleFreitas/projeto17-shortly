import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { UserSchema } from '../schema/UserSchema.js';
import { signUp } from '../controller/User.js';

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(UserSchema), signUp);

export default usersRouter;