def matchemail(email)
  !!email.match(/\A[\w.+-]+@[\w-]+\.\w+\z/)
end
