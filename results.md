# Results

PostGraphile v4 is now in beta! https://github.com/graphile/postgraphile/releases/tag/v4.0.0-beta.0

Below are the results of running various GraphQL queries against [a sample database](db/reset.sh), with everything running on a Mid-2011 iMac.

- Query: the GraphQL query that we execute
- Version: which version of PostGraphQL/PostGraphile are we using?
- Conc: concurrency - how many requests do we try and make the server process in parallel?
- req/s: average requests per second - the total number of requests divided by the total number of seconds
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with `v4 cluster` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

<table>
<thead><tr>
<th><b>Query</b></th>
<th>Version</th>
<th>Conc</th>
<th>req/s</th>
<th><b>latency p50</b></th>
<th><b>latency p90</b></th>
<th><b>latency p99</b></th>
<th><b>max RSS</b></th>
</tr></thead>
<tbody>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>1</td>
<td>19.06</td>
<td>52</td>
<td>53</td>
<td>58</td>
<td>91972</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>10</td>
<td>77.06</td>
<td>127</td>
<td>147</td>
<td>185</td>
<td>92404</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>100</td>
<td>185.48</td>
<td>12</td>
<td>1553</td>
<td>1942</td>
<td>133204</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>18.87</td>
<td>53</td>
<td>54</td>
<td>58</td>
<td>69500</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>75.91</td>
<td>128</td>
<td>159</td>
<td>195</td>
<td>71632</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>186.46</td>
<td>13</td>
<td>1556</td>
<td>2005</td>
<td>73560</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>1</td>
<td>14.62</td>
<td>67</td>
<td>72</td>
<td>76</td>
<td>378240</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>10</td>
<td>54.36</td>
<td>178</td>
<td>207</td>
<td>327</td>
<td>416056</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>100</td>
<td>90.39</td>
<td>74</td>
<td>3077</td>
<td>3530</td>
<td>588884</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>1</td>
<td>387.34</td>
<td>2</td>
<td>3</td>
<td>4</td>
<td>111844</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>10</td>
<td>810.48</td>
<td>11</td>
<td>14</td>
<td>34</td>
<td>118720</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>100</td>
<td>770.29</td>
<td>110</td>
<td>164</td>
<td>357</td>
<td>162100</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>315.58</td>
<td>3</td>
<td>3</td>
<td>5</td>
<td>92016</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>790.42</td>
<td>7</td>
<td>11</td>
<td>30</td>
<td>104832</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>1014.87</td>
<td>77</td>
<td>86</td>
<td>148</td>
<td>102576</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>1</td>
<td>179.49</td>
<td>5</td>
<td>6</td>
<td>10</td>
<td>288692</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>10</td>
<td>262.32</td>
<td>36</td>
<td>39</td>
<td>138</td>
<td>306260</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>100</td>
<td>251.49</td>
<td>366</td>
<td>495</td>
<td>522</td>
<td>370348</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>1</td>
<td>312.4</td>
<td>3</td>
<td>3</td>
<td>7</td>
<td>98708</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>10</td>
<td>605.93</td>
<td>16</td>
<td>17</td>
<td>34</td>
<td>101088</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>100</td>
<td>601.88</td>
<td>155</td>
<td>213</td>
<td>286</td>
<td>146060</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>278.83</td>
<td>3</td>
<td>4</td>
<td>5</td>
<td>88824</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>1000.99</td>
<td>9</td>
<td>12</td>
<td>29</td>
<td>96172</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>839.07</td>
<td>96</td>
<td>131</td>
<td>450</td>
<td>98936</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>1</td>
<td>47.87</td>
<td>19</td>
<td>25</td>
<td>28</td>
<td>357984</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>10</td>
<td>77.09</td>
<td>125</td>
<td>143</td>
<td>287</td>
<td>426548</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>100</td>
<td>104.72</td>
<td>1385</td>
<td>1658</td>
<td>1708</td>
<td>662076</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>1</td>
<td>15.98</td>
<td>62</td>
<td>63</td>
<td>78</td>
<td>97000</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>10</td>
<td>33.66</td>
<td>292</td>
<td>352</td>
<td>426</td>
<td>99904</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>100</td>
<td>38.55</td>
<td>2736</td>
<td>2913</td>
<td>3289</td>
<td>134268</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>15.86</td>
<td>63</td>
<td>64</td>
<td>67</td>
<td>55248</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>59.38</td>
<td>163</td>
<td>232</td>
<td>294</td>
<td>62956</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>147.79</td>
<td>381</td>
<td>1768</td>
<td>2159</td>
<td>67600</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.88</td>
<td>509</td>
<td>648</td>
<td>690</td>
<td>535408</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>10</td>
<td>2.28</td>
<td>4115</td>
<td>4675</td>
<td>4911</td>
<td>656592</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>100</td>
<td>28.59</td>
<td>91</td>
<td>157</td>
<td>1120</td>
<td>1396628</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>1</td>
<td>172.17</td>
<td>5</td>
<td>6</td>
<td>8</td>
<td>100984</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>10</td>
<td>360.06</td>
<td>27</td>
<td>29</td>
<td>45</td>
<td>110868</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>100</td>
<td>340.37</td>
<td>289</td>
<td>331</td>
<td>376</td>
<td>155388</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>155.14</td>
<td>6</td>
<td>7</td>
<td>10</td>
<td>85492</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>602.85</td>
<td>16</td>
<td>20</td>
<td>41</td>
<td>90292</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>578.82</td>
<td>163</td>
<td>220</td>
<td>345</td>
<td>98452</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>1</td>
<td>21.37</td>
<td>45</td>
<td>47</td>
<td>135</td>
<td>336336</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>10</td>
<td>30.42</td>
<td>303</td>
<td>421</td>
<td>457</td>
<td>377932</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>100</td>
<td>61.05</td>
<td>150</td>
<td>3794</td>
<td>3936</td>
<td>586716</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>1</td>
<td>16.59</td>
<td>59</td>
<td>61</td>
<td>78</td>
<td>108224</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>10</td>
<td>32.06</td>
<td>310</td>
<td>342</td>
<td>425</td>
<td>114284</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>100</td>
<td>32.39</td>
<td>3364</td>
<td>3539</td>
<td>3726</td>
<td>225632</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>16.32</td>
<td>60</td>
<td>62</td>
<td>78</td>
<td>55856</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>56.75</td>
<td>173</td>
<td>230</td>
<td>285</td>
<td>62956</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>58.43</td>
<td>1759</td>
<td>1823</td>
<td>2093</td>
<td>68640</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.38</td>
<td>687</td>
<td>1003</td>
<td>1123</td>
<td>1048420</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>10</td>
<td>1.35</td>
<td>6567</td>
<td>8277</td>
<td>10105</td>
<td>1291316</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>100</td>
<td>1.41</td>
<td>731</td>
<td>2582</td>
<td>21468</td>
<td>1775360</td>
</tr>
</tbody>
</table>
