import { User } from '@prisma/client';
import Joi from 'joi';

export const createUserModel = Joi.object<User>({
  email: Joi.string().email().required(),
  username: Joi.string().required(),
  image_url: Joi.string().uri(),
  password: Joi.string().min(6).required(),
});
