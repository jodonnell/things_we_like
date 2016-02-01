import React from 'react';
import Category from './Category';

export default class Categories extends React.Component {
  constructor(props) {
    super(props);
    this.state = {categories: null};

    this.getAllCategories();
  }

  getAllCategories() {
    $.get('/categories', (categories) => {
      this.setState({
        categories: categories['data']
      });
    });
  }

  render() {
    if (this.state.categories === null) {
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
    return (<div><ul className="categories">{this.state.categories.map(category =>
                                                                       <li key={category.id} className="category" onClick={this.showCategory.bind(this)} >
                                                                       <Category name={category.name} />
                                                                       </li>
                                                                      )}</ul>
            <label htmlFor="add_category">New Category</label>
            <input id="add_category" type="text" onKeyPress={this.checkEnter.bind(this)} />
            <input type="submit" value="Add" onClick={this.addCategory.bind(this)} />
            </div>
           );
  }

  addCategory() {
    $.post('/categories', {category: {name: $('#add_category').val()}}, () => {
      this.getAllCategories();
    });
  }

  checkEnter(e) {
    if(e.key === 'Enter') {
      this.addCategory();
    }
  }

  showCategory(e) {
    const category = e.currentTarget.textContent;
    this.props.onCategorySelect(category);
  }
}
