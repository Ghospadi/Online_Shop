
import {Orders} from './orders.entity'
import {Reviews} from './reviews.entity'
import {Tokens} from './tokens.entity'


export class Users {
  id: number ;
name: string ;
age: number ;
email: string ;
password: string ;
country: string ;
city: string ;
address: string ;
role_id: number  | null;
orders?: Orders[] ;
reviews?: Reviews[] ;
tokens?: Tokens[] ;
}
