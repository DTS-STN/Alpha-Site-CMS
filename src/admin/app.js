import SCLLogo from './extensions/sample.png'
import en from './extensions/translations/en.json';
import fr from './extensions/translations/fr.json';

export default {
  config: {
    auth: {
      logo: SCLLogo
    },
    menu: {
      logo: SCLLogo
    },
    theme: {
    },
    locales: ['fr'],
    translations: {
      en,
      fr
    }
  },
  bootstrap() {}
}
