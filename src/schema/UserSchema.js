import joi from 'joi';

export const SignUpSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().email().required(),
    password: joi.string().required(),
    confirmPassword: joi.string().required()
});

export const SignInSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
});