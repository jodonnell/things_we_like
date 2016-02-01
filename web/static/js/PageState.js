import React from 'react';
import Categories from './Categories';
import Opinions from './Opinions';

export default class PageState extends React.Component {
  constructor(props) {
    super(props);

    this.state = {categories: true, opinions: false};
  }

  showCategories() {
    this.setState({
      categories: true,
      opinions: false
    });
  }

  showOpinions() {
    this.setState({
      categories: false,
      opinions: true
    });

  }

  render() {
    if (this.state.categories) {
      return (<Categories onCategorySelect={this.categorySelected.bind(this)} />);
    }
    else if (this.state.opinions) {
      return (<Opinions onBackClicked={this.backToCategories.bind(this)} category={this.currentCategory} />);
    }
  }

  categorySelected(category) {
    this.showOpinions();
    this.currentCategory = category;
  }

  backToCategories() {
    this.showCategories();
    this.currentCategory = null;
  }

}
