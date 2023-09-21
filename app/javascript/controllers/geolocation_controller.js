import { Controller } from '@hotwired/stimulus'
import { getDistance, convertDistance } from 'geolib';

export default class extends Controller {
  static targets = ['property'];

  connect() {
    // if the controller doesn't have the user's geolocation, it gets the browser's geolocation
      window.navigator.geolocation.getCurrentPosition((position)  => {
        this.element.dataset.latitude = coordinates.latitude;
        this.element.dataset.longitude = coordinates.longitude;
      })
  }
}
 