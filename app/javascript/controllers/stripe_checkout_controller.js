import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

export default class extends Controller {
  static values = { url: String }

  async connect() {
    const stripePublicKey = document.head.querySelector("meta[name='stripe-pk']").content
    const stripe = Stripe(stripePublicKey)

    const fetchClientSecret = async () => {
      const response = await post(this.urlValue);
      const { clientSecret } = await response.json;
      return clientSecret;
    };
  
    const checkout = await stripe.initEmbeddedCheckout({
      fetchClientSecret,
    });
  
    checkout.mount(this.element);
    }
  }

