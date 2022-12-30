
import {Users} from './users.entity'


export class Tokens {
  id: number ;
token: string ;
user_id: number ;
expiration: Date ;
users?: Users ;
}
