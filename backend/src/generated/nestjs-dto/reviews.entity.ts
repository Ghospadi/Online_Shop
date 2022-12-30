
import {Users} from './users.entity'
import {Products} from './products.entity'


export class Reviews {
  id: number ;
user_id: number ;
product_id: number ;
rating: number  | null;
review: string ;
timestamp: Date  | null;
users?: Users ;
products?: Products ;
}
