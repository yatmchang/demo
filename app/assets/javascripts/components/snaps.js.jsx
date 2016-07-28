var Masonry = require('react-masonry-component');

var masonryOptions = {
    transitionDuration: 0,
    gutter: 50,
    columnWidth: 400

};

var App = function (props) {
  // render: function (props.snaps) {
  //   var childElements = this.props.snaps.map(function(snap){
  //     return (
  //       <li className="image-element-class" key={snap.id]}>
  //         <img src={snap.picture.medium.url} />
  //       </li>
  //     );
  //   });

  return (
      <Masonry
        options={masonryOptions}>
       {snapImages(props.snaps)}
      </Masonry>
  )
}

function snapImages (snaps) {
  return snaps.map(
    function (snap) {
      return (
        <li key={snap.id}>
          <img src={snap.picture.medium.url}></img>
        </li>
      )
  })
}

window.App = App
