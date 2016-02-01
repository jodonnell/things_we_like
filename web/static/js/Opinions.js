import React from 'react';

export default class Opinions extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(<div>
           <div className="categoryName">{this.props.category}</div>
           <div className="backButton" onClick={this.back.bind(this)}>Back</div>
           </div>);
  }

  back() {
    this.props.onBackClicked();
  }
}
