import { Controller } from "@hotwired/stimulus"
import { Datepicker } from 'vanillajs-datepicker';

export default class extends Controller {
  static targets = [ 'checkin', 'checkout']
  connect() {
    const checkinPicker = new Datepicker(this.checkinTarget, {
      minDate: '9/12/2023'
    });
    checkinPicker.setOptions({
      minDate: '10/12/2023'
    });
    checkinPicker.setOptions({
      minDate: '11/12/2023'
    })
    new Datepicker(this.checkinTarget);
    new Datepicker(this.checkoutTarget);
  }
}
