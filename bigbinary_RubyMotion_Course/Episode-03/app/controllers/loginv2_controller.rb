class Loginv2Controller < UIViewController
  def viewDidLoad
    super
    rmq.append(UIView, :login_form).tap do |q|
      email = q.append(UITextField, :email).get
      password = q.append(UITextField, :password).get

      rmq(email).style do |st|
        st.frame = {l: 100, t: 60, w: 120, h: 30}
        st.background_color = rmq.color.white
      end

      rmq(password).style do |st|
        st.frame = {l: 100, t: 110, w: 120, h: 30}
        st.background_color = rmq.color.white
      end

      rmq(:login_form).style do |st|
        st.frame = {l: 60, t: 30, w: 200, h: 200}
        st.background_color = rmq.color.white
      end
    end
  end
end