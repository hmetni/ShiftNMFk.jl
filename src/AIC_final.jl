function AIC_final( RECON, SILL_AVG, numT, nd)
	siluet= SILL_AVG
	norm  = RECON
	ndata = numT*nd	# nd is the number of detectors, numT is the number of time points (80 in diffNMF example)
	# Finds the optimal number of sources by minimizing AIC
	# Takes as inputs two vectors with the same size (norm and silhouette) and a
	# scalar ndata (total number of data points)
	aic_values = zeros(size(norm))
	for i = 1:length(norm)
		if siluet[i] > 0.7
			aic_values[i] = 2*i + ndata*log(norm[i]/ndata)
		else
			aic_values[i] = NaN
		end
	end
	aic_min = minimum(aic_values)
	nopt = find(aic_values .== aic_min)
	return aic_min, nopt
end