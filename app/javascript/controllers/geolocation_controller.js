import { Controller } from '@hotwired/stimulus';
import { getPreciseDistance, convertDistance } from 'geolib';
import { isEmpty } from 'lodash-es';

export default class extends Controller {
  static targets = ['property'];

  connect() {
    // If the controller doesn't have the user's geolocation, it gets the browser's geolocation
    if (isEmpty(this.element.dataset.latitude) && isEmpty(this.element.dataset.longitude)) {
      window.navigator.geolocation.getCurrentPosition(
        (position) => {
          this.setUserCoordinates(position.coords);
          this.setDistanceText();
        },
        (error) => {
          console.error('Error getting geolocation:', error);
        }
      );
    } else {
      this.setDistanceText();
    }
  }

  setUserCoordinates(coordinates) {
    this.element.dataset.latitude = coordinates.latitude;
    this.element.dataset.longitude = coordinates.longitude;
  }

  getUserCoordinates() {
    return {
      latitude: parseFloat(this.element.dataset.latitude), // Parse as float to ensure numeric values
      longitude: parseFloat(this.element.dataset.longitude), // Parse as float to ensure numeric values
    };
  }

  setDistanceText() {
    this.propertyTargets.forEach((propertyTarget) => {
      const targetLatitude = parseFloat(propertyTarget.dataset.latitude);
      const targetLongitude = parseFloat(propertyTarget.dataset.longitude);

      // Check if latitude and longitude are valid numbers
      if (!isNaN(targetLatitude) && !isNaN(targetLongitude)) {
        const distanceFrom = getPreciseDistance(this.getUserCoordinates(), {
          latitude: targetLatitude,
          longitude: targetLongitude,
        });

        propertyTarget.querySelector('[data-distance-away]').innerHTML = `${Math.round(
          convertDistance(distanceFrom, 'km')
        )} kilometers away`;
      } else {
        // Handle the case where latitude or longitude is not a valid number
        propertyTarget.querySelector('[data-distance-away]').innerHTML = 'Distance unavailable';
        console.error('Invalid latitude or longitude values:', targetLatitude, targetLongitude);
      }
    });
  }
}
