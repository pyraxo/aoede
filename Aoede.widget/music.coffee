command: "osascript 'Aoede.widget/music.scpt'"

refreshFrequency: 1000

style: """
  position: absolute
  bottom: 40px
  left: 40px
  color: rgb(255,255,255,0.8)
  display: flex

  #art>img
    height: 100px
    width: 100px
  //  border-radius: 10%

  #content
    font-size: 0.8em
    position: absolute
    height: 100px
    width: calc(100vw - 80px)
    white-space: nowrap
    overflow: hidden

  #title
    font-family: Nexa Bold, Gotham Bold, Hiragino Kaku Gothic StdN W8
    font-weight: 700
    font-size: 2.7rem
    line-height: 80px
    padding-left: 20px
    text-transform: uppercase

  #subtitle
    font-family: Nexa Light, Proxima Nova
    font-weight: 100
    font-size: 1.8rem
    line-height: 5px
    position: absolute
    bottom: 20px
    padding-left: 20px
    text-transform: uppercase
"""

render: -> """
  <div id="art"></div>
  <div id="content">
    <div id="title">Aoede v1.0</div>
    <div id="subtitle">Written by Pyraxo</div>
  </div>
"""

update: (output, domEl) ->
  name_chars = 30
  album_chars = 40

  args = output.split("^")
  if $(domEl).find('#title').text().substring(0, 20) == args[0].substring(0, 20)
    return

  if args[0].length > name_chars
    args[0] = args[0].substring(0, 20)+" •••"

  if args[1].length > album_chars
    args[1] = args[1].substring(0, 25)+" ..."

  $(domEl).find('#title').text("#{args[0]}")
  $(domEl).find('#subtitle').text("#{args[1]}")

  if args[0] != " " && args[1] != " "
    $(domEl).find('#art').html("<img style=background:url('Aoede.widget/images/albumart.jpg');background-size:100px>")
  else
    $(domEl).find('#art').html("<img src='Aoede.widget/images/default.jpg'>")
