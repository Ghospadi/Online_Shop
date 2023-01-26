
import {Users} from './users.entity'
import {Products} from './products.entity'


export class Reviews {
  id: number ;
user_id: number  | null;
product_id: number  | null;
rating: number  | null;
review: string  | null;
timestamp: Date  | null;
users?: Users  | null;
products?: Products  | null;
}
