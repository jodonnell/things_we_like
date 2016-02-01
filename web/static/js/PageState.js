import React from 'react';
import Categories from './Categories';

export default class PageState extends React.Component {
  constructor(props) {
    super(props);
    this.showCategories();
  }

  showCategories() {
    this.setState({
      categories: true,
      likes: false
    });

  }

  showLikes() {
    this.setState({
      categories: false,
      likes: true
    });

  }

  render() {
    return (<Categories onCategorySelect={this.categorySelected.bind(this)} />);
  }

  categorySelected() {
    this.showLikes();
  }
}
