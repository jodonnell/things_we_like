import React from 'react';

export default class Opinions extends React.Component {
  constructor(props) {
    super(props);

    this.state = {opinions: []};
    this.getAllOpinions();
  }

  getAllOpinions() {
    $.get('/opinions', {category: this.props.category}, (opinions) => {
      this.setState({
        opinions: opinions['data']
      });
    });
  }

  render() {

    return (<div>
            <div className="categoryName">{this.props.category}</div>
            {this.chunk('like', this.likes())}
            {this.chunk('dislike', this.dislikes())}

            <div className="backButton" onClick={this.back.bind(this)}>Back</div>
            </div>
           );
  }

  likes() {
    return this.state.opinions.filter(opinion => {return opinion.like === true;});
  }

  dislikes() {
    return this.state.opinions.filter(opinion => {return opinion.like === false;});
  }

  chunk(type, opinions) {
    const upper = this.capitalizeFirstLetter(type);
    return (<div className={type}>
            <ul className="opinions">{opinions.map(opinion =>
                                                   <li key={opinion.id} className="opinion">
                                                   {opinion.name}
                                                   </li>
                                                  )}</ul>
            <label htmlFor={`add_opinion_${type}`}>{upper}</label>
            <input id={`add_opinion_${type}`} data-type={type} type="text" onKeyPress={this.checkEnter.bind(this)} />
            <input type="submit" value={upper} data-type={type} onClick={this.addOpinion.bind(this)} />
            </div>);

  }

   capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
  }

  checkEnter(e) {
    if(e.key === 'Enter') {
      this.addOpinion(e);
    }
  }

  addOpinion(e) {
    const type = e.currentTarget.dataset.type;

    const newOpinion = $(`#add_opinion_${type}`).val();
    $(`#add_opinion_${type}`).val('');

    if (newOpinion.length === 0) {
      return;
    }

    const like = type === 'like';

    $.post('/opinions', {opinion: {name: newOpinion, like: like}, category: this.props.category}, () => {
      this.getAllOpinions();
    });
  }


  back() {
    this.props.onBackClicked();
  }
}
