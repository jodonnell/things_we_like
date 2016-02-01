import React from 'react';
import Categories from './Categories';
import Likes from './Likes';

export default class PageState extends React.Component {
  constructor(props) {
    super(props);

    this.state = {categories: true, likes: false};
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
    if (this.state.categories) {
      return (<Categories onCategorySelect={this.categorySelected.bind(this)} />);
    }
    else if (this.state.likes) {
      return (<Likes onBackClicked={this.backToCategories.bind(this)} category={this.currentCategory} />);
    }
  }

  categorySelected(category) {
    this.showLikes();
    this.currentCategory = category;
  }

  backToCategories() {
    this.showCategories();
    this.currentCategory = null;
  }

}
