import mapArray from '../fixtures/visualizations';
import usersArray from '../fixtures/users';
import * as Visualization from 'new-dashboard/core/visualization.js';

// Backbone Models
import ConfigModel from 'dashboard/data/config-model';
import UserModel from 'dashboard/data/user-model';

function configCartoModels (attributes = {}) {
  const user = new UserModel(attributes.user || usersArray[0]);
  const config = new ConfigModel(attributes.config || { maps_api_template: 'http://{user}.example.com' });
  return { user, config };
}

describe('visualization.js', () => {
  it('should return correct own url', () => {
    const $cartoModels = configCartoModels();
    const map = mapArray.visualizations[0];
    const url = Visualization.getURL(map, $cartoModels);

    expect(url).toBe('http://example.com/viz/e97e0001-f1c2-425e-8c9b-0fb28da59200');
  });

  it('should return correct shared url', () => {
    const $cartoModels = configCartoModels({ user: usersArray[1] });
    const map = mapArray.visualizations[0];

    console.log('$cartoModels', $cartoModels);
    const url = Visualization.getURL(map, $cartoModels);

    expect(url).toBe('http://cdb.localhost.lan:3000/viz/hello.e97e0001-f1c2-425e-8c9b-0fb28da59200');
  });

  it('should return correct regular thumbnail url', () => {
    const $cartoModels = configCartoModels();
    const map = mapArray.visualizations[0];

    const thumbnailUrl = Visualization.getThumbnailUrl(map, $cartoModels, { width: 288, height: 125 });

    expect(thumbnailUrl).toBe('http://hello.example.com/api/v1/map/static/named/tpl_e97e0001_f1c2_425e_8c9b_0fb28da59200/288/125.png');
  });

  it('should return correct cdn thumbnail url', () => {
    const cdnConfig = {
      cdn_url: {
        http: 'cdn.example.com',
        https: 'cdn.example.com'
      }
    };

    const $cartoModels = configCartoModels({ config: cdnConfig });
    const map = mapArray.visualizations[0];

    const thumbnailUrl = Visualization.getThumbnailUrl(map, $cartoModels, { width: 288, height: 125 });

    expect(thumbnailUrl).toBe('http://cdn.example.com/hello/api/v1/map/static/named/tpl_e97e0001_f1c2_425e_8c9b_0fb28da59200/288/125.png');
  });
});