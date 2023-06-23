import Joi from 'joi';
import { SignInParams } from '@/services';

export const signInModel = Joi.object<SignInParams>({
  email: Joi.string().email().required(),
  password: Joi.string().required(),
});
