import React from "react";
import Category from "./Category";

export default class Categories extends React.Component {
  render() {
    return (<ul className="categories">{this.props.categories.map(category =>
                                                                  <li className="category">
                                                                  <Category name={category.name} />
                                                                  </li>
                                                                 )}</ul>);
  }
}
