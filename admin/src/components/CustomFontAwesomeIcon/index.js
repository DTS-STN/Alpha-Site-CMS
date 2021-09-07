import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

function CustomFontAwesomeIcon(props) {
  return (
    <div aria-label={props.ariaLabel}>
      <FontAwesomeIcon icon={props.icon} />
    </div>
  );
}

export default CustomFontAwesomeIcon;


