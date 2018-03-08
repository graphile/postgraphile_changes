# Results

These are the results of running the various GraphQL queries against a database running on a Mid-2011 iMac. You can reproduce this test by running `node runner`.

- Query: the GraphQL query that we execute
- Program: which version of PostGraphQL/PostGraphile are we using?
- Concurrency: how many requests do we try and make the server process in parallel?
- Requests sent: how many requests did we actually send to the server?
- Requests complete: how many requests completed successfully?
- Requests/second avg: the total number of requests divided by the total number of seconds
- Latency min: the fastest response time any of the queries gave
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with `--cluster-workers` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

<table>
<thead><tr>
<th><b>Query</b></th>
<th><b>program</b></th>
<th><b>Concurrency</b></th>
<th><b>requests sent</b></th>
<th><b>requests complete</b></th>
<th><b>requests/second avg</b></th>
<th><b>latency min</b></th>
<th><b>latency p50</b></th>
<th><b>latency p90</b></th>
<th><b>latency p99</b></th>
<th><b>max RSS</b></th>
</tr></thead>
<tbody>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>20.05</td>
<td>48</td>
<td>49</td>
<td>51</td>
<td>58</td>
<td>78924</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>67.67</td>
<td>98</td>
<td>129</td>
<td>189</td>
<td>222</td>
<td>81876</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>81.19</td>
<td>144</td>
<td>1202</td>
<td>1240</td>
<td>1328</td>
<td>99316</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>18.77</td>
<td>50</td>
<td>51</td>
<td>59</td>
<td>62</td>
<td>43476</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>68.58</td>
<td>96</td>
<td>128</td>
<td>191</td>
<td>209</td>
<td>43876</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>82.48</td>
<td>275</td>
<td>1158</td>
<td>1324</td>
<td>1534</td>
<td>47268</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>15.23</td>
<td>61</td>
<td>63</td>
<td>73</td>
<td>80</td>
<td>120152</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>50.75</td>
<td>121</td>
<td>185</td>
<td>263</td>
<td>295</td>
<td>126400</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>56.61</td>
<td>197</td>
<td>1727</td>
<td>1798</td>
<td>1884</td>
<td>165316</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>192.23</td>
<td>4</td>
<td>5</td>
<td>7</td>
<td>9</td>
<td>82864</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>320.78</td>
<td>18</td>
<td>28</td>
<td>47</td>
<td>52</td>
<td>85300</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>412.1</td>
<td>90</td>
<td>238</td>
<td>269</td>
<td>293</td>
<td>101604</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>164.98</td>
<td>5</td>
<td>6</td>
<td>8</td>
<td>9</td>
<td>43224</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>411.2</td>
<td>8</td>
<td>18</td>
<td>46</td>
<td>63</td>
<td>43628</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>582.21</td>
<td>40</td>
<td>163</td>
<td>175</td>
<td>206</td>
<td>46692</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>142.35</td>
<td>6</td>
<td>6</td>
<td>9</td>
<td>12</td>
<td>100656</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>184.26</td>
<td>31</td>
<td>47</td>
<td>81</td>
<td>93</td>
<td>107804</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>237.23</td>
<td>105</td>
<td>415</td>
<td>448</td>
<td>520</td>
<td>139252</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>179.11</td>
<td>5</td>
<td>5</td>
<td>8</td>
<td>8</td>
<td>80276</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>299.81</td>
<td>18</td>
<td>30</td>
<td>41</td>
<td>56</td>
<td>82924</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>355.4</td>
<td>93</td>
<td>268</td>
<td>297</td>
<td>339</td>
<td>101176</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>134.54</td>
<td>6</td>
<td>7</td>
<td>10</td>
<td>12</td>
<td>43188</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>372.31</td>
<td>8</td>
<td>19</td>
<td>58</td>
<td>72</td>
<td>43588</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>591.99</td>
<td>34</td>
<td>157</td>
<td>170</td>
<td>197</td>
<td>46908</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>46.74</td>
<td>20</td>
<td>20</td>
<td>25</td>
<td>27</td>
<td>118248</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>71.1</td>
<td>102</td>
<td>131</td>
<td>176</td>
<td>207</td>
<td>125292</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>76.81</td>
<td>181</td>
<td>1286</td>
<td>1342</td>
<td>1391</td>
<td>161864</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>14.78</td>
<td>64</td>
<td>66</td>
<td>73</td>
<td>73</td>
<td>88460</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>30.4</td>
<td>288</td>
<td>331</td>
<td>344</td>
<td>358</td>
<td>90916</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>34.5</td>
<td>365</td>
<td>2845</td>
<td>2953</td>
<td>3010</td>
<td>119308</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>15.11</td>
<td>65</td>
<td>66</td>
<td>67</td>
<td>71</td>
<td>43508</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>51.91</td>
<td>105</td>
<td>170</td>
<td>245</td>
<td>382</td>
<td>43900</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>52.61</td>
<td>302</td>
<td>1806</td>
<td>2267</td>
<td>2484</td>
<td>47304</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>2.01</td>
<td>476</td>
<td>486</td>
<td>530</td>
<td>532</td>
<td>319444</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>2.57</td>
<td>2332</td>
<td>3796</td>
<td>4397</td>
<td>4967</td>
<td>460540</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>2.47</td>
<td>3691</td>
<td>40172</td>
<td>42366</td>
<td>43060</td>
<td>739480</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>111.95</td>
<td>8</td>
<td>8</td>
<td>10</td>
<td>12</td>
<td>86492</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>201.47</td>
<td>29</td>
<td>49</td>
<td>63</td>
<td>70</td>
<td>91232</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>229.73</td>
<td>110</td>
<td>421</td>
<td>449</td>
<td>534</td>
<td>109976</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>89.81</td>
<td>9</td>
<td>11</td>
<td>13</td>
<td>14</td>
<td>43348</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>298.78</td>
<td>18</td>
<td>29</td>
<td>51</td>
<td>61</td>
<td>43760</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>398.96</td>
<td>51</td>
<td>232</td>
<td>254</td>
<td>308</td>
<td>46996</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>19.41</td>
<td>45</td>
<td>50</td>
<td>62</td>
<td>62</td>
<td>137412</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>28.76</td>
<td>155</td>
<td>345</td>
<td>392</td>
<td>432</td>
<td>158692</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>29.77</td>
<td>405</td>
<td>3322</td>
<td>3422</td>
<td>3558</td>
<td>182280</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>16.37</td>
<td>58</td>
<td>60</td>
<td>64</td>
<td>76</td>
<td>94320</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>29.89</td>
<td>167</td>
<td>330</td>
<td>413</td>
<td>446</td>
<td>106668</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>35.33</td>
<td>271</td>
<td>2793</td>
<td>2902</td>
<td>3027</td>
<td>120908</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>15.01</td>
<td>61</td>
<td>64</td>
<td>74</td>
<td>87</td>
<td>43360</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>49.83</td>
<td>82</td>
<td>186</td>
<td>248</td>
<td>278</td>
<td>43756</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#0A0">postgraphile --cluster-workers 3<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>51.58</td>
<td>244</td>
<td>1700</td>
<td>2620</td>
<td>2931</td>
<td>47172</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>1</td>
<td>14</td>
<td>14</td>
<td>1.41</td>
<td>630</td>
<td>690</td>
<td>812</td>
<td>816</td>
<td>600196</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>10</td>
<td>50</td>
<td>50</td>
<td>1.62</td>
<td>1854</td>
<td>6472</td>
<td>7730</td>
<td>9908</td>
<td>889896</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji.graphql</a>
</th>
<td><span style="color:#A00">postgraphql<span style="color:#FFF"></span></span></td>
<td>100</td>
<td>410</td>
<td>410</td>
<td>1.61</td>
<td>5756</td>
<td>61129</td>
<td>64283</td>
<td>65459</td>
<td>1719876</td>
</tr>
</tbody>
</table>
