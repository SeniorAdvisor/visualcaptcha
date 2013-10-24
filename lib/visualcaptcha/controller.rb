module VisualCaptcha
  module ControllerHelpers
    def visual_captcha_valid?
      return true if Rails.env.test?

      if params["captcha-value"]
        return false unless session[:captcha]
        challenge = session[:captcha]
        result = challenge.answer.encrypted == params["captcha-value"]
        return result
      else
        return false
      end
    end
  end
end
