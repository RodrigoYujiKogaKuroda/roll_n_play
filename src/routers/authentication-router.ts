import { Router } from 'express';

import { signInPost } from '@/controllers';
import { validateBody } from '@/middlewares';
import { signInModel } from '@/models';

const authenticationRouter = Router();

authenticationRouter.post('/sign-in', validateBody(signInModel), signInPost);

export { authenticationRouter };
