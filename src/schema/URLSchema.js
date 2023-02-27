import joi from 'joi';

export const PostUrlSchema = joi.object({
    url: joi.string().uri().required()
});