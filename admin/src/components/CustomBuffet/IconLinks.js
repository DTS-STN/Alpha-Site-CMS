import React from 'react';
import PropTypes from 'prop-types';
import { Links as StyledLinks } from '@buffetjs/styles';
import Icon from './Icon';

function IconLinks({ links }) {
  return (
    <StyledLinks>
      {links.map(({ icon, onClick, ariaLabel }, index) => (
        <button key={index} onClick={onClick} type="button" aria-label={ariaLabel ? ariaLabel : icon.type.name}>
          <Icon className="link-icon" icon={icon} />
        </button>
      ))}
    </StyledLinks>
  );
}

IconLinks.defaultProps = {
  links: [],
};

IconLinks.propTypes = {
  links: PropTypes.arrayOf(
    PropTypes.shape({
      icon: PropTypes.node,
      onClick: PropTypes.func,
    })
  ),
};

export default IconLinks;
