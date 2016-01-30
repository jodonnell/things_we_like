import React from 'react';
import Category from './Category';

export default class Categories extends React.Component {
  constructor(props) {
    super(props);
    this.state = {categories: []};

    $.get('/categories', (categories) => {
      this.setState({
        categories: categories['data']
      });
    });
  }

  render() {
    if (this.state.categories.length === 0) {
      return this.loading();
    }
    else {
      return this.showCategories();
    }
  }

  loading() {
    return(<div>Loading....</div>);
  }

  showCategories() {
    return (<ul className="categories">{this.state.categories.map(category =>
                                                                  <li className="category">
                                                                  <Category name={category.name} />
                                                                  </li>
                                                                 )}</ul>);
  }
}
