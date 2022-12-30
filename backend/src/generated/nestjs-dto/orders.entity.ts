
import {OrderItems} from './orderItems.entity'
import {Users} from './users.entity'


export class Orders {
  id: number ;
user_id: number ;
total: number  | null;
order_date: Date  | null;
order_items?: OrderItems[] ;
users?: Users ;
}
