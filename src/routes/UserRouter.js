import { Router } from 'express';
import { validateSchema } from '../middleware/validateSchema.js';
import { SignUpSchema, SignInSchema } from '../schema/UserSchema.js';
import { signUp, signIn } from '../controller/User.js';

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(SignUpSchema), signUp);
usersRouter.post("/signin", validateSchema(SignInSchema), signIn);

export default usersRouter;