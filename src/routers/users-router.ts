import { Router } from 'express';

import { usersPost } from '@/controllers';
import { validateBody } from '@/middlewares';
import { createUserModel } from '@/models';

const usersRouter = Router();

usersRouter.post('/', validateBody(createUserModel), usersPost);

export { usersRouter };
