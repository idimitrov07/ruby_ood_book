# example form the rails framework (active_record/relations/finder_methods)
def first(*args)
  if args.any?
    if args.first.kind_of?(Integer) || (loaded? && !args.first.kind_of?(Hash))
      to_s.first(*args)
    else
      apply_finder_options(args.first).first
    end
  else
    find_first
  end
end

# the code is using kind_of?, but classes are from ruby core library,
# Integer and Hash and are more stable
