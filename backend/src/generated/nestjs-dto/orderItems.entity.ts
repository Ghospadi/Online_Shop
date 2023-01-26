
import {Orders} from './orders.entity'
import {Products} from './products.entity'


export class OrderItems {
  id: number ;
order_id: number  | null;
product_id: number  | null;
quantity: number  | null;
price: number  | null;
orders?: Orders  | null;
products?: Products  | null;
}
