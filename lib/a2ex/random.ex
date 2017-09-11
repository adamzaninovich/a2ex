defmodule A2ex.Random do
  use Alice.Handler

  alias A2ex.State

  route ~r/\bgoo+d ?morning!*\b/i,                         :good_morning
  route ~r/\bflowery bullshit\b/i,                         :flowery_bullshit
  route ~r/\btro+l+(o+l+)+(o+)?\b/i,                       :trololol
  route ~r/\btable ?flip\b/i,                              :table_flip
  route ~r/\bbig ?data\b/i,                                :big_data
  route ~r/\bcocaine\b/i,                                  :cocaine
  route ~r/\bdemeter\b/i,                                  :say_demeter_again
  route ~r/\bgrapes\b/i,                                   :grapes
  route ~r/\bbusted\b/i,                                   :busted
  route ~r/\bdev[- ]?ops\b/i,                              :devops
  route ~r/\bIT IS DECIDED\!?\b/,                          :it_is_decided
  route ~r/\bmadness\b/i,                                  :this_is_sparta
  route ~r/\bmind blown\b/i,                               :mind_blown
  route ~r/\bthanks,? alice\b/i,                           :thanks
  command ~r/thanks/i,                                     :thanks
  route ~r/\b(a+w+ ?y+i+s+|bread ?crumbs)!*\b/i,           :aww_yiss
  route ~r/\bdark ?souls?\b/i,                             :i_dont_care
  route ~r/\bthe games?\b/i,                               :the_game
  route ~r/\b(I )?(luv|love|:heart:) (yo)?u,? alice\b/i,   :alice_love
  route ~r/\balice,? I (love|:heart:) you\b/i,             :alice_love
  command ~r/\bI (love|:heart:) you\b/i,                   :alice_love
  route ~r/\bmic ?drop\b/i,                                :mic_drop
  route ~r/\bdrop ?(the)? ?mic\b/i,                        :mic_drop
  route ~r/\bclear ?(your)? ?cache\??\b/i,                 :cache_bug
  route ~r/\b(dis|this)( is)? gon(na)? be? g(u|oo)d\b/i,   :dis_gon_b_gud
  route ~r/\b(wub ?(wub)?|dub(step)?|d+rop.*bas(s|e))\b/i, :dddddrop_the_bass
  route ~r/\b(mad|angry|rage)\b/i,                         :u_mad_bro
  route ~r/\bno+pe+\b/i,                                   :nope_nope_nope
  route ~r/\bgooo+d\b/i,                                   :goooood
  route ~r/\b(ha(ha)+|lol)\b/i,                            :haha
  route ~r/\bto+t(ally|es)\b/i,                            :toooootally
  command ~r/\beggplant me\z/i,                            :single_eggplant
  command ~r/\beggplant me(?<num>\d+)\z/i,                 :multi_eggplant
  command ~r/\ba?re? (yo)?u high\??/i,                     :are_you_high

  route ~r/\brandom\.debug\b/i, :debug

  def debug(msg, _state) do
    """
    ```
    #{inspect State.get_all()}
    ```
    """
    |> reply(msg)
  end

  @doc false
  def flowery_bullshit(msg, _state), do: "http://i.imgur.com/ioLp3DW.jpg" |> reply(msg)

  @doc false
  def good_morning(msg, _state) do
    chance_reply(msg, 0.8, "http://i.imgur.com/ioLp3DW.jpg", "http://i.imgur.com/OAFDS8L.jpg")
  end

  @doc false
  def trololol(msg, _state), do: "http://i.imgur.com/ynr0Qms.gif" |> reply(msg)

  @doc false
  def table_flip(msg, _state), do: "http://i.imgur.com/IFabn5c.gif" |> reply(msg)

  @doc "`big data`/`bigdata` - BIG data"
  def big_data(msg, _state), do: "http://i.imgur.com/U6m4s4o.jpg" |> reply(msg)

  @doc "`cocaine` - ba ba da ba ba da cocaine!"
  def cocaine(msg, _state) do
    ~w[
      http://i.imgur.com/A3QICEQ.gif
      http://i.imgur.com/biaviGH.gif
      http://i.imgur.com/rIKgVmY.gif
      http://i.imgur.com/Oi6QYeH.jpg
    ]
    |> random_reply(msg)
  end

  @doc "`demeter` - try me"
  def say_demeter_again(msg, _state), do: "http://i.imgur.com/Z0jvLNm.jpg" |> reply(msg)

  @doc "`grapes` - your grapes"
  def grapes(msg, _state), do: chance_reply(msg, 0.05, "http://i.imgur.com/v4y3BLl.gif", ":grapes:")

  @doc "`busted` - get busted by Mr. Biggs"
  def busted(msg, _state), do: "http://i.imgur.com/MasM57I.png" |> reply(msg)

  @doc "`devops`/`dev-ops`/`dev ops` - ops problem now!"
  def devops(msg, _state), do: "http://i.imgur.com/6sNQ3yt.jpg" |> reply(msg)

  @doc "`IT IS DECIDED` - nail that decision coffin"
  def it_is_decided(msg, _state), do: "http://i.imgur.com/80PQSCo.gif" |> reply(msg)

  @doc "`mind blown` - blow your mind"
  def mind_blown(msg, _state), do: "http://i.imgur.com/lr4KJPQ.gif" |> reply(msg)

  @doc "`this is <anything>` - THIS IS SPARTA"
  def this_is_sparta(msg, _state), do: "http://i.imgur.com/ydJ3Vcr.jpg" |> reply(msg)

  @doc "Either `thanks alice` or `@alice thanks` - tell Alice thanks"
  def thanks(msg, _state), do: "no prob, bob" |> reply(msg)

  @doc "`aww yiss`/`bread crumbs` - motha fuckin' bread crumbs"
  def aww_yiss(msg, _state) do
    ~w[http://i.imgur.com/SEQTUr3.jpg http://i.imgur.com/znLCJe3.gif http://i.imgur.com/6yJXSqr.gif]
    |> random_reply(msg)
  end

  @doc "`dark souls` - find out just how much Alice cares about Dark Souls"
  def i_dont_care(msg, _state), do: "http://i.imgur.com/29A4xj5.gif" |> reply(msg)

  @doc ":troll:"
  def the_game(%Alice.Message{text: text} = msg, _state) do
    handle_the_game(msg, String.downcase(text))
  end

  defp handle_the_game(msg, "i lost the game"), do: msg
  defp handle_the_game(%Alice.Message{room: room} = msg, _) do
    next_loss = State.get({:next_loss, room}, 0)
    :calendar.universal_time
    |> :calendar.datetime_to_gregorian_seconds
    |> game_response(next_loss, msg)
  end

  defp game_response(now, next_loss, _msg) when now < next_loss, do: :ok
  defp game_response(now, _, %Alice.Message{room: room} = msg) do
    State.put({:next_loss, room}, now + (30))
    chance_reply(msg, 0.25, "http://i.imgur.com/Z8awIpt.png", "I lost the game")
  end

  @doc """
  Express some love for Alice
      `I love you alice`
      `I `:heart:` you, alice`
      `alice, I love`/:heart:` you`
      `@alice I love`/:heart:` you`
  """
  def alice_love(%Alice.Message{user: %Alice.User{id: "U0LADD3C4"}}=msg, _state) do
    reply(msg, "aww, we're such good friends, <@U0LADD3C4>! :+1:")
  end
  def alice_love(msg, _state) do
    love = msg.captures[2]
    emoji = Enum.random(~w[:wink: :heart_eyes: :kissing_heart: :hugging_face:])
    user_reply =
      case msg.user do
        %{id: id} -> "<@#{id}>"
        name when is_binary(name) -> name
        _ -> "human"
      end
    reply(msg, "aww, I #{love} you too, #{user_reply}! #{emoji}")
  end

  @doc "`mic drop` - drop the mic"
  def mic_drop(msg, _state) do
    ~w[http://i.imgur.com/MpEqxwM.gif
      http://i.imgur.com/YANYG8d.gif
      http://i.imgur.com/ZxZUyH9.gif
      http://i.imgur.com/9XVQlvS.gif
      http://i.imgur.com/XTWiamq.gif
      http://i.imgur.com/3hkSF89.gif]
    |> random_reply(msg)
  end

  @doc "`clear your cache` - you may have a cache bug if..."
  def cache_bug(msg, _state) do
    ~w[http://i.imgur.com/mus48mo.jpg
      http://i.imgur.com/Mt669js.png
      http://i.imgur.com/OzI9RZq.jpg]
    |> random_reply(msg)
  end

  @doc "`dis gon b gud`/`this is gonna to be good` - sit back and enjoy the show"
  def dis_gon_b_gud(msg, _state) do
    ~w[http://i.imgur.com/j7PKhl1.gif
      http://i.imgur.com/mtHKey3.gif
      http://i.imgur.com/uh5A6.gif
      http://i.imgur.com/o3o1fU3.gif]
    |> random_reply(msg)
  end

  @doc """
  Epic Bass Drop Time
      `dddddddrop the bass`
      `wub wub`
      `dubstep`
  """
  def dddddrop_the_bass(msg, _state) do
    ~w[
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr03/2013/2/15/9/anigif_enhanced-buzz-27236-1360939858-5.gif
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr01/2013/2/15/9/anigif_enhanced-buzz-5139-1360939681-14.gif
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr02/2013/2/15/11/enhanced-buzz-3235-1360947432-2.jpg
      http://i1212.photobucket.com/albums/cc460/bbtlv/dubstep.gif
      http://i.imgur.com/kUtovs7.gif
    ]
    |> random_reply(msg)
  end

  @doc "`mad`/`angry`/`rage` - u mad bro?"
  def u_mad_bro(msg, _state) do
    ~w[http://24.media.tumblr.com/e48acd4c34a62200a81df7259ab31d57/tumblr_n2kygg41US1rzgx44o1_400.gif
      http://i1248.photobucket.com/albums/hh490/Andrea2awesome/internet-memes-y-u-mad-tho.jpg
      http://i.imgur.com/KEh9WOT.png
      http://i.imgur.com/LupvkMH.jpg]
    |> random_reply(msg)
  end

  @doc "`nope` - nope nope nope"
  def nope_nope_nope(msg, _state) do
    ~w[http://i.imgur.com/ZG8Y5XQ.gif
      http://i.imgur.com/Bebd11u.gif
      http://i.imgur.com/piqluC8.jpg
      http://i.imgur.com/UUoYZjM.jpg
      http://i.imgur.com/oQsSbYC.gif
      http://i.imgur.com/HIN4HrI.gif
      http://i.imgur.com/yBE4JbR.jpg
      http://i.imgur.com/DgczUtV.png
      http://i.imgur.com/RgylcEM.png
      http://i.imgur.com/LRBIPMP.png]
    |> random_reply(msg)
  end

  @doc "`goood` - embrace your hate"
  def goooood(msg, _state) do
    ~w[http://i.imgur.com/1jtr4HM.png
      http://i.imgur.com/j83QRp7.png
      http://i.imgur.com/rm8NcQC.jpg
      http://i.imgur.com/nmC7Hnb.jpg]
    |> random_reply(msg)
  end

  @doc "`totally` - totes magotes"
  def toooootally(msg, _state) do
    chance_reply(msg, 0.2, "http://i.imgur.com/XuTdELg.jpg", generate_totally())
  end

  defp generate_totally, do: "to#{String.duplicate("o", Enum.random(0..9))}tally"

  @doc "😂"
  def haha(msg, _state) do
    haha_count = State.get(:haha_count, 0)
    case haha_count do
      93 ->
        State.put(:haha_count, 0)
        reply(msg, "https://s3.amazonaws.com/giphymedia/media/Ic97mPViHEG5O/giphy.gif")
      _ ->
        State.update(:haha_count, 1, &(&1 + 1))
    end
  end

  @doc "`eggplant me` - get an eggplant from Alice"
  def single_eggplant(msg, _state), do: eggplant(1, msg)

  @doc "`eggplant me (num)` - get many eggplants from Alice"
  def multi_eggplant(%Alice.Message{captures: %{"num" => num}} = msg, _state) do
    eggplant(String.to_integer(num), msg)
  end

  defp eggplant(num, msg) do
    ":eggplant: "
    |> String.duplicate(num)
    |> reply(msg)
  end

  @doc false
  def are_you_high(msg, _state), do: reply(msg, "http://i.imgur.com/gdnNcF1.jpg")
end
